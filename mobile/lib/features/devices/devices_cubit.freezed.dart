// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'devices_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DevicesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserDevice> devices) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserDevice> devices)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserDevice> devices)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DevicesInitial value) initial,
    required TResult Function(DevicesLoading value) loading,
    required TResult Function(DevicesSuccess value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DevicesInitial value)? initial,
    TResult? Function(DevicesLoading value)? loading,
    TResult? Function(DevicesSuccess value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DevicesInitial value)? initial,
    TResult Function(DevicesLoading value)? loading,
    TResult Function(DevicesSuccess value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DevicesStateCopyWith<$Res> {
  factory $DevicesStateCopyWith(
          DevicesState value, $Res Function(DevicesState) then) =
      _$DevicesStateCopyWithImpl<$Res, DevicesState>;
}

/// @nodoc
class _$DevicesStateCopyWithImpl<$Res, $Val extends DevicesState>
    implements $DevicesStateCopyWith<$Res> {
  _$DevicesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DevicesInitialCopyWith<$Res> {
  factory _$$DevicesInitialCopyWith(
          _$DevicesInitial value, $Res Function(_$DevicesInitial) then) =
      __$$DevicesInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DevicesInitialCopyWithImpl<$Res>
    extends _$DevicesStateCopyWithImpl<$Res, _$DevicesInitial>
    implements _$$DevicesInitialCopyWith<$Res> {
  __$$DevicesInitialCopyWithImpl(
      _$DevicesInitial _value, $Res Function(_$DevicesInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DevicesInitial implements DevicesInitial {
  const _$DevicesInitial();

  @override
  String toString() {
    return 'DevicesState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DevicesInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserDevice> devices) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserDevice> devices)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserDevice> devices)? success,
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
    required TResult Function(DevicesInitial value) initial,
    required TResult Function(DevicesLoading value) loading,
    required TResult Function(DevicesSuccess value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DevicesInitial value)? initial,
    TResult? Function(DevicesLoading value)? loading,
    TResult? Function(DevicesSuccess value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DevicesInitial value)? initial,
    TResult Function(DevicesLoading value)? loading,
    TResult Function(DevicesSuccess value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DevicesInitial implements DevicesState {
  const factory DevicesInitial() = _$DevicesInitial;
}

/// @nodoc
abstract class _$$DevicesLoadingCopyWith<$Res> {
  factory _$$DevicesLoadingCopyWith(
          _$DevicesLoading value, $Res Function(_$DevicesLoading) then) =
      __$$DevicesLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DevicesLoadingCopyWithImpl<$Res>
    extends _$DevicesStateCopyWithImpl<$Res, _$DevicesLoading>
    implements _$$DevicesLoadingCopyWith<$Res> {
  __$$DevicesLoadingCopyWithImpl(
      _$DevicesLoading _value, $Res Function(_$DevicesLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DevicesLoading implements DevicesLoading {
  const _$DevicesLoading();

  @override
  String toString() {
    return 'DevicesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DevicesLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserDevice> devices) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserDevice> devices)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserDevice> devices)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DevicesInitial value) initial,
    required TResult Function(DevicesLoading value) loading,
    required TResult Function(DevicesSuccess value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DevicesInitial value)? initial,
    TResult? Function(DevicesLoading value)? loading,
    TResult? Function(DevicesSuccess value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DevicesInitial value)? initial,
    TResult Function(DevicesLoading value)? loading,
    TResult Function(DevicesSuccess value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DevicesLoading implements DevicesState {
  const factory DevicesLoading() = _$DevicesLoading;
}

/// @nodoc
abstract class _$$DevicesSuccessCopyWith<$Res> {
  factory _$$DevicesSuccessCopyWith(
          _$DevicesSuccess value, $Res Function(_$DevicesSuccess) then) =
      __$$DevicesSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserDevice> devices});
}

/// @nodoc
class __$$DevicesSuccessCopyWithImpl<$Res>
    extends _$DevicesStateCopyWithImpl<$Res, _$DevicesSuccess>
    implements _$$DevicesSuccessCopyWith<$Res> {
  __$$DevicesSuccessCopyWithImpl(
      _$DevicesSuccess _value, $Res Function(_$DevicesSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? devices = null,
  }) {
    return _then(_$DevicesSuccess(
      devices: null == devices
          ? _value._devices
          : devices // ignore: cast_nullable_to_non_nullable
              as List<UserDevice>,
    ));
  }
}

/// @nodoc

class _$DevicesSuccess implements DevicesSuccess {
  const _$DevicesSuccess({required final List<UserDevice> devices})
      : _devices = devices;

  final List<UserDevice> _devices;
  @override
  List<UserDevice> get devices {
    if (_devices is EqualUnmodifiableListView) return _devices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_devices);
  }

  @override
  String toString() {
    return 'DevicesState.success(devices: $devices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DevicesSuccess &&
            const DeepCollectionEquality().equals(other._devices, _devices));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_devices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DevicesSuccessCopyWith<_$DevicesSuccess> get copyWith =>
      __$$DevicesSuccessCopyWithImpl<_$DevicesSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UserDevice> devices) success,
  }) {
    return success(devices);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UserDevice> devices)? success,
  }) {
    return success?.call(devices);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UserDevice> devices)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(devices);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DevicesInitial value) initial,
    required TResult Function(DevicesLoading value) loading,
    required TResult Function(DevicesSuccess value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DevicesInitial value)? initial,
    TResult? Function(DevicesLoading value)? loading,
    TResult? Function(DevicesSuccess value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DevicesInitial value)? initial,
    TResult Function(DevicesLoading value)? loading,
    TResult Function(DevicesSuccess value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class DevicesSuccess implements DevicesState {
  const factory DevicesSuccess({required final List<UserDevice> devices}) =
      _$DevicesSuccess;

  List<UserDevice> get devices;
  @JsonKey(ignore: true)
  _$$DevicesSuccessCopyWith<_$DevicesSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
