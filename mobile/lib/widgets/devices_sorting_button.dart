import 'package:flutter/material.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/devices/devices_cubit.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/theme.dart';
import 'package:ques/widgets/widgets.dart';

class QSDevicesSortingButton extends HookWidget {
  const QSDevicesSortingButton({super.key});

  void _onPressed(
    ValueChanged<DevicesSorting> onSortingChanged, {
    required DevicesSorting currentSorting,
  }) {
    switch (currentSorting) {
      case DevicesSorting.distanceIncreasing:
        return onSortingChanged(DevicesSorting.lastSeen);
      case DevicesSorting.lastSeen:
        return onSortingChanged(DevicesSorting.distanceDecreasing);
      case DevicesSorting.distanceDecreasing:
        return onSortingChanged(DevicesSorting.distanceIncreasing);
    }
  }

  String getText(
    BuildContext context, {
    required DevicesSorting from,
  }) {
    switch (from) {
      case DevicesSorting.distanceIncreasing:
        return context.l10n.devices_sorting_button_distance_increasing;
      case DevicesSorting.lastSeen:
        return context.l10n.devices_sorting_button_last_seen;
      case DevicesSorting.distanceDecreasing:
        return context.l10n.devices_sorting_button_distance_decreasing;
    }
  }

  @override
  Widget build(BuildContext context) {
    final devicesCubit = context.read<DevicesCubit>();
    final sorting = useState(devicesCubit.sorting);

    return OnPressedAnimatedScale(
      child: GestureDetector(
        onTap: () => _onPressed(
          (newSorting) {
            sorting.value = newSorting;
            devicesCubit.changeSorting(newSorting);
          },
          currentSorting: sorting.value,
        ),
        child: Container(
          height: 20,
          alignment: Alignment.center,
          child: QSText(
            getText(context, from: sorting.value),
            style: context.textTheme.bodySmall,
            color: context.colors.primaryLight,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
