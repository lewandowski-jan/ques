import 'package:freezed_annotation/freezed_annotation.dart';

part 'bluetooth_models.freezed.dart';

@freezed
class BluetoothDevice with _$BluetoothDevice {
  factory BluetoothDevice({
    required String id,
    required String name,
    required double distanceInMeters,
    required DateTime discoveryDate,
  }) = _BluetoothDevice;
}
