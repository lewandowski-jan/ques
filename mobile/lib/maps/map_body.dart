import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/loading/loading_page.dart';
import 'package:ques/features/location/location_cubit.dart';
import 'package:ques/maps/map_controller_extension.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/utils/osm_hooks.dart';

class MapBody extends HookWidget {
  const MapBody({super.key});

  @override
  Widget build(BuildContext context) {
    final locationCubit = context.read<LocationCubit>();

    final mapController = useQsMapController(
      onMapIsReady: (mapController) async {
        final location = locationCubit.state;
        await mapController.setPosition(
          of: 'userLocation',
          to: location,
        );

        locationCubit.stream.listen((location) async {
          await mapController.setPosition(
            of: 'userLocation',
            to: location,
          );
        });
      },
    );

    return OSMFlutter(
      controller: mapController,
      mapIsLoading: const QSLoading(),
      androidHotReloadSupport: true,
      initZoom: 12,
      staticPoints: [
        StaticPositionGeoPoint(
          'userLocation',
          MarkerIcon(
            icon: Icon(
              Icons.person_pin_circle_rounded,
              color: context.colors.primaryLight,
              size: 40,
            ),
          ),
          [
            GeoPoint(
              latitude: 0,
              longitude: 0,
            ),
          ],
        ),
      ],
    );
  }
}
