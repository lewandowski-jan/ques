import 'package:flutter/material.dart';
import 'package:ques/features/bluetooth/models.dart/bluetooth_models.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

enum DeviceType { unknown, phone, keyboard, headphones, laptop }

class QSDeviceTile extends StatelessWidget {
  const QSDeviceTile({
    super.key,
    required this.device,
    this.deviceType = DeviceType.unknown,
    this.onTap,
  });

  final BluetoothDevice device;
  final DeviceType deviceType;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final distanceInMeters = device.distanceInMeters.toStringAsFixed(1);
    final discoveryDate = device.discoveryDate;
    final lastSeenInSeconds =
        DateTime.now().difference(discoveryDate).inSeconds;

    return OnPressedAnimatedScale(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 4,
          ),
          decoration: BoxDecoration(
            color: context.colors.secondaryLight,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: context.colors.black.withOpacity(.25),
                offset: const Offset(0, 4),
                blurRadius: 4,
              )
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: Icon(
                  Icons.bluetooth,
                  size: 40,
                  color: context.colors.text,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: QSText(
                        device.name,
                        style: context.textTheme.titleSmall,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Flexible(
                            child: QSText(
                              'distance: $distanceInMeters m',
                              style: context.textTheme.bodyMedium,
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: QSText(
                              'last seen: $lastSeenInSeconds s',
                              style: context.textTheme.bodyMedium,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
