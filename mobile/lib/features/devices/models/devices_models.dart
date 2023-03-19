import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ques/features/location/models/location_models.dart';

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
class Device with _$Device {
  const factory Device({
    required UserDevice userDevice,
    required DeviceLocation deviceLocation,
  }) = _Device;

  const Device._();

  factory Device.fromJson(Map<String, Object?> json) => _$DeviceFromJson(json);

  String get name => userDevice.name;
  String get id => userDevice.id;
  DeviceType get type => userDevice.type;
  LatLong? get location =>
      deviceLocation.latitude != null && deviceLocation.longitude != null
          ? LatLong(
              latitude: deviceLocation.latitude!,
              longitude: deviceLocation.longitude!,
            )
          : null;
  DateTime? get discorveryDate => deviceLocation.discoveryDate;
}

@freezed
class UserDevice with _$UserDevice {
  const factory UserDevice({
    required String id,
    required String name,
    @Default(DeviceType.unknown) DeviceType type,
  }) = _UserDevice;

  const UserDevice._();

  factory UserDevice.fromJson(Map<String, Object?> json) =>
      _$UserDeviceFromJson(json);

  factory UserDevice.fromDb(Map<Object?, Object?> data) {
    final json = Map<String, dynamic>.from(data);
    return UserDevice.fromJson(json);
  }
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
