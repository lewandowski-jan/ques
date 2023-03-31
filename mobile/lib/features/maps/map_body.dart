import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/devices/devices_cubit.dart';
import 'package:ques/features/loading/loading_page.dart';
import 'package:ques/features/location/location_cubit.dart';
import 'package:ques/features/maps/map_controller_extension.dart';
import 'package:ques/features/maps/map_cubit.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/utils/osm_hooks.dart';

class MapBody extends HookWidget {
  const MapBody({super.key});

  @override
  Widget build(BuildContext context) {
    final markerSize = Platform.isIOS ? 30.0 : 60.0;

    final mapIsReady = useState(false);

    final locationCubit = context.read<LocationCubit>();
    final devicesCubit = context.read<DevicesCubit>();

    final mapCubit = useBloc(MapCubit.new);
    final mapState = mapCubit.state;

    final devices = devicesCubit.state.mapOrNull(
          success: (success) => success.devices,
        ) ??
        [];

    final mapController = useQsMapController(
      onMapIsReady: (mapController) async {
        mapIsReady.value = true;

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

        await mapState.map(
          initial: (_) async {
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
          navigate: (navigate) async {
            final device = devices.firstWhereOrNull(
                  (d) => d.id == navigate.device.id,
                ) ??
                navigate.device;

            await mapController.setPosition(
              of: device.id,
              to: device.location,
            );

            devicesCubit.stream.listen((state) async {
              final devices = state.mapOrNull(success: (s) => s.devices) ?? [];

              for (final device in devices) {
                if (device.id == navigate.device.id) {
                  await mapController.setPosition(
                    of: device.id,
                    to: device.location,
                  );

                  if (location == null || device.location == null) {
                    return;
                  }

                  await mapController.clearAllRoads();

                  await mapController.drawRoad(
                    GeoPoint(
                      latitude: location.latitude,
                      longitude: location.longitude,
                    ),
                    GeoPoint(
                      latitude: device.location!.latitude,
                      longitude: device.location!.longitude,
                    ),
                    roadOption: RoadOption(
                      roadColor: context.colors.primary,
                      zoomInto: false,
                    ),
                  );

                  await mapController.zoomToBoundingBox(
                    BoundingBox.fromGeoPoints(
                      [
                        GeoPoint(
                          latitude: location.latitude,
                          longitude: location.longitude,
                        ),
                        GeoPoint(
                          latitude: device.location!.latitude,
                          longitude: device.location!.longitude,
                        ),
                      ],
                    ),
                    paddinInPixel: 150,
                  );
                }
              }
            });

            if (location == null || device.location == null) {
              return;
            }

            await mapController.drawRoad(
              GeoPoint(
                latitude: location.latitude,
                longitude: location.longitude,
              ),
              GeoPoint(
                latitude: device.location!.latitude,
                longitude: device.location!.longitude,
              ),
              roadOption: RoadOption(
                roadColor: context.colors.primary,
              ),
            );

            await mapController.zoomToBoundingBox(
              BoundingBox.fromGeoPoints(
                [
                  GeoPoint(
                    latitude: location.latitude,
                    longitude: location.longitude,
                  ),
                  GeoPoint(
                    latitude: device.location!.latitude,
                    longitude: device.location!.longitude,
                  ),
                ],
              ),
              paddinInPixel: 150,
            );
          },
        );
      },
    );

    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        IgnorePointer(
          ignoring: mapState is MapNavigate,
          child: OSMFlutter(
            controller: mapController,
            mapIsLoading: const QSLoading(),
            androidHotReloadSupport: true,
            initZoom: 12,
            maxZoomLevel: 17,
            staticPoints: [
              StaticPositionGeoPoint(
                'userLocation',
                MarkerIcon(
                  iconWidget: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colors.primary,
                    ),
                    padding: const EdgeInsets.all(4),
                    child: Icon(
                      Icons.person_outline,
                      color: context.colors.background,
                      size: markerSize * .8,
                    ),
                  ),
                ),
                [],
              ),
              ...devices.map(
                (e) => StaticPositionGeoPoint(
                  e.id,
                  MarkerIcon(
                    iconWidget: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.colors.background,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        getIconFromDeviceType(e.type),
                        color: context.colors.primary,
                        size: markerSize,
                      ),
                    ),
                  ),
                  [],
                ),
              ),
            ],
          ),
        ),
        if (mapState is MapNavigate &&
            mapState.device.location != null &&
            mapIsReady.value)
          SafeArea(
            child: GestureDetector(
              onTap: () => MapsLauncher.launchCoordinates(
                mapState.device.location!.latitude,
                mapState.device.location!.longitude,
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colors.primary,
                ),
                padding: const EdgeInsets.all(6),
                margin: const EdgeInsets.all(8),
                child: Icon(
                  Icons.navigation,
                  color: context.colors.secondaryLight,
                  size: 36,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
