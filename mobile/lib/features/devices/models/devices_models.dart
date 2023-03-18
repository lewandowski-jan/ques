import 'package:freezed_annotation/freezed_annotation.dart';

part 'devices_models.freezed.dart';
part 'devices_models.g.dart';

enum DeviceType {
  headphones,
  keyboard,
  mouse,
  laptop,
  phone,
  watch,
  tablet,
  tv,
  unknown,
}

@freezed
class UserDevice with _$UserDevice {
  const factory UserDevice({
    required String id,
    required String name,
    @Default(DeviceType.unknown) DeviceType type,
  }) = _UserDevice;

  factory UserDevice.fromJson(Map<String, Object?> json) =>
      _$UserDeviceFromJson(json);
}

@freezed
class DeviceLocation with _$DeviceLocation {
  const factory DeviceLocation({
    required String id,
    required double? latitude,
    required double? longitude,
    required int? distanceInMeters,
    required DateTime? discoveryDate,
  }) = _DeviceLocation;

  factory DeviceLocation.fromJson(Map<String, Object?> json) =>
      _$DeviceLocationFromJson(json);
}
