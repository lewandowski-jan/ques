import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:leancode_hooks/leancode_hooks.dart';

/// [MapControllerHook]
///
/// this controller hook is to illustrate statefull widget for hooks
/// where the [MapController] will be initialized
class MapControllerHook extends Hook<MapController> {
  const MapControllerHook({
    this.initMapWithUserPosition = false,
    this.initPosition,
    this.areaLimit,
    this.tile,
  });

  final bool initMapWithUserPosition;
  final GeoPoint? initPosition;
  final BoundingBox? areaLimit;
  final CustomTile? tile;

  @override
  HookState<MapController, Hook<MapController>> createState() =>
      _MapControllerHookState();
}

class _MapControllerHookState
    extends HookState<MapController, MapControllerHook> {
  late MapController _controller;

  @override
  void initHook() {
    super.initHook();
    if (hook.tile == null) {
      _controller = MapController(
        initMapWithUserPosition: hook.initMapWithUserPosition,
        initPosition: hook.initPosition,
        areaLimit: hook.areaLimit,
      );
    } else if (hook.tile != null) {
      _controller = MapController.customLayer(
        initMapWithUserPosition: hook.initMapWithUserPosition,
        initPosition: hook.initPosition,
        areaLimit: hook.areaLimit,
        customTile: hook.tile!,
      );
    }
  }

  @override
  MapController build(BuildContext context) {
    return _controller;
  }

  @override
  void dispose() {
    _controller.dispose();
  }
}

typedef MapIsReady = Function();

/// [MapIsReadyHook]
///
/// this hook is to replace MapIsReady for hook state
/// where you can put your logic after the map is ready to use
class MapIsReadyHook extends Hook<MapIsReady> {
  const MapIsReadyHook({
    required this.mapIsReady,
    required this.controller,
  });
  final MapIsReady mapIsReady;
  final MapController controller;

  @override
  HookState<MapIsReady, Hook<MapIsReady>> createState() =>
      _MapIsReadyHookState();
}

class _MapIsReadyHookState extends HookState<MapIsReady, MapIsReadyHook>
    with OSMMixinObserver {
  late MapController _controller;

  @override
  void initHook() {
    super.initHook();
    _controller = hook.controller;
    _controller.addObserver(this);
  }

  @override
  MapIsReady build(BuildContext context) {
    return hook.mapIsReady;
  }

  @override
  void dispose() {}

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (isReady) {
      hook.mapIsReady();
    }
  }
}

/// [useMapIsReady]
///
/// the function will call [MapIsReadyHook]
void useMapIsReady({
  required MapController controller,
  required Function() mapIsReady,
}) {
  return use(
    MapIsReadyHook(
      mapIsReady: mapIsReady,
      controller: controller,
    ),
  );
}

/// [useMapController]
///
/// the function will call [MapControllerHook] to initialize [MapController]
/// return [MapController] that will passe  to [OSMFlutter]
MapController useMapController({
  bool initMapWithUserPosition = false,
  GeoPoint? initPosition,
  BoundingBox? areaLimit = const BoundingBox.world(),
  CustomTile? tile,
}) {
  assert(initMapWithUserPosition ^ (initPosition != null));
  return use(
    MapControllerHook(
      initMapWithUserPosition: initMapWithUserPosition,
      initPosition: initPosition,
      areaLimit: areaLimit,
      tile: tile,
    ),
  );
}
