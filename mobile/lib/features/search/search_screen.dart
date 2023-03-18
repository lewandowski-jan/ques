import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/loading/loading_page.dart';
import 'package:ques/features/location/location_cubit.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/utils/osm_hooks.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MapBody(),
    );
  }
}

class MapBody extends HookWidget {
  const MapBody({super.key});

  @override
  Widget build(BuildContext context) {
    final mapController = useMapController(
      initMapWithUserPosition: true,
    );

    final locationCubit = context.read<LocationCubit>();
    final location = locationCubit.state;

    useMapIsReady(
      controller: mapController,
      mapIsReady: () async {
        if (location != null) {
          locationCubit.stream.listen((location) async {
            if (location != null) {
              await mapController.setStaticPosition(
                [
                  GeoPoint(
                    latitude: location.latitude,
                    longitude: location.longitude,
                  ),
                ],
                'userLocation',
              );
            }
          });
        }
      },
    );

    return OSMFlutter(
      controller: mapController,
      mapIsLoading: const QSLoading(),
      androidHotReloadSupport: true,
      initZoom: 12,
      staticPoints: [
        if (location != null)
          StaticPositionGeoPoint(
            'userLocation',
            MarkerIcon(
              icon: Icon(
                Icons.person_pin_circle,
                color: context.colors.primaryLight,
                size: 40,
              ),
            ),
            [
              GeoPoint(
                latitude: location.latitude,
                longitude: location.longitude,
              ),
            ],
          ),
      ],
      markerOption: MarkerOption(
        defaultMarker: MarkerIcon(
          icon: Icon(
            Icons.pin_drop,
            color: context.colors.primaryLight,
            size: 40,
          ),
        ),
      ),
    );
  }
}
