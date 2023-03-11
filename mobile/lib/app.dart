import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ques/features/router/router.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';

class QSApp extends ConsumerWidget {
  const QSApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qsRouter = ref.watch(qsRouterProvider);

    return MaterialApp.router(
      locale: const Locale('en'),
      supportedLocales: QSLocalizations.supportedLocales,
      localizationsDelegates: QSLocalizations.localizationsDelegates,
      onGenerateTitle: (context) => context.l10n.app_title,
      theme: QSTheme.light(context),
      darkTheme: QSTheme.dark(context),
      routerConfig: qsRouter.router,
    );
  }
}
