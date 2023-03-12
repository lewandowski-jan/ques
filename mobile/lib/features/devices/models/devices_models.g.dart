// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Device _$$_DeviceFromJson(Map<String, dynamic> json) => _$_Device(
      id: json['id'] as String,
      type: $enumDecode(_$DeviceTypeEnumMap, json['type']),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$_DeviceToJson(_$_Device instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$DeviceTypeEnumMap[instance.type]!,
      'name': instance.name,
    };

const _$DeviceTypeEnumMap = {
  DeviceType.headphones: 'headphones',
  DeviceType.keyboard: 'keyboard',
  DeviceType.laptop: 'laptop',
  DeviceType.phone: 'phone',
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
