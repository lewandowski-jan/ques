import 'dart:math' show asin, atan2, cos, min, pi, sin, sqrt;

import 'package:ques/features/location/models/location_models.dart';

double calculateDistanceInMeters(
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

double degToRadian(double deg) => deg * (pi / 180);

double radianToDeg(double radian) => radian * (180 / pi);

LatLong offset(
  LatLong from,
  double distanceInMeters,
  double bearing,
) {
  assert(0 <= bearing && bearing <= 360);

  final h = degToRadian(bearing);

  final a = min(distanceInMeters, 5) / 6378137.0;

  final lat2 = asin(
    sin(degToRadian(from.latitude)) * cos(a) +
        cos(from.latitude) * sin(a) * cos(h),
  );

  final long2 = degToRadian(from.longitude) +
      atan2(
        sin(h) * sin(a) * cos(degToRadian(from.latitude)),
        cos(a) - sin(degToRadian(from.latitude)) * sin(lat2),
      );

  return LatLong(latitude: radianToDeg(lat2), longitude: radianToDeg(long2));
}
