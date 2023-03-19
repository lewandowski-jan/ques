import 'package:flutter/material.dart';
import 'package:ques/features/devices/models/devices_models.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class QSDeviceTypeTile extends StatelessWidget {
  const QSDeviceTypeTile({
    super.key,
    required this.type,
    required this.selected,
    this.onTap,
  });

  final DeviceType type;
  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return OnPressedAnimatedScale(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: selected
                ? context.colors.primaryLight
                : context.colors.secondaryLight,
          ),
          child: Center(
            child: Icon(
              getIconFromDeviceType(type),
              color: context.colors.text,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
