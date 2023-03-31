import 'package:flutter_comms/flutter_comms.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ques/features/devices/models/devices_models.dart';

part 'map_cubit.freezed.dart';

class MapCubit extends ListenerCubit<MapState, MapMessage> {
  MapCubit() : super(const MapState.initial());

  @override
  void onMessage(MapMessage message) {
    message.when(
      navigate: (device) => emit(MapState.navigate(device: device)),
    );
  }

  @override
  void onInitialMessage(MapMessage message) => onMessage(message);
}

@freezed
class MapState with _$MapState {
  const factory MapState.initial() = MapInitial;

  const factory MapState.navigate({
    required Device device,
  }) = MapNavigate;
}

@freezed
class MapMessage with _$MapMessage {
  const factory MapMessage.navigate({
    required Device device,
  }) = MapMessageNavigate;
}
