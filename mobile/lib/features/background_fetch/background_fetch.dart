// ignore_for_file: avoid_print

import 'dart:async';

import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:location/location.dart';
import 'package:ques/features/data/data_repository.dart';
import 'package:ques/features/data/realtime_database.dart';
import 'package:ques/features/devices/models/devices_models.dart';

class BackgroundFetchWrapper extends StatefulWidget {
  const BackgroundFetchWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  _BackgroundFetchWrapperState createState() => _BackgroundFetchWrapperState();
}

class _BackgroundFetchWrapperState extends State<BackgroundFetchWrapper> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> _onFetch() async {
    final dataRepository = DataRepository(database: RealtimeDatabase());
    final location = await Location().getLocation();

    final ble = FlutterBluePlus.instance;
    final isScanning = await ble.isScanning.first;
    if (!isScanning) {
      await ble.startScan(timeout: const Duration(seconds: 5));
    }

    ble.scanResults.listen((results) async {
      if (location.latitude != null && location.longitude != null) {
        for (final result in results) {
          await dataRepository.tryUpdateDeviceLocation(
            DeviceLocation(
              id: result.device.id.id,
              latitude: location.latitude,
              longitude: location.longitude,
              distanceInMeters: null,
              discoveryDate: DateTime.now(),
              updatedInBackground: true,
            ),
          );
        }
      }
    });

    await Future<void>.delayed(const Duration(seconds: 5));
  }

  Future<void> initPlatformState() async {
    final status = await BackgroundFetch.configure(
      BackgroundFetchConfig(
        minimumFetchInterval: 15,
        stopOnTerminate: true,
        enableHeadless: false,
        requiresBatteryNotLow: false,
        requiresCharging: false,
        requiresStorageNotLow: false,
        requiresDeviceIdle: false,
        requiredNetworkType: NetworkType.ANY,
      ),
      (dynamic taskId) async {
        print('[BackgroundFetch] Event received $taskId');

        await _onFetch();

        BackgroundFetch.finish(taskId.toString());
      },
      (dynamic taskId) async {
        print('[BackgroundFetch] TASK TIMEOUT taskId: $taskId');
        BackgroundFetch.finish(taskId.toString());
      },
    );

    print('[BackgroundFetch] configure success: $status');

    _onEnable(true);

    if (!mounted) {
      return;
    }
  }

  void _onEnable(bool enabled) {
    if (enabled) {
      BackgroundFetch.start().then((status) {
        print('[BackgroundFetch] start success: $status');
      }).catchError((dynamic e) {
        print('[BackgroundFetch] start FAILURE: $e');
      });
    } else {
      BackgroundFetch.stop().then((status) {
        print('[BackgroundFetch] stop success: $status');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
