import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_comms/flutter_comms.dart';
import 'package:location/location.dart';
import 'package:ques/features/auth/auth_cubit.dart';
import 'package:ques/features/battery_strategy/battery_strategy_cubit.dart';
import 'package:ques/features/location/models/location_models.dart';

class LocationCubit extends Cubit<LatLong?> with MultiListener, StateSender {
  LocationCubit({
    required BatteryStrategy initialBatteryStrategy,
  }) : super(null) {
    _updateStrategy(initialBatteryStrategy);
    listen();
  }

  final _location = Location();
  var _locationAccuracy = LocationAccuracy.navigation;
  var _locationInterval = 1000;

  StreamSubscription<LocationData>? _locationStreamSub;

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

      await _locationStreamSub?.cancel();
      emit(null);
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
        _locationAccuracy = LocationAccuracy.navigation;
        _locationInterval = 1000;
        break;
      case BatteryStrategy.optimal:
        _locationAccuracy = LocationAccuracy.balanced;
        _locationInterval = 5000;
        break;
      case BatteryStrategy.loose:
        _locationAccuracy = LocationAccuracy.powerSave;
        _locationInterval = 10000;
        break;
    }
  }

  Future<void> init() async {
    emit(null);

    final success = await _requestServiceAndPermissions();
    if (!success) {
      return;
    }

    await _location.enableBackgroundMode();
    await _location.changeSettings(
      accuracy: _locationAccuracy,
      interval: _locationInterval,
    );

    await _subscribeToLocationChanges();
  }

  Future<void> _subscribeToLocationChanges() async {
    await _locationStreamSub?.cancel();
    _locationStreamSub = _location.onLocationChanged.listen((currentLocation) {
      final latitude = currentLocation.latitude;
      final longitude = currentLocation.longitude;

      if (latitude != null && longitude != null) {
        emit(
          LatLong(
            latitude: latitude,
            longitude: longitude,
          ),
        );
      }
    });
  }

  Future<bool> _requestServiceAndPermissions() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }

    return true;
  }

  @override
  Future<void> close() async {
    await _locationStreamSub?.cancel();
    cancel();
    await super.close();
  }
}
