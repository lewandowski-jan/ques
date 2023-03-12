import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ques/features/bluetooth/bluetooth_notifier.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bluetoothState = ref.watch(bluetoothProvider);

    return Scaffold(
      body: SafeArea(
        child: bluetoothState.map(
          initial: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          found: (state) => Column(
            children: state.devices.values
                .map(
                  (device) => Container(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: QSText(
                            device.name,
                            style: context.textTheme.bodyMedium,
                            maxLines: 1,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: QSText(
                            '${device.distanceInMeters.toStringAsFixed(3)} m',
                            style: context.textTheme.bodyMedium,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
