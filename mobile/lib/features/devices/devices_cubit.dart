import 'dart:async';
import 'dart:math' show asin, cos, sqrt;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_comms/flutter_comms.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ques/features/auth/auth_cubit.dart';
import 'package:ques/features/bluetooth/bluetooth_cubit.dart';
import 'package:ques/features/bluetooth/models.dart/bluetooth_models.dart';
import 'package:ques/features/data/data_repository.dart';
import 'package:ques/features/devices/models/devices_models.dart';
import 'package:ques/features/location/models/location_models.dart';

part 'devices_cubit.freezed.dart';

enum DevicesSorting { distanceIncreasing, lastSeen, distanceDecreasing }

class DevicesCubit extends Cubit<DevicesState> with MultiListener {
  DevicesCubit({required DataRepository dataRepository})
      : _dataRepository = dataRepository,
        super(const DevicesState.initial()) {
    listen();
    init();
  }

  final DataRepository _dataRepository;

  StreamSubscription<List<UserDevice>>? userDevicesSub;
  StreamSubscription<DeviceLocation?>? deviceLocationSub;

  LatLong? _lastLocation;
  DevicesSorting sorting = DevicesSorting.distanceIncreasing;

  @override
  List<ListenerDelegate> get listenerDelegates => [
        ListenerDelegate<LatLong?>(),
        ListenerDelegate<BluetoothMessage>(),
        ListenerDelegate<AuthState>(),
      ];

  @override
  Future<void> onMessage(dynamic message) async {
    if (message is LatLong?) {
      if (message != null) {
        _lastLocation = message;
      }
    }

    if (message is BluetoothMessage) {
      if (message is BluetoothDevices) {
        await updateDevicesLocations(devices: message.devices);
      }
    }

    if (message is AuthState) {
      if (message.authenticated) {
        await init();
      } else {
        emit(const DevicesState.initial());
        await userDevicesSub?.cancel();
        await deviceLocationSub?.cancel();
      }
    }
  }

  @override
  void onInitialMessage(dynamic message) => onMessage(message);

  Future<void> init() async {
    emit(const DevicesState.initial());

    await userDevicesSub?.cancel();
    userDevicesSub = _dataRepository.onUserDevices().listen(
      (userDevices) async {
        final devices = userDevices
            .map(
              (e) => Device(
                userDevice: e,
                deviceLocation: DeviceLocation(
                  id: e.id,
                  discoveryDate: null,
                  distanceInMeters: null,
                  latitude: null,
                  longitude: null,
                ),
              ),
            )
            .toList();

        emit(DevicesState.success(devices: devices));

        final deviceIds = devices.map((e) => e.id).toList();

        await deviceLocationSub?.cancel();
        deviceLocationSub =
            _dataRepository.onDevicesLocations(deviceIds).listen(
          (deviceLocation) {
            if (deviceLocation == null) {
              return;
            }

            final deviceId = deviceLocation.id;
            final devices = state.mapOrNull(
              success: (success) => success.devices,
            );

            if (devices == null) {
              return;
            }

            final newDevices = [...devices].map(
              (device) {
                if (device.id == deviceId) {
                  final distanceInMeters = _lastLocation != null &&
                          deviceLocation.latitude != null &&
                          deviceLocation.longitude != null
                      ? _calculateDistanceInMeters(
                          _lastLocation!.latitude,
                          _lastLocation!.longitude,
                          deviceLocation.latitude!,
                          deviceLocation.longitude!,
                        )
                      : null;

                  if (distanceInMeters == null) {
                    return device;
                  }

                  return device.copyWith(
                    deviceLocation: deviceLocation.copyWith(
                      distanceInMeters: distanceInMeters.round(),
                    ),
                  );
                }

                return device;
              },
            ).toList();

            emit(DevicesState.success(devices: newDevices));

            changeSorting(sorting);
          },
        );
      },
    );
  }

  double _calculateDistanceInMeters(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const p = 0.017453292519943295;
    final a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a)) * 1000;
  }

  Future<bool> addDevice({
    required BluetoothDevice device,
    required String name,
    DeviceType? deviceType,
  }) async {
    final newDevice = Device(
      userDevice: UserDevice(
        id: device.id,
        name: name,
        type: deviceType ?? DeviceType.unknown,
      ),
      deviceLocation: DeviceLocation(
        id: device.id,
        latitude: _lastLocation?.latitude,
        longitude: _lastLocation?.longitude,
        distanceInMeters: device.distanceInMeters.round(),
        discoveryDate: device.discoveryDate,
      ),
    );

    return _dataRepository.addDevice(newDevice);
  }

  Future<bool> editDevice({required UserDevice device}) async {
    return _dataRepository.editUserDevice(device);
  }

  Future<bool> deleteDevice({required String deviceId}) async {
    return _dataRepository.deleteDevice(deviceId);
  }

  Future<void> updateDevicesLocations({
    required List<BluetoothDevice> devices,
  }) async {
    if (_lastLocation == null) {
      return;
    }

    for (final device in devices) {
      await _dataRepository.tryUpdateDeviceLocation(
        DeviceLocation(
          id: device.id,
          latitude: _lastLocation!.latitude,
          longitude: _lastLocation!.longitude,
          distanceInMeters: device.distanceInMeters.round(),
          discoveryDate: device.discoveryDate,
        ),
      );
    }
  }

  void changeSorting(DevicesSorting newSorting) {
    sorting = newSorting;

    state.mapOrNull(
      success: (success) {
        final devices = [...success.devices]..sort((a, b) {
            switch (newSorting) {
              case DevicesSorting.distanceIncreasing:
                return (a.deviceLocation.distanceInMeters?.toDouble() ??
                        double.infinity)
                    .compareTo(
                  b.deviceLocation.distanceInMeters?.toDouble() ??
                      double.infinity,
                );
              case DevicesSorting.lastSeen:
                return (a.deviceLocation.discoveryDate ?? DateTime(1999))
                    .compareTo(
                  b.deviceLocation.discoveryDate ?? DateTime(1999),
                );
              case DevicesSorting.distanceDecreasing:
                return (b.deviceLocation.distanceInMeters?.toDouble() ??
                        double.infinity)
                    .compareTo(
                  a.deviceLocation.distanceInMeters?.toDouble() ??
                      double.infinity,
                );
            }
          });

        emit(DevicesState.success(devices: devices));
      },
    );
  }

  @override
  Future<void> close() async {
    await userDevicesSub?.cancel();
    await deviceLocationSub?.cancel();
    cancel();
    return super.close();
  }
}

@freezed
class DevicesState with _$DevicesState {
  const factory DevicesState.initial() = DevicesInitial;

  const factory DevicesState.success({
    required List<Device> devices,
  }) = DevicesSuccess;
}
