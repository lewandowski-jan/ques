// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bluetooth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BluetoothState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Map<String, BluetoothDevice> devices) found,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Map<String, BluetoothDevice> devices)? found,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<String, BluetoothDevice> devices)? found,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BluetoothInitial value) initial,
    required TResult Function(BluetoothDevicesFound value) found,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BluetoothInitial value)? initial,
    TResult? Function(BluetoothDevicesFound value)? found,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BluetoothInitial value)? initial,
    TResult Function(BluetoothDevicesFound value)? found,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BluetoothStateCopyWith<$Res> {
  factory $BluetoothStateCopyWith(
          BluetoothState value, $Res Function(BluetoothState) then) =
      _$BluetoothStateCopyWithImpl<$Res, BluetoothState>;
}

/// @nodoc
class _$BluetoothStateCopyWithImpl<$Res, $Val extends BluetoothState>
    implements $BluetoothStateCopyWith<$Res> {
  _$BluetoothStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BluetoothInitialCopyWith<$Res> {
  factory _$$BluetoothInitialCopyWith(
          _$BluetoothInitial value, $Res Function(_$BluetoothInitial) then) =
      __$$BluetoothInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BluetoothInitialCopyWithImpl<$Res>
    extends _$BluetoothStateCopyWithImpl<$Res, _$BluetoothInitial>
    implements _$$BluetoothInitialCopyWith<$Res> {
  __$$BluetoothInitialCopyWithImpl(
      _$BluetoothInitial _value, $Res Function(_$BluetoothInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BluetoothInitial implements BluetoothInitial {
  const _$BluetoothInitial();

  @override
  String toString() {
    return 'BluetoothState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BluetoothInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Map<String, BluetoothDevice> devices) found,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Map<String, BluetoothDevice> devices)? found,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<String, BluetoothDevice> devices)? found,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BluetoothInitial value) initial,
    required TResult Function(BluetoothDevicesFound value) found,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BluetoothInitial value)? initial,
    TResult? Function(BluetoothDevicesFound value)? found,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BluetoothInitial value)? initial,
    TResult Function(BluetoothDevicesFound value)? found,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BluetoothInitial implements BluetoothState {
  const factory BluetoothInitial() = _$BluetoothInitial;
}

/// @nodoc
abstract class _$$BluetoothDevicesFoundCopyWith<$Res> {
  factory _$$BluetoothDevicesFoundCopyWith(_$BluetoothDevicesFound value,
          $Res Function(_$BluetoothDevicesFound) then) =
      __$$BluetoothDevicesFoundCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, BluetoothDevice> devices});
}

/// @nodoc
class __$$BluetoothDevicesFoundCopyWithImpl<$Res>
    extends _$BluetoothStateCopyWithImpl<$Res, _$BluetoothDevicesFound>
    implements _$$BluetoothDevicesFoundCopyWith<$Res> {
  __$$BluetoothDevicesFoundCopyWithImpl(_$BluetoothDevicesFound _value,
      $Res Function(_$BluetoothDevicesFound) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = null,
  }) {
    return _then(_$BluetoothDevicesFound(
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as Map<String, BluetoothDevice>,
    ));
  }
}

/// @nodoc

class _$BluetoothDevicesFound implements BluetoothDevicesFound {
  _$BluetoothDevicesFound({required final Map<String, BluetoothDevice> devices})
      : _devices = devices;

  final Map<String, BluetoothDevice> _devices;
  @override
  Map<String, BluetoothDevice> get devices {
    if (_devices is EqualUnmodifiableMapView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_devices);
  }

  @override
  String toString() {
    return 'BluetoothState.found(devices: $devices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BluetoothDevicesFound &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BluetoothDevicesFoundCopyWith<_$BluetoothDevicesFound> get copyWith =>
      __$$BluetoothDevicesFoundCopyWithImpl<_$BluetoothDevicesFound>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Map<String, BluetoothDevice> devices) found,
  }) {
    return found(devices);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Map<String, BluetoothDevice> devices)? found,
  }) {
    return found?.call(devices);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Map<String, BluetoothDevice> devices)? found,
    required TResult orElse(),
  }) {
    if (found != null) {
      return found(devices);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BluetoothInitial value) initial,
    required TResult Function(BluetoothDevicesFound value) found,
  }) {
    return found(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BluetoothInitial value)? initial,
    TResult? Function(BluetoothDevicesFound value)? found,
  }) {
    return found?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BluetoothInitial value)? initial,
    TResult Function(BluetoothDevicesFound value)? found,
    required TResult orElse(),
  }) {
    if (found != null) {
      return found(this);
    }
    return orElse();
  }
}

abstract class BluetoothDevicesFound implements BluetoothState {
  factory BluetoothDevicesFound(
          {required final Map<String, BluetoothDevice> devices}) =
      _$BluetoothDevicesFound;

  Map<String, BluetoothDevice> get devices;
  @JsonKey(ignore: true)
  _$$BluetoothDevicesFoundCopyWith<_$BluetoothDevicesFound> get copyWith =>
      throw _privateConstructorUsedError;
}
