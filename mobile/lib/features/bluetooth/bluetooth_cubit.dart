import 'dart:async';
import 'dart:math';

import 'package:flutter_comms/flutter_comms.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ques/features/auth/auth_cubit.dart';
import 'package:ques/features/bluetooth/models.dart/bluetooth_models.dart';

part 'bluetooth_cubit.freezed.dart';

// TODO: handle permissions and service like in LocationCubit
class BluetoothCubit extends ListenerCubit<BluetoothState, AuthState>
    with Sender<BluetoothMessage> {
  BluetoothCubit() : super(const BluetoothState.initial());

  static const _measuredPower = -70;
  static const _n = 2;
  static const _discoveryDateValidity = Duration(seconds: 30);

  final _ble = FlutterReactiveBle();
  StreamSubscription<DiscoveredDevice>? _discoveredStreamSub;
  Timer? _filterTimer;

  @override
  Future<void> onMessage(AuthState message) async {
    if (message.authenticated) {
      await init();
      return;
    }

    await _discoveredStreamSub?.cancel();
    _filterTimer?.cancel();
    emit(const BluetoothState.initial());
  }

  @override
  void onInitialMessage(AuthState message) => onMessage(message);

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
            emit(BluetoothState.found(devices: {id: bluetoothDevice}));
          },
          found: (devices) {
            final newDevices = {...devices};
            newDevices[id] = bluetoothDevice;
            emit(BluetoothState.found(devices: newDevices));
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

  Future<void> _filterDevices() async {
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

        send(BluetoothDevices(newDevices.values.toList()));
        emit(BluetoothState.found(devices: newDevices));
      },
    );
  }

  @override
  Future<void> close() async {
    await _discoveredStreamSub?.cancel();
    _filterTimer?.cancel();
    await super.close();
  }
}

@freezed
class BluetoothState with _$BluetoothState {
  const factory BluetoothState.initial() = BluetoothInitial;

  factory BluetoothState.found({
    required Map<String, BluetoothDevice> devices,
  }) = BluetoothDevicesFound;
}

abstract class BluetoothMessage {}

class BluetoothDevices extends BluetoothMessage {
  BluetoothDevices(this.devices);

  final List<BluetoothDevice> devices;
}
