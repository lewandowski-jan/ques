import 'dart:async';

import 'package:flutter_comms/flutter_comms.dart';
import 'package:location/location.dart';
import 'package:ques/features/auth/auth_cubit.dart';
import 'package:ques/features/location/models/location_models.dart';

class LocationCubit extends ListenerCubit<LatLong?, AuthState> {
  LocationCubit() : super(null);

  final _location = Location();
  StreamSubscription<LocationData>? _locationStreamSub;

  @override
  Future<void> onMessage(AuthState message) async {
    if (message.authenticated) {
      await init();
      return;
    }

    await _locationStreamSub?.cancel();
    emit(null);
  }

  @override
  void onInitialMessage(AuthState message) => onMessage(message);

  Future<void> init() async {
    emit(null);

    final success = await _requestServiceAndPermissions();
    if (!success) {
      return;
    }

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
    await super.close();
  }
}
