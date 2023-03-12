import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:ques/features/auth/auth_notifier.dart';
import 'package:ques/features/location/models/location_models.dart';

final locationProvider = StateNotifierProvider<LocationNotifier, LatLong?>(
  (ref) {
    final authState = ref.watch(authProvider);

    if (authState.authenticated) {
      return LocationNotifier()..init();
    }

    return LocationNotifier();
  },
);

class LocationNotifier extends StateNotifier<LatLong?> {
  LocationNotifier() : super(null);

  final _location = Location();
  StreamSubscription<LocationData>? _locationStreamSub;

  Future<void> init() async {
    state = null;

    final success = await _requestServiceAndPermissions();
    if (!success) {
      return;
    }

    await _location.enableBackgroundMode();

    await _locationStreamSub?.cancel();
    _locationStreamSub = _location.onLocationChanged.listen((currentLocation) {
      final latitude = currentLocation.latitude;
      final longitude = currentLocation.longitude;

      if (latitude != null && longitude != null) {
        state = LatLong(
          latitude: latitude,
          longitude: longitude,
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
  Future<void> dispose() async {
    await _locationStreamSub?.cancel();
    super.dispose();
  }
}
