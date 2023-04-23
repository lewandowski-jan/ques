import 'package:async/async.dart';
import 'package:flutter_comms/flutter_comms.dart';
import 'package:ques/features/auth/auth_cubit.dart';
import 'package:ques/features/data/i_data_repository.dart';
import 'package:ques/features/data/realtime_database.dart';
import 'package:ques/features/devices/models/devices_models.dart';

class DataRepository with Listener<AuthState> implements IDataRepository {
  DataRepository({
    required RealtimeDatabase database,
  }) : _database = database {
    listen();
  }

  final RealtimeDatabase _database;
  String? _userId;

  @override
  void onMessage(AuthState message) {
    _userId = message.whenOrNull(authenticated: (user) => user.uid);
  }

  @override
  void onInitialMessage(AuthState message) => onMessage(message);

  @override
  Future<void> tryUpdateDeviceLocation(DeviceLocation deviceLocation) async {
    final path = RealtimeDatabasePath.getDeviceLocationPath(deviceLocation.id);
    final deviceExists = await _database.exists(path);

    if (!deviceExists) {
      return;
    }

    await _database.update(path, json: deviceLocation.toJson());
  }

  @override
  Future<bool> addDevice(Device device) async {
    final path = RealtimeDatabasePath.getDeviceLocationPath(device.id);
    final exists = await _database.exists(path);

    if (exists) {
      return false;
    }

    await addUserDevice(device.userDevice);
    await addDeviceLocation(device.deviceLocation);

    return true;
  }

  @override
  Future<bool> editUserDevice(UserDevice device) async {
    final userId = _userId;
    if (userId == null) {
      return false;
    }

    final path = RealtimeDatabasePath.getUserDevicePath(
      userId,
      device.id,
    );

    final exists = await _database.exists(path);
    if (!exists) {
      return false;
    }

    await _database.update(path, json: device.toJson());

    return true;
  }

  @override
  Future<bool> deleteDevice(String deviceId) async {
    final userId = _userId;
    if (userId == null) {
      return false;
    }

    final userDevicePath = RealtimeDatabasePath.getUserDevicePath(
      userId,
      deviceId,
    );

    final exists = await _database.exists(userDevicePath);
    if (!exists) {
      return false;
    }

    final deviceLocationPath = RealtimeDatabasePath.getDeviceLocationPath(
      deviceId,
    );

    await _database.delete(userDevicePath);
    await _database.delete(deviceLocationPath);

    return true;
  }

  @override
  Future<void> addUserDevice(UserDevice device) async {
    final userId = _userId;
    if (userId == null) {
      return;
    }

    final path = RealtimeDatabasePath.getUserDevicePath(
      userId,
      device.id,
    );

    await _database.update(path, json: device.toJson());
  }

  @override
  Future<void> addDeviceLocation(DeviceLocation device) async {
    final userId = _userId;
    if (userId == null) {
      return;
    }

    final path = RealtimeDatabasePath.getDeviceLocationPath(device.id);

    await _database.update(path, json: device.toJson());
  }

  @override
  Stream<List<UserDevice>> onUserDevices() async* {
    final userId = _userId;
    if (userId == null) {
      return;
    }

    final path = RealtimeDatabasePath.getUserPath(userId);

    yield* _database.onValue(path).map((json) {
      final entries = json?.entries ?? [];

      final userDevices = entries
          .map(
            (e) => UserDevice.fromJson(
              Map<String, dynamic>.from(e.value as Map<Object?, Object?>),
            ),
          )
          .toList();

      return userDevices;
    });
  }

  Future<DeviceLocation?> getDeviceLocation(String deviceId) async {
    final path = RealtimeDatabasePath.getDeviceLocationPath(deviceId);

    final json = await _database.get(path);

    if (json != null) {
      return DeviceLocation.fromJson(json);
    }

    return null;
  }

  Future<List<DeviceLocation?>> getDeviceLocations(
    List<String> deviceIds,
  ) async {
    return Future.wait(
      List.of(deviceIds.map(getDeviceLocation)),
    );
  }

  @override
  Stream<DeviceLocation?> onDeviceLocation(String deviceId) async* {
    final path = RealtimeDatabasePath.getDeviceLocationPath(deviceId);

    yield* _database.onValue(path).map((json) {
      if (json != null) {
        final deviceLocation = DeviceLocation.fromJson(json);

        return deviceLocation;
      }

      return null;
    });
  }

  @override
  Stream<DeviceLocation?> onDevicesLocations(List<String> deviceIds) async* {
    final userId = _userId;
    if (userId == null) {
      return;
    }

    Stream<DeviceLocation?>? devicesLocationsStream;

    final devicesLocationsStreams = <Stream<DeviceLocation?>>[];

    for (final deviceId in deviceIds) {
      devicesLocationsStreams.add(onDeviceLocation(deviceId));
    }

    devicesLocationsStream = StreamGroup.merge(devicesLocationsStreams);

    yield* devicesLocationsStream;
  }

  void dispose() {
    cancel();
  }
}
