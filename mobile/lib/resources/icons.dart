import 'package:flutter/material.dart';
import 'package:ques/features/devices/models/devices_models.dart';

IconData getIconFromDeviceType(DeviceType type) {
  switch (type) {
    case DeviceType.headphones:
      return Icons.headphones;
    case DeviceType.keyboard:
      return Icons.keyboard;
    case DeviceType.laptop:
      return Icons.laptop_mac;
    case DeviceType.phone:
      return Icons.phone_iphone;
    case DeviceType.unknown:
      return Icons.bluetooth;
    case DeviceType.watch:
      return Icons.watch;
    case DeviceType.tablet:
      return Icons.tablet_mac_outlined;
    case DeviceType.tv:
      return Icons.tv;
    case DeviceType.mouse:
      return Icons.mouse;
  }
}
