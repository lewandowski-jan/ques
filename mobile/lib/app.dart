import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:ques/features/auth/auth_notifier.dart';
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

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: authNotifier.signOut,
            child: const Text('Sign out'),
          ),
        ),
      ),
    );
  }
}

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: context.colors.background,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: emailController,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
              ),
              const SizedBox(height: 32),
              TextButton(
                onPressed: () {
                  authNotifier.signIn(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                },
                child: const Text('Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
