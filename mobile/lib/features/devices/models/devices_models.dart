import 'package:freezed_annotation/freezed_annotation.dart';

part 'devices_models.freezed.dart';
part 'devices_models.g.dart';

enum DeviceType { headphones, keyboard, laptop, phone, unknown }

@freezed
class Device with _$Device {
  const factory Device({
    required String id,
    required DeviceType type,
    required String name,
  }) = _Device;

  factory Device.fromJson(Map<String, Object?> json) => _$DeviceFromJson(json);
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
