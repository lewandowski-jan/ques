import 'package:firebase_database/firebase_database.dart';

class RealtimeDatabase {
  RealtimeDatabase() {
    _ref = FirebaseDatabase.instance.ref();
  }

  late final DatabaseReference _ref;

  Future<bool> exists(String path) async {
    final snapshot = await _ref.child(path).get();
    return snapshot.exists;
  }

  Future<void> update(String path, {required Map<String, dynamic> json}) async {
    return _ref.child(path).update(json);
  }

  Future<Map<String, dynamic>?> get(String path) async {
    final snapshot = await _ref.child(path).get();
    if (snapshot.exists) {
      return Map<String, dynamic>.from(
        snapshot.value! as Map<Object?, Object?>,
      );
    }
    return null;
  }

  Future<void> delete(String path) async {
    return _ref.child(path).remove();
  }

  Stream<Map<String, dynamic>?> onValue(String path) async* {
    yield* _ref.child(path).onValue.map(
      (event) {
        if (event.snapshot.exists) {
          return Map<String, dynamic>.from(
            event.snapshot.value! as Map<Object?, Object?>,
          );
        }
        return null;
      },
    );
  }
}

class RealtimeDatabasePath {
  static String get devicesLocationsPath => 'devicesLocations/';
  static String get usersPath => 'users/';
  static String getUserPath(String userId) => '$usersPath$userId';
  static String getUserDevicePath(String userId, String deviceId) =>
      '$usersPath$userId/$deviceId';
  static String getDeviceLocationPath(String deviceId) =>
      '$devicesLocationsPath$deviceId';
}
