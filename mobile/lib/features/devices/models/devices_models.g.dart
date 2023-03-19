// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Device _$$_DeviceFromJson(Map<String, dynamic> json) => _$_Device(
      userDevice:
          UserDevice.fromJson(json['userDevice'] as Map<String, dynamic>),
      deviceLocation: DeviceLocation.fromJson(
          json['deviceLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DeviceToJson(_$_Device instance) => <String, dynamic>{
      'userDevice': instance.userDevice,
      'deviceLocation': instance.deviceLocation,
    };

_$_UserDevice _$$_UserDeviceFromJson(Map<String, dynamic> json) =>
    _$_UserDevice(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecodeNullable(_$DeviceTypeEnumMap, json['type']) ??
          DeviceType.unknown,
    );

Map<String, dynamic> _$$_UserDeviceToJson(_$_UserDevice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$DeviceTypeEnumMap[instance.type]!,
    };

const _$DeviceTypeEnumMap = {
  DeviceType.headphones: 'headphones',
  DeviceType.keyboard: 'keyboard',
  DeviceType.mouse: 'mouse',
  DeviceType.laptop: 'laptop',
  DeviceType.phone: 'phone',
  DeviceType.watch: 'watch',
  DeviceType.tablet: 'tablet',
  DeviceType.tv: 'tv',
  DeviceType.unknown: 'unknown',
};

_$_DeviceLocation _$$_DeviceLocationFromJson(Map<String, dynamic> json) =>
    _$_DeviceLocation(
      id: json['id'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      distanceInMeters: json['distanceInMeters'] as int?,
      discoveryDate: json['discoveryDate'] == null
          ? null
          : DateTime.parse(json['discoveryDate'] as String),
    );

Map<String, dynamic> _$$_DeviceLocationToJson(_$_DeviceLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'distanceInMeters': instance.distanceInMeters,
      'discoveryDate': instance.discoveryDate?.toIso8601String(),
    };
