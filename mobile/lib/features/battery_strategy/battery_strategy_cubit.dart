import 'package:flutter_comms/flutter_comms.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

enum BatteryStrategy { accurate, optimal, loose }

class BatteryStrategyCubit extends HydratedCubit<BatteryStrategy>
    with StateSender {
  BatteryStrategyCubit() : super(BatteryStrategy.accurate);

  void changeStrategy(BatteryStrategy newStrategy) {
    emit(newStrategy);
  }

  @override
  BatteryStrategy? fromJson(Map<String, dynamic> json) {
    return BatteryStrategy.values[json['index'] as int];
  }

  @override
  Map<String, dynamic>? toJson(BatteryStrategy state) {
    return <String, dynamic>{'index': state.index};
  }
}
