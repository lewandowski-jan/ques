import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ques/features/auth/auth_notifier.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: QSTextButton(
            onPressed: authNotifier.signOut,
            text: context.l10n.sign_out_button,
          ),
        ),
      ),
    );
  }
}
