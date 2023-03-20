import 'package:flutter/material.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/bluetooth/bluetooth_cubit.dart';
import 'package:ques/features/devices/devices_cubit.dart';
import 'package:ques/features/location/location_cubit.dart';
import 'package:ques/features/router/router.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';

class QSApp extends HookWidget {
  const QSApp({super.key});

  @override
  Widget build(BuildContext context) {
    useOnAppLifecycleStateChange((previous, current) {
      final wasPaused = previous == AppLifecycleState.paused;
      final wasInactive = previous == AppLifecycleState.inactive;
      final isResumed = current == AppLifecycleState.resumed;

      if ((wasPaused || wasInactive) && isResumed) {
        context.read<BluetoothCubit>().init();
        context.read<LocationCubit>().subscribeToLocationChanges();
        context.read<DevicesCubit>().init();
      }
    });

    final router = context.read<QSRouter>();

    return MaterialApp.router(
      locale: const Locale('en'),
      supportedLocales: QSLocalizations.supportedLocales,
      localizationsDelegates: QSLocalizations.localizationsDelegates,
      onGenerateTitle: (context) => context.l10n.app_title,
      theme: QSTheme.light(context),
      darkTheme: QSTheme.dark(context),
      routerConfig: router.router,
    );
  }
}
