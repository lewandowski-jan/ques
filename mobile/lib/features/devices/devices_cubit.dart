import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ques/features/devices/models/devices_models.dart';

part 'devices_cubit.freezed.dart';

class DevicesNotifier extends Cubit<DevicesState> {
  DevicesNotifier() : super(const DevicesState.initial());

  Future<void> init() async {}
}

@freezed
class DevicesState with _$DevicesState {
  const factory DevicesState.initial() = DevicesInitial;

  const factory DevicesState.loading() = DevicesLoading;

  const factory DevicesState.success({
    required List<Device> devices,
  }) = DevicesSuccess;
}
