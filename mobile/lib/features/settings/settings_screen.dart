import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/auth/auth_cubit.dart';
import 'package:ques/features/battery_strategy/battery_strategy_route.dart';
import 'package:ques/features/language/language_route.dart';
import 'package:ques/features/notifications_strategy/notifications_strategy_route.dart';
import 'package:ques/features/settings/privacy_notice_route.dart';
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
                    text: context.l10n.settings_page_battery_saving,
                    onTap: () => Navigator.of(context).push(
                      BatteryStrategyRoute(),
                    ),
                  ),
                  SettingsButtonData(
                    text: context.l10n.settings_page_change_language,
                    onTap: () => Navigator.of(context).push(
                      LanguageRoute(),
                    ),
                  ),
                  SettingsButtonData(
                    text: context.l10n.settings_page_notifications_management,
                    onTap: () => Navigator.of(context).push(
                      NotificationsStrategyRoute(),
                    ),
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
                    onTap: () => Navigator.of(context).push(
                      PrivacyNoticeRoute(),
                    ),
                  ),
                  SettingsButtonData(
                    text: context.l10n.settings_page_acknowledgements,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => Theme(
                          data: context.theme.copyWith(
                            appBarTheme: AppBarTheme(
                              foregroundColor: context.colors.background,
                              backgroundColor: context.colors.primaryLight,
                              toolbarTextStyle:
                                  context.textTheme.titleLarge!.copyWith(
                                color: context.colors.background,
                              ),
                              shadowColor: context.colors.transparent,
                              systemOverlayStyle:
                                  SystemUiOverlayStyle.dark.copyWith(
                                statusBarColor: Colors.white,
                                systemNavigationBarColor: Colors.white,
                                statusBarBrightness: Brightness.light,
                                systemStatusBarContrastEnforced: true,
                              ),
                            ),
                            dividerTheme: DividerThemeData(
                              color: context.colors.primary,
                              thickness: 2,
                            ),
                            listTileTheme: const ListTileThemeData(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              minVerticalPadding: 0,
                            ),
                            textTheme: TextTheme(
                              bodyMedium: context.textTheme.titleSmall,
                              titleMedium: context.textTheme.titleMedium,
                              titleSmall: context.textTheme.titleLarge,
                              headlineSmall: context.textTheme.titleLarge!
                                  .copyWith(color: context.colors.primary),
                            ),
                            cardColor: context.colors.background,
                          ),
                          child: const LicensePage(),
                        ),
                      ),
                    ),
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
