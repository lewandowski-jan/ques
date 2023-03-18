import 'package:firebase_database/firebase_database.dart';

class DynamicDatabase {
  final _ref = FirebaseDatabase.instance.ref();

  Future<bool> exists(String path) async {
    final snapshot = await _ref.child(path).get();
    return snapshot.exists;
  }

  Future<void> update(String path, {required Map<String, dynamic> json}) async {
    return _ref.child(path).update(json);
  }

  Future<Object?> get(String path) async {
    final snapshot = await _ref.child(path).get();
    if (snapshot.exists) {
      return snapshot.value;
    }
    return null;
  }

  Stream<Map<String, dynamic>?> onValue(String path) async* {
    // final ref = _ref.child(path);

    // final snapshot = await ref.get();
    // if (snapshot.exists) {
    //   yield snapshot.value as Map<String, dynamic>?;
    // }

    yield* _ref.child(path).onValue.map(
      (event) {
        if (event.snapshot.exists) {
          return event.snapshot.value as Map<String, dynamic>?;
        }
        return null;
      },
    );
  }
}

class DynamicDatabasePath {
  static String get devicesPath => 'devices/';
  static String get usersPath => 'users/';
  static String getUserPath(String userId) => '$usersPath$userId';
  static String getDevicePath(String deviceId) => '$devicesPath$deviceId';
}
