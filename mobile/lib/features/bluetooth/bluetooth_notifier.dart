import 'dart:async';
import 'dart:math';

import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ques/features/auth/auth_notifier.dart';
import 'package:ques/features/bluetooth/models.dart/bluetooth_models.dart';

part 'bluetooth_notifier.freezed.dart';

final bluetoothProvider =
    StateNotifierProvider<BluetoothNotifier, BluetoothState>(
  (ref) {
    final authState = ref.watch(authProvider);

    if (authState.authenticated) {
      return BluetoothNotifier()..init();
    }

    return BluetoothNotifier();
  },
);

class BluetoothNotifier extends StateNotifier<BluetoothState> {
  BluetoothNotifier() : super(const BluetoothState.initial());

  static const _measuredPower = -50;
  static const _n = 2;
  static const _discoveryDateValidity = Duration(seconds: 30);

  final _ble = FlutterReactiveBle();
  StreamSubscription<DiscoveredDevice>? _discoveredStreamSub;
  Timer? _filterTimer;

  Future<void> init() async {
    final discovered = _ble.scanForDevices(
      withServices: [],
      scanMode: ScanMode.lowLatency,
    );

    await _discoveredStreamSub?.cancel();
    _discoveredStreamSub = discovered.listen((device) {
      if (device.name != '') {
        final bluetoothDevice = BluetoothDevice(
          id: device.id,
          distanceInMeters: _findDistanceInMeters(device.rssi),
          name: device.name,
          discoveryDate: DateTime.now(),
        );

        final id = device.id;

        state.when(
          initial: () {
            state = BluetoothState.found(devices: {id: bluetoothDevice});
          },
          found: (devices) {
            final newDevices = {...devices};
            newDevices[id] = bluetoothDevice;
            state = BluetoothState.found(devices: newDevices);
          },
        );
      }
    });

    _filterTimer = Timer.periodic(
      _discoveryDateValidity,
      (_) => _filterDevices(),
    );
  }

  double _findDistanceInMeters(int rssi) => pow(
        10,
        (_measuredPower - rssi) / (10 * _n),
      ).toDouble();

  void _filterDevices() {
    state.whenOrNull(
      found: (devices) {
        final newDevices = {...devices};
        for (final deviceEntry in devices.entries) {
          final device = deviceEntry.value;
          final diff = DateTime.now().difference(device.discoveryDate);
          if (diff > _discoveryDateValidity) {
            newDevices.remove(deviceEntry.key);
          }
        }
        state = BluetoothState.found(devices: newDevices);
      },
    );
  }

  @override
  Future<void> dispose() async {
    await _discoveredStreamSub?.cancel();
    _filterTimer?.cancel();
    super.dispose();
  }
}

@freezed
class BluetoothState with _$BluetoothState {
  const factory BluetoothState.initial() = BluetoothInitial;

  factory BluetoothState.found({
    required Map<String, BluetoothDevice> devices,
  }) = BluetoothDevicesFound;
}
