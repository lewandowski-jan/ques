import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/bluetooth/bluetooth_cubit.dart';
import 'package:ques/features/devices/devices_cubit.dart';
import 'package:ques/features/language/language_cubit.dart';
import 'package:ques/features/location/location_cubit.dart';
import 'package:ques/features/router/router.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';

class QSApp extends HookWidget {
  const QSApp({super.key});

  @override
  Widget build(BuildContext context) {
    usePostFrameEffect(
      () {
        Jiffy.locale(context.read<LanguageCubit>().state.languageCode);
      },
      [],
    );

    useOnAppLifecycleStateChange((previous, current) {
      final wasPaused = previous == AppLifecycleState.paused;
      final wasInactive = previous == AppLifecycleState.inactive;
      final isResumed = current == AppLifecycleState.resumed;

      if ((wasPaused || wasInactive) && isResumed) {
        context.read<BluetoothCubit>().init();
        context.read<LocationCubit>().init();
        context.read<DevicesCubit>().init();
      }
    });

    final router = context.read<QSRouter>();

    return OKToast(
      position: ToastPosition.bottom,
      child: MaterialApp.router(
        locale: context.watch<LanguageCubit>().state,
        supportedLocales: QSLocalizations.supportedLocales,
        localizationsDelegates: QSLocalizations.localizationsDelegates,
        onGenerateTitle: (context) => context.l10n.app_title,
        theme: QSTheme.light(context),
        darkTheme: QSTheme.dark(context),
        routerConfig: router.router,
      ),
    );
  }
}
