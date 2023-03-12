// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BluetoothDevice {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get distanceInMeters => throw _privateConstructorUsedError;
  DateTime get discoveryDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BluetoothDeviceCopyWith<BluetoothDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothDeviceCopyWith<$Res> {
  factory $BluetoothDeviceCopyWith(
          BluetoothDevice value, $Res Function(BluetoothDevice) then) =
      _$BluetoothDeviceCopyWithImpl<$Res, BluetoothDevice>;
  @useResult
  $Res call(
      {String id,
      String name,
      double distanceInMeters,
      DateTime discoveryDate});
}

/// @nodoc
class _$BluetoothDeviceCopyWithImpl<$Res, $Val extends BluetoothDevice>
    implements $BluetoothDeviceCopyWith<$Res> {
  _$BluetoothDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? distanceInMeters = null,
    Object? discoveryDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      distanceInMeters: null == distanceInMeters
          ? _value.distanceInMeters
          : distanceInMeters // ignore: cast_nullable_to_non_nullable
              as double,
      discoveryDate: null == discoveryDate
          ? _value.discoveryDate
          : discoveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BluetoothDeviceCopyWith<$Res>
    implements $BluetoothDeviceCopyWith<$Res> {
  factory _$$_BluetoothDeviceCopyWith(
          _$_BluetoothDevice value, $Res Function(_$_BluetoothDevice) then) =
      __$$_BluetoothDeviceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double distanceInMeters,
      DateTime discoveryDate});
}

/// @nodoc
class __$$_BluetoothDeviceCopyWithImpl<$Res>
    extends _$BluetoothDeviceCopyWithImpl<$Res, _$_BluetoothDevice>
    implements _$$_BluetoothDeviceCopyWith<$Res> {
  __$$_BluetoothDeviceCopyWithImpl(
      _$_BluetoothDevice _value, $Res Function(_$_BluetoothDevice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? distanceInMeters = null,
    Object? discoveryDate = null,
  }) {
    return _then(_$_BluetoothDevice(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      distanceInMeters: null == distanceInMeters
          ? _value.distanceInMeters
          : distanceInMeters // ignore: cast_nullable_to_non_nullable
              as double,
      discoveryDate: null == discoveryDate
          ? _value.discoveryDate
          : discoveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_BluetoothDevice implements _BluetoothDevice {
  _$_BluetoothDevice(
      {required this.id,
      required this.name,
      required this.distanceInMeters,
      required this.discoveryDate});

  @override
  final String id;
  @override
  final String name;
  @override
  final double distanceInMeters;
  @override
  final DateTime discoveryDate;

  @override
  String toString() {
    return 'BluetoothDevice(id: $id, name: $name, distanceInMeters: $distanceInMeters, discoveryDate: $discoveryDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BluetoothDevice &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.distanceInMeters, distanceInMeters) ||
                other.distanceInMeters == distanceInMeters) &&
            (identical(other.discoveryDate, discoveryDate) ||
                other.discoveryDate == discoveryDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, distanceInMeters, discoveryDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BluetoothDeviceCopyWith<_$_BluetoothDevice> get copyWith =>
      __$$_BluetoothDeviceCopyWithImpl<_$_BluetoothDevice>(this, _$identity);
}

abstract class _BluetoothDevice implements BluetoothDevice {
  factory _BluetoothDevice(
      {required final String id,
      required final String name,
      required final double distanceInMeters,
      required final DateTime discoveryDate}) = _$_BluetoothDevice;

  @override
  String get id;
  @override
  String get name;
  @override
  double get distanceInMeters;
  @override
  DateTime get discoveryDate;
  @override
  @JsonKey(ignore: true)
  _$$_BluetoothDeviceCopyWith<_$_BluetoothDevice> get copyWith =>
      throw _privateConstructorUsedError;
}
