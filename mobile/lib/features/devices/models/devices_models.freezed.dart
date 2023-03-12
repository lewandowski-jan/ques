// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devices_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return _Device.fromJson(json);
}

/// @nodoc
mixin _$Device {
  String get id => throw _privateConstructorUsedError;
  DeviceType get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceCopyWith<Device> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCopyWith<$Res> {
  factory $DeviceCopyWith(Device value, $Res Function(Device) then) =
      _$DeviceCopyWithImpl<$Res, Device>;
  @useResult
  $Res call({String id, DeviceType type, String name});
}

/// @nodoc
class _$DeviceCopyWithImpl<$Res, $Val extends Device>
    implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeviceType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeviceCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$$_DeviceCopyWith(_$_Device value, $Res Function(_$_Device) then) =
      __$$_DeviceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, DeviceType type, String name});
}

/// @nodoc
class __$$_DeviceCopyWithImpl<$Res>
    extends _$DeviceCopyWithImpl<$Res, _$_Device>
    implements _$$_DeviceCopyWith<$Res> {
  __$$_DeviceCopyWithImpl(_$_Device _value, $Res Function(_$_Device) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
  }) {
    return _then(_$_Device(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeviceType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Device implements _Device {
  const _$_Device({required this.id, required this.type, required this.name});

  factory _$_Device.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceFromJson(json);

  @override
  final String id;
  @override
  final DeviceType type;
  @override
  final String name;

  @override
  String toString() {
    return 'Device(id: $id, type: $type, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Device &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceCopyWith<_$_Device> get copyWith =>
      __$$_DeviceCopyWithImpl<_$_Device>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceToJson(
      this,
    );
  }
}

abstract class _Device implements Device {
  const factory _Device(
      {required final String id,
      required final DeviceType type,
      required final String name}) = _$_Device;

  factory _Device.fromJson(Map<String, dynamic> json) = _$_Device.fromJson;

  @override
  String get id;
  @override
  DeviceType get type;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceCopyWith<_$_Device> get copyWith =>
      throw _privateConstructorUsedError;
}

DeviceLocation _$DeviceLocationFromJson(Map<String, dynamic> json) {
  return _DeviceLocation.fromJson(json);
}

/// @nodoc
mixin _$DeviceLocation {
  String get id => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  int? get distanceInMeters => throw _privateConstructorUsedError;
  DateTime? get discoveryDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceLocationCopyWith<DeviceLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceLocationCopyWith<$Res> {
  factory $DeviceLocationCopyWith(
          DeviceLocation value, $Res Function(DeviceLocation) then) =
      _$DeviceLocationCopyWithImpl<$Res, DeviceLocation>;
  @useResult
  $Res call(
      {String id,
      double? latitude,
      double? longitude,
      int? distanceInMeters,
      DateTime? discoveryDate});
}

/// @nodoc
class _$DeviceLocationCopyWithImpl<$Res, $Val extends DeviceLocation>
    implements $DeviceLocationCopyWith<$Res> {
  _$DeviceLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? distanceInMeters = freezed,
    Object? discoveryDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceInMeters: freezed == distanceInMeters
          ? _value.distanceInMeters
          : distanceInMeters // ignore: cast_nullable_to_non_nullable
              as int?,
      discoveryDate: freezed == discoveryDate
          ? _value.discoveryDate
          : discoveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeviceLocationCopyWith<$Res>
    implements $DeviceLocationCopyWith<$Res> {
  factory _$$_DeviceLocationCopyWith(
          _$_DeviceLocation value, $Res Function(_$_DeviceLocation) then) =
      __$$_DeviceLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double? latitude,
      double? longitude,
      int? distanceInMeters,
      DateTime? discoveryDate});
}

/// @nodoc
class __$$_DeviceLocationCopyWithImpl<$Res>
    extends _$DeviceLocationCopyWithImpl<$Res, _$_DeviceLocation>
    implements _$$_DeviceLocationCopyWith<$Res> {
  __$$_DeviceLocationCopyWithImpl(
      _$_DeviceLocation _value, $Res Function(_$_DeviceLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? distanceInMeters = freezed,
    Object? discoveryDate = freezed,
  }) {
    return _then(_$_DeviceLocation(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      distanceInMeters: freezed == distanceInMeters
          ? _value.distanceInMeters
          : distanceInMeters // ignore: cast_nullable_to_non_nullable
              as int?,
      discoveryDate: freezed == discoveryDate
          ? _value.discoveryDate
          : discoveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeviceLocation implements _DeviceLocation {
  const _$_DeviceLocation(
      {required this.id,
      required this.latitude,
      required this.longitude,
      required this.distanceInMeters,
      required this.discoveryDate});

  factory _$_DeviceLocation.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceLocationFromJson(json);

  @override
  final String id;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final int? distanceInMeters;
  @override
  final DateTime? discoveryDate;

  @override
  String toString() {
    return 'DeviceLocation(id: $id, latitude: $latitude, longitude: $longitude, distanceInMeters: $distanceInMeters, discoveryDate: $discoveryDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceLocation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.distanceInMeters, distanceInMeters) ||
                other.distanceInMeters == distanceInMeters) &&
            (identical(other.discoveryDate, discoveryDate) ||
                other.discoveryDate == discoveryDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, latitude, longitude, distanceInMeters, discoveryDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceLocationCopyWith<_$_DeviceLocation> get copyWith =>
      __$$_DeviceLocationCopyWithImpl<_$_DeviceLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceLocationToJson(
      this,
    );
  }
}

abstract class _DeviceLocation implements DeviceLocation {
  const factory _DeviceLocation(
      {required final String id,
      required final double? latitude,
      required final double? longitude,
      required final int? distanceInMeters,
      required final DateTime? discoveryDate}) = _$_DeviceLocation;

  factory _DeviceLocation.fromJson(Map<String, dynamic> json) =
      _$_DeviceLocation.fromJson;

  @override
  String get id;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  int? get distanceInMeters;
  @override
  DateTime? get discoveryDate;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceLocationCopyWith<_$_DeviceLocation> get copyWith =>
      throw _privateConstructorUsedError;
}