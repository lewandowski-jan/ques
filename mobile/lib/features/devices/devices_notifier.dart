import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ques/features/auth/auth_notifier.dart';
import 'package:ques/features/devices/models/devices_models.dart';

part 'devices_notifier.freezed.dart';

final devicesProvider = StateNotifierProvider<DevicesNotifier, DevicesState>(
  (ref) {
    final authState = ref.watch(authProvider);

    if (authState.authenticated) {
      return DevicesNotifier()..init();
    }

    return DevicesNotifier();
  },
);

class DevicesNotifier extends StateNotifier<DevicesState> {
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
