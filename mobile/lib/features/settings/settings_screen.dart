import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/auth/auth_cubit.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: QSPrimaryButton(
            onPressed: authCubit.signOut,
            text: context.l10n.sign_out_button,
          ),
        ),
      ),
    );
  }
}
