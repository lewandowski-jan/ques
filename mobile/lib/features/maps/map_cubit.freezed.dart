// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Device device) navigate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Device device)? navigate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Device device)? navigate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapInitial value) initial,
    required TResult Function(MapNavigate value) navigate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapInitial value)? initial,
    TResult? Function(MapNavigate value)? navigate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapInitial value)? initial,
    TResult Function(MapNavigate value)? navigate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MapInitialCopyWith<$Res> {
  factory _$$MapInitialCopyWith(
          _$MapInitial value, $Res Function(_$MapInitial) then) =
      __$$MapInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MapInitialCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapInitial>
    implements _$$MapInitialCopyWith<$Res> {
  __$$MapInitialCopyWithImpl(
      _$MapInitial _value, $Res Function(_$MapInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MapInitial implements MapInitial {
  const _$MapInitial();

  @override
  String toString() {
    return 'MapState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MapInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Device device) navigate,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Device device)? navigate,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Device device)? navigate,
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
    required TResult Function(MapInitial value) initial,
    required TResult Function(MapNavigate value) navigate,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapInitial value)? initial,
    TResult? Function(MapNavigate value)? navigate,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapInitial value)? initial,
    TResult Function(MapNavigate value)? navigate,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MapInitial implements MapState {
  const factory MapInitial() = _$MapInitial;
}

/// @nodoc
abstract class _$$MapNavigateCopyWith<$Res> {
  factory _$$MapNavigateCopyWith(
          _$MapNavigate value, $Res Function(_$MapNavigate) then) =
      __$$MapNavigateCopyWithImpl<$Res>;
  @useResult
  $Res call({Device device});

  $DeviceCopyWith<$Res> get device;
}

/// @nodoc
class __$$MapNavigateCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$MapNavigate>
    implements _$$MapNavigateCopyWith<$Res> {
  __$$MapNavigateCopyWithImpl(
      _$MapNavigate _value, $Res Function(_$MapNavigate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_$MapNavigate(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceCopyWith<$Res> get device {
    return $DeviceCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value));
    });
  }
}

/// @nodoc

class _$MapNavigate implements MapNavigate {
  const _$MapNavigate({required this.device});

  @override
  final Device device;

  @override
  String toString() {
    return 'MapState.navigate(device: $device)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapNavigate &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapNavigateCopyWith<_$MapNavigate> get copyWith =>
      __$$MapNavigateCopyWithImpl<_$MapNavigate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Device device) navigate,
  }) {
    return navigate(device);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Device device)? navigate,
  }) {
    return navigate?.call(device);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Device device)? navigate,
    required TResult orElse(),
  }) {
    if (navigate != null) {
      return navigate(device);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapInitial value) initial,
    required TResult Function(MapNavigate value) navigate,
  }) {
    return navigate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapInitial value)? initial,
    TResult? Function(MapNavigate value)? navigate,
  }) {
    return navigate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapInitial value)? initial,
    TResult Function(MapNavigate value)? navigate,
    required TResult orElse(),
  }) {
    if (navigate != null) {
      return navigate(this);
    }
    return orElse();
  }
}

abstract class MapNavigate implements MapState {
  const factory MapNavigate({required final Device device}) = _$MapNavigate;

  Device get device;
  @JsonKey(ignore: true)
  _$$MapNavigateCopyWith<_$MapNavigate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MapMessage {
  Device get device => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Device device) navigate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Device device)? navigate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Device device)? navigate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapMessageNavigate value) navigate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapMessageNavigate value)? navigate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapMessageNavigate value)? navigate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapMessageCopyWith<MapMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapMessageCopyWith<$Res> {
  factory $MapMessageCopyWith(
          MapMessage value, $Res Function(MapMessage) then) =
      _$MapMessageCopyWithImpl<$Res, MapMessage>;
  @useResult
  $Res call({Device device});

  $DeviceCopyWith<$Res> get device;
}

/// @nodoc
class _$MapMessageCopyWithImpl<$Res, $Val extends MapMessage>
    implements $MapMessageCopyWith<$Res> {
  _$MapMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_value.copyWith(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceCopyWith<$Res> get device {
    return $DeviceCopyWith<$Res>(_value.device, (value) {
      return _then(_value.copyWith(device: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MapMessageNavigateCopyWith<$Res>
    implements $MapMessageCopyWith<$Res> {
  factory _$$MapMessageNavigateCopyWith(_$MapMessageNavigate value,
          $Res Function(_$MapMessageNavigate) then) =
      __$$MapMessageNavigateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Device device});

  @override
  $DeviceCopyWith<$Res> get device;
}

/// @nodoc
class __$$MapMessageNavigateCopyWithImpl<$Res>
    extends _$MapMessageCopyWithImpl<$Res, _$MapMessageNavigate>
    implements _$$MapMessageNavigateCopyWith<$Res> {
  __$$MapMessageNavigateCopyWithImpl(
      _$MapMessageNavigate _value, $Res Function(_$MapMessageNavigate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? device = null,
  }) {
    return _then(_$MapMessageNavigate(
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as Device,
    ));
  }
}

/// @nodoc

class _$MapMessageNavigate implements MapMessageNavigate {
  const _$MapMessageNavigate({required this.device});

  @override
  final Device device;

  @override
  String toString() {
    return 'MapMessage.navigate(device: $device)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapMessageNavigate &&
            (identical(other.device, device) || other.device == device));
  }

  @override
  int get hashCode => Object.hash(runtimeType, device);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapMessageNavigateCopyWith<_$MapMessageNavigate> get copyWith =>
      __$$MapMessageNavigateCopyWithImpl<_$MapMessageNavigate>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Device device) navigate,
  }) {
    return navigate(device);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Device device)? navigate,
  }) {
    return navigate?.call(device);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Device device)? navigate,
    required TResult orElse(),
  }) {
    if (navigate != null) {
      return navigate(device);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MapMessageNavigate value) navigate,
  }) {
    return navigate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MapMessageNavigate value)? navigate,
  }) {
    return navigate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MapMessageNavigate value)? navigate,
    required TResult orElse(),
  }) {
    if (navigate != null) {
      return navigate(this);
    }
    return orElse();
  }
}

abstract class MapMessageNavigate implements MapMessage {
  const factory MapMessageNavigate({required final Device device}) =
      _$MapMessageNavigate;

  @override
  Device get device;
  @override
  @JsonKey(ignore: true)
  _$$MapMessageNavigateCopyWith<_$MapMessageNavigate> get copyWith =>
      throw _privateConstructorUsedError;
}
