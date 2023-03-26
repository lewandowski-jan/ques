import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/battery_strategy/battery_strategy_cubit.dart';
import 'package:ques/l10n/extensions.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class BatteryStrategyRoute extends MaterialPageRoute<void> {
  BatteryStrategyRoute()
      : super(
          builder: (context) => const BatteryStratgeyScreen(),
        );
}

class BatteryStratgeyScreen extends StatelessWidget {
  const BatteryStratgeyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final batteryStrategyCubit = context.watch<BatteryStrategyCubit>();
    final strategy = batteryStrategyCubit.state;

    return Scaffold(
      appBar: QSAppBar(title: context.l10n.battery_saving_page_battery_saving),
      backgroundColor: context.colors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 56),
            Center(
              child: QSText(
                context.l10n.battery_saving_page_battery_usage_strategy,
                style: context.textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 36),
            QSStrategySelect(
              selectedIndex: strategy.index,
              onIndexChanged: (newIndex) {
                final newStrategy = BatteryStrategy.values[newIndex];
                batteryStrategyCubit.changeStrategy(newStrategy);
              },
              children: [
                Column(
                  children: [
                    const SizedBox(height: 16),
                    Assets.icons.battery.big.svg(),
                    const SizedBox(height: 16),
                    FittedBox(
                      child: QSText(
                        context.l10n.battery_saving_page_precision,
                        style: context.textTheme.bodySmall,
                      ),
                    ),
                    FittedBox(
                      child: QSText(
                        context.l10n.battery_saving_page_accurate,
                        style: context.textTheme.titleSmall,
                        color: context.colors.primaryLight,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 16),
                    Assets.icons.battery.medium.svg(),
                    const SizedBox(height: 16),
                    FittedBox(
                      child: QSText(
                        context.l10n.battery_saving_page_precision,
                        style: context.textTheme.bodySmall,
                      ),
                    ),
                    FittedBox(
                      child: QSText(
                        context.l10n.battery_saving_page_optimal,
                        style: context.textTheme.titleSmall,
                        color: context.colors.primaryLight,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 16),
                    Assets.icons.battery.small.svg(),
                    const SizedBox(height: 16),
                    FittedBox(
                      child: QSText(
                        context.l10n.battery_saving_page_precision,
                        style: context.textTheme.bodySmall,
                      ),
                    ),
                    FittedBox(
                      child: QSText(
                        context.l10n.battery_saving_page_loose,
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
