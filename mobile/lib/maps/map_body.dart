import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/devices/devices_cubit.dart';
import 'package:ques/features/loading/loading_page.dart';
import 'package:ques/features/location/location_cubit.dart';
import 'package:ques/maps/map_controller_extension.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/utils/osm_hooks.dart';

// TODO: handle OSM errors
class MapBody extends HookWidget {
  const MapBody({super.key});

  @override
  Widget build(BuildContext context) {
    final locationCubit = context.read<LocationCubit>();
    final devicesCubit = context.read<DevicesCubit>();
    final devices = devicesCubit.state.mapOrNull(
          success: (success) => success.devices,
        ) ??
        [];

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

        for (final device in devices) {
          await mapController.setPosition(
            of: device.id,
            to: device.location,
          );
        }

        devicesCubit.stream.listen((state) async {
          final devices = state.mapOrNull(success: (s) => s.devices) ?? [];

          for (final device in devices) {
            await mapController.setPosition(
              of: device.id,
              to: device.location,
            );
          }
        });

        await mapController.zoomToBoundingBox(
          BoundingBox.fromGeoPoints(
            [
              if (location != null)
                GeoPoint(
                  latitude: location.latitude,
                  longitude: location.longitude,
                ),
              ...devices
                  .whereNotNull()
                  .map(
                    (e) => e.location,
                  )
                  .whereNotNull()
                  .map(
                    (location) => GeoPoint(
                      latitude: location.latitude,
                      longitude: location.longitude,
                    ),
                  ),
            ],
          ),
          paddinInPixel: 150,
        );
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
        ...devices.map(
          (e) => StaticPositionGeoPoint(
            e.id,
            MarkerIcon(
              icon: Icon(
                Icons.location_on,
                color: context.colors.accent,
                size: 40,
              ),
            ),
            [
              GeoPoint(
                latitude: e.location?.latitude ?? 0,
                longitude: e.location?.longitude ?? 0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
