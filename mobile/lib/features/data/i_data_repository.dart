import 'package:ques/features/devices/models/devices_models.dart';

abstract class IDataRepository {
  Future<void> tryUpdateDeviceLocation(DeviceLocation deviceLocation);
  Future<void> addDevice(Device device);
  Future<void> addUserDevice(UserDevice device);
  Future<void> addDeviceLocation(DeviceLocation device);
  Stream<List<UserDevice>> onUserDevices();
  Stream<DeviceLocation?> onDeviceLocation(String deviceId);
  Stream<DeviceLocation?> onDevicesLocations(List<String> deviceIds);
}
