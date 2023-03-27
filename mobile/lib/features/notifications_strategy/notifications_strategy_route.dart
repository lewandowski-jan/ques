import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/notifications_strategy/notifications_strategy_cubit.dart';
import 'package:ques/l10n/extensions.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class NotificationsStrategyRoute extends MaterialPageRoute<void> {
  NotificationsStrategyRoute()
      : super(
          builder: (context) => const NotificationsStrategyScreen(),
        );
}

class NotificationsStrategyScreen extends StatelessWidget {
  const NotificationsStrategyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationsStrategyCubit =
        context.watch<NotificationsStrategyCubit>();
    final strategy = notificationsStrategyCubit.state;

    return Scaffold(
      appBar: QSAppBar(
        title:
            context.l10n.notifications_management_page_notifications_management,
      ),
      backgroundColor: context.colors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 56),
            Center(
              child: QSText(
                context
                    .l10n.notifications_management_page_notifications_strategy,
                style: context.textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 36),
            QSStrategySelect(
              selectedIndex: strategy.index,
              onIndexChanged: (newIndex) {
                final newStrategy = NotificationsStrategy.values[newIndex];
                notificationsStrategyCubit.changeStrategy(newStrategy);
              },
              children: [
                Column(
                  children: [
                    const SizedBox(height: 8),
                    Assets.icons.bell.big.svg(),
                    const SizedBox(height: 16),
                    FittedBox(
                      child: QSText(
                        context.l10n.notifications_management_page_every,
                        style: context.textTheme.bodySmall,
                      ),
                    ),
                    FittedBox(
                      child: QSText(
                        context.l10n.notifications_management_page_one,
                        style: context.textTheme.titleSmall,
                        color: context.colors.primaryLight,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 8),
                    Assets.icons.bell.medium.svg(),
                    const SizedBox(height: 16),
                    FittedBox(
                      child: QSText(
                        context.l10n.notifications_management_page_only,
                        style: context.textTheme.bodySmall,
                      ),
                    ),
                    FittedBox(
                      child: QSText(
                        context.l10n.notifications_management_page_important,
                        style: context.textTheme.titleSmall,
                        color: context.colors.primaryLight,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 8),
                    Assets.icons.bell.small.svg(),
                    const SizedBox(height: 16),
                    FittedBox(
                      child: QSText(
                        context.l10n.notifications_management_page_all,
                        style: context.textTheme.bodySmall,
                      ),
                    ),
                    FittedBox(
                      child: QSText(
                        context.l10n.notifications_management_page_disabled,
                        style: context.textTheme.titleSmall,
                        color: context.colors.primaryLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
