import 'package:ques/features/devices/models/devices_models.dart';

abstract class IDataRepository {
  Future<void> tryUpdateDeviceLocation(DeviceLocation deviceLocation);
  Future<List<UserDevice>> getUserDevices();
}
