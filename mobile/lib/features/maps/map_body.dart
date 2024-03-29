// ignore_for_file: must_be_immutable

import 'dart:async';
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
import 'package:ques/features/location/models/location_models.dart';
import 'package:ques/features/maps/map_controller_extension.dart';
import 'package:ques/features/maps/map_cubit.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/utils/osm_hooks.dart';
import 'package:rxdart/rxdart.dart';

class MapBody extends HookWidget {
  MapBody({super.key});

  StreamSubscription<LatLong?>? _locationSub;
  StreamSubscription<DevicesState>? _devicesSub;
  StreamSubscription<List<Object?>>? _locationDevicesSub;

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        return () {
          _locationSub?.cancel();
          _devicesSub?.cancel();
          _locationDevicesSub?.cancel();
        };
      },
      [],
    );

    final markerSize = Platform.isIOS ? 30.0 : 60.0;

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
        await mapState.map(
          initial: (_) async {
            final location = locationCubit.state;
            await mapController.setPosition(
              of: 'userLocation',
              to: location,
            );

            await _locationSub?.cancel();
            _locationSub = locationCubit.stream.listen((location) async {
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

            await _devicesSub?.cancel();
            _devicesSub = devicesCubit.stream.listen((state) async {
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
            final location = locationCubit.state;
            await mapController.setPosition(
              of: 'userLocation',
              to: location,
            );

            final device = devices.firstWhereOrNull(
                  (d) => d.id == navigate.device.id,
                ) ??
                navigate.device;

            await mapController.setPosition(
              of: device.id,
              to: device.location,
            );

            final locationDevicesStream = CombineLatestStream.combine2(
              locationCubit.stream,
              devicesCubit.stream,
              (a, b) => [a, b],
            );

            await _locationDevicesSub?.cancel();
            _locationDevicesSub = locationDevicesStream.listen((values) async {
              final location = values[0] as LatLong?;
              await mapController.setPosition(
                of: 'userLocation',
                to: location,
              );

              final state = values[1]! as DevicesState;
              final devices = state.mapOrNull(success: (s) => s.devices) ?? [];

              for (final device in devices) {
                if (device.id == navigate.device.id) {
                  await mapController.setPosition(
                    of: device.id,
                    to: device.location,
                  );

                  if (location == null || device.location == null) {
                    break;
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
              paddinInPixel: 100,
            );

            await devicesCubit.refresh();
          },
        );

        // mapIsReady.value = true;
      },
    );

    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        OSMFlutter(
          controller: mapController,
          mapIsLoading: const QSLoading(),
          androidHotReloadSupport: true,
          initZoom: 12,
          maxZoomLevel: mapState is MapNavigate ? 17 : 19,
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
        if (mapState is MapNavigate && mapState.device.location != null)
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
