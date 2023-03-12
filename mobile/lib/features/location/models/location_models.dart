import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_models.freezed.dart';

@freezed
class LatLong with _$LatLong {
  factory LatLong({
    required double latitude,
    required double longitude,
  }) = _LatLong;
}
