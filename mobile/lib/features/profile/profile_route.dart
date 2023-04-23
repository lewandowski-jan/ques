import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/auth/auth_cubit.dart';
import 'package:ques/features/profile/change_name_route.dart';
import 'package:ques/features/profile/change_password_route.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class ProfileRoute extends MaterialPageRoute<void> {
  ProfileRoute() : super(builder: (_) => const ProfileScreen());
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;
    final user = authState.whenOrNull(authenticated: (user) => user);
    final userEmail = user?.email;
    final userName = user?.displayName;

    return Scaffold(
      appBar: QSAppBar(title: context.l10n.account_page_account),
      backgroundColor: context.colors.background,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 28),
            const Center(child: QSAvatar(size: 100)),
            const SizedBox(height: 24),
            if (userName != null) ...[
              QSText(
                userName,
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
            ],
            if (userEmail != null)
              QSText(
                userEmail,
                style: context.textTheme.titleSmall,
                color: context.colors.primaryLight,
              ),
            const SizedBox(height: 56),
            QSSettingsSection(
              buttons: [
                SettingsButtonData(
                  text: context.l10n.account_page_change_name,
                  onTap: () => Navigator.of(context).push(
                    ChangeNameRoute(
                      initialName: userName,
                    ),
                  ),
                ),
              ],
              style: SettingsSectionStyle.primary,
            ),
            const SizedBox(height: 24),
            QSSettingsSection(
              buttons: [
                SettingsButtonData(
                  text: context.l10n.account_page_change_password,
                  onTap: () => Navigator.of(context).push(
                    ChangePasswordRoute(),
                  ),
                ),
                SettingsButtonData(
                  text: context.l10n.account_page_sign_out,
                  onTap: context.read<AuthCubit>().signOut,
                ),
              ],
              style: SettingsSectionStyle.accent,
            ),
          ],
        ),
      ),
    );
  }
}
