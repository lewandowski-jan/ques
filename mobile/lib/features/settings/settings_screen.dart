import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/auth/auth_cubit.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;
    final user =
        authState.authenticated ? (authState as AuthAuthenticated).user : null;
    final userEmail = user?.email;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 36),
              QSSettingsSection(
                title: context.l10n.settings_page_app_settings,
                buttons: [
                  SettingsButtonData(
                    text: context.l10n.settings_page_battery_settings,
                    onTap: () {},
                  ),
                  SettingsButtonData(
                    text: context.l10n.settings_page_notifications_settings,
                    onTap: () {},
                  ),
                ],
                style: SettingsSectionStyle.primary,
              ),
              const SizedBox(height: 24),
              QSSettingsSection(
                title: context.l10n.settings_page_information,
                buttons: [
                  SettingsButtonData(
                    text: context.l10n.settings_page_privacy_notice,
                    onTap: () {},
                  ),
                  SettingsButtonData(
                    text: context.l10n.settings_page_acknowledgements,
                    onTap: () {},
                  ),
                ],
                style: SettingsSectionStyle.secondary,
              ),
              const SizedBox(height: 38),
              if (userEmail != null) ...[
                QSText(
                  context.l10n.settings_page_you_are_signed_in_as,
                  style: context.textTheme.displaySmall,
                  color: context.colors.primaryLight,
                ),
                const SizedBox(height: 4),
                QSText(
                  userEmail,
                  style: context.textTheme.labelSmall,
                  color: context.colors.primaryLight,
                ),
                const SizedBox(height: 20),
              ],
              QSText(
                context.l10n.settings_page_ques,
                style: context.textTheme.titleSmall,
                color: context.colors.primary,
              ),
              const SizedBox(height: 4),
              QSText(
                'version 1.0.0',
                style: context.textTheme.displaySmall,
                color: context.colors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
