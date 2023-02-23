import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ques/features/auth/auth_notifier.dart';
import 'package:ques/features/auth/sign_in_screen.dart';
import 'package:ques/features/home/home_screen.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';

class QSApp extends StatelessWidget {
  const QSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      supportedLocales: QSLocalizations.supportedLocales,
      localizationsDelegates: QSLocalizations.localizationsDelegates,
      onGenerateTitle: (context) => context.l10n.app_title,
      theme: QSTheme.light(context),
      darkTheme: QSTheme.dark(context),
      home: const Home(),
    );
  }
}

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return authState is AuthAuthenticated
        ? const HomeScreen()
        : const SignInScreen();
  }
}
