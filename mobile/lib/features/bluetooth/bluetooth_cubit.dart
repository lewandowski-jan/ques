import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_comms/flutter_comms.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ques/features/auth/auth_cubit.dart';
import 'package:ques/features/battery_strategy/battery_strategy_cubit.dart';
import 'package:ques/features/bluetooth/models.dart/bluetooth_models.dart';

part 'bluetooth_cubit.freezed.dart';

class BluetoothCubit extends Cubit<BluetoothState>
    with MultiListener, Sender<BluetoothMessage> {
  BluetoothCubit({
    required BatteryStrategy initialBatteryStrategy,
  }) : super(const BluetoothState.initial()) {
    _updateStrategy(initialBatteryStrategy);
    listen();
  }

  static const _measuredPower = -71;
  static const _n = 2;

  var _updateInterval = const Duration(seconds: 30);
  var _scanMode = ScanMode.lowLatency;

  final _ble = FlutterReactiveBle();
  StreamSubscription<DiscoveredDevice>? _discoveredStreamSub;
  Timer? _filterTimer;

  @override
  List<ListenerDelegate> get listenerDelegates => [
        ListenerDelegate<AuthState>(),
        ListenerDelegate<BatteryStrategy>(),
      ];

  @override
  Future<void> onMessage(dynamic message) async {
    if (message is AuthState) {
      if (message.authenticated) {
        await init();
        return;
      }

      await _discoveredStreamSub?.cancel();
      _filterTimer?.cancel();
      await _ble.deinitialize();
      emit(const BluetoothState.initial());
    }

    if (message is BatteryStrategy) {
      _updateStrategy(message);
      await init();
    }
  }

  @override
  void onInitialMessage(dynamic message) => onMessage(message);

  void _updateStrategy(BatteryStrategy strategy) {
    switch (strategy) {
      case BatteryStrategy.accurate:
        _scanMode = ScanMode.lowLatency;
        _updateInterval = const Duration(seconds: 30);
        break;
      case BatteryStrategy.optimal:
        _scanMode = ScanMode.balanced;
        _updateInterval = const Duration(minutes: 1);
        break;
      case BatteryStrategy.loose:
        _scanMode = ScanMode.lowPower;
        _updateInterval = const Duration(minutes: 5);
        break;
    }
  }

  Future<void> init() async {
    emit(const BluetoothState.initial());

    await _ble.initialize();

    final discovered = _ble.scanForDevices(
      withServices: [],
      scanMode: _scanMode,
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
      _updateInterval,
      (_) => _filterDevices(),
    );

    await Future<void>.delayed(const Duration(seconds: 1));
    await _filterDevices();
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
          if (diff > _updateInterval) {
            newDevices.remove(deviceEntry.key);
          }
        }

        send(BluetoothUpdate(newDevices.values.toList()));
        emit(BluetoothState.found(devices: newDevices));
      },
    );
  }

  @override
  Future<void> close() async {
    await _discoveredStreamSub?.cancel();
    _filterTimer?.cancel();
    cancel();
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

class BluetoothUpdate extends BluetoothMessage {
  BluetoothUpdate(this.devices);

  final List<BluetoothDevice> devices;
}
