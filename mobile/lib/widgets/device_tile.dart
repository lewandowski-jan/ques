import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ques/features/devices/models/devices_models.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class QSDeviceTile extends StatelessWidget {
  const QSDeviceTile({
    super.key,
    required this.device,
    this.deviceType = DeviceType.unknown,
    this.onTap,
    this.onLongPress,
  });

  final Device device;
  final DeviceType deviceType;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  String formatDistance(int? distanceInMeters) {
    if (distanceInMeters == null) {
      return '';
    }

    if (distanceInMeters < 1000) {
      return '$distanceInMeters m';
    }

    final distanceInKilometers = (distanceInMeters / 1000).round();

    return '$distanceInKilometers km';
  }

  @override
  Widget build(BuildContext context) {
    final distanceInMeters = device.deviceLocation.distanceInMeters;
    final formattedDistance = formatDistance(distanceInMeters);

    final discoveryDate = device.deviceLocation.discoveryDate;
    final lastSeen =
        discoveryDate != null ? DateFormat.yMd().format(discoveryDate) : null;

    return OnPressedAnimatedScale(
      child: GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
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
                  getIconFromDeviceType(device.type),
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
                          if (distanceInMeters != null) ...[
                            QSText(
                              'dist.: $formattedDistance',
                              style: context.textTheme.displaySmall,
                              maxLines: 1,
                            ),
                            const SizedBox(width: 8),
                          ],
                          if (lastSeen != null)
                            Expanded(
                              child: QSText(
                                'last seen: $lastSeen',
                                style: context.textTheme.displaySmall,
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
