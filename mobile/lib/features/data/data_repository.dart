import 'package:ques/features/data/dynamic_database.dart';
import 'package:ques/features/data/i_data_repository.dart';
import 'package:ques/features/devices/models/devices_models.dart';

class DataRepository implements IDataRepository {
  const DataRepository({
    required DynamicDatabase database,
  }) : _database = database;

  final DynamicDatabase _database;

  @override
  Future<List<Device>> getUserDevices() async {
    // TODO: implement getDevices
    throw UnimplementedError();
  }

  @override
  Future<void> tryUpdateDeviceLocation(DeviceLocation deviceLocation) async {
    final path = DynamicDatabasePath.getDevicePath(deviceLocation.id);
    final deviceExists = await _database.exists(path);

    if (!deviceExists) {
      return;
    }

    await _database.update(path, json: deviceLocation.toJson());
  }
}
