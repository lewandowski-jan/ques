import 'package:flutter_comms/flutter_comms.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

enum NotificationsStrategy { every, more, important }

class NotificationsStrategyCubit extends HydratedCubit<NotificationsStrategy>
    with StateSender {
  NotificationsStrategyCubit() : super(NotificationsStrategy.every);

  void changeStrategy(NotificationsStrategy newStrategy) {
    emit(newStrategy);
  }

  @override
  NotificationsStrategy? fromJson(Map<String, dynamic> json) {
    return NotificationsStrategy.values[json['index'] as int];
  }

  @override
  Map<String, dynamic>? toJson(NotificationsStrategy state) {
    return <String, dynamic>{'index': state.index};
  }
}
