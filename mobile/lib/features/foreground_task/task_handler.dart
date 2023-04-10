import 'dart:async';
import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:location/location.dart';
import 'package:ques/features/data/data_repository.dart';
import 'package:ques/features/data/realtime_database.dart';
import 'package:ques/features/devices/models/devices_models.dart';
import 'package:ques/firebase_options.dart';
import 'package:rxdart/rxdart.dart';

Future<void> _onValues(
  List<Object> values,
  DataRepository dataRepository,
) async {
  final location = values[0] as LocationData;
  final devices = values[1] as List<ScanResult>;

  if (location.latitude != null && location.longitude != null) {
    for (final device in devices) {
      await dataRepository.tryUpdateDeviceLocation(
        DeviceLocation(
          id: device.device.id.id,
          latitude: location.latitude,
          longitude: location.longitude,
          distanceInMeters: null,
          discoveryDate: DateTime.now(),
        ),
      );
    }
  }
}

class QuesTaskHandler extends TaskHandler {
  StreamSubscription<List<Object>>? _locationDevicesStreamSub;

  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    final firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final dataRepository = DataRepository(
      database: RealtimeDatabase(
        firebaseApp: firebaseApp,
      ),
    );

    final location = Location();
    final locationStream = location.onLocationChanged;

    final ble = FlutterBluePlus.instance;
    final bleStream = ble.scanResults.bufferTime(const Duration(seconds: 10));

    final locationDevicesStream = bleStream.withLatestFrom(
      locationStream,
      (devices, location) => [
        location,
        devices.expand((e) => [...e]).toList(),
      ],
    );

    await _locationDevicesStreamSub?.cancel();
    _locationDevicesStreamSub = locationDevicesStream.listen(
      (values) async => _onValues(values, dataRepository),
    );
  }

  @override
  Future<void> onEvent(DateTime timestamp, SendPort? sendPort) async {}

  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {
    await _locationDevicesStreamSub?.cancel();
  }
}
