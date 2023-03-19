import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:ques/features/location/models/location_models.dart';

extension MapControllerX on MapController {
  Future<void> setPosition({
    required String of,
    required LatLong? to,
  }) async {
    if (to == null) {
      return;
    }

    return setStaticPosition(
      [
        GeoPoint(
          latitude: to.latitude,
          longitude: to.longitude,
        ),
      ],
      of,
    );
  }
}
