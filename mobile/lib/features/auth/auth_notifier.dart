import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier()..init(),
);

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthInitial());

  StreamSubscription<User?>? authStateSubscription;

  Future<void> init() async {
    await authStateSubscription?.cancel();
    authStateSubscription = FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        if (user == null) {
          state = AuthUnauthenticated();
        } else {
          state = AuthAuthenticated(user);
        }
      },
    );
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signOut() async => FirebaseAuth.instance.signOut();

  Future<bool> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  void dispose() {
    authStateSubscription?.cancel();
    super.dispose();
  }
}

abstract class AuthState {
  bool get authenticated;
}

class AuthInitial extends AuthState {
  @override
  bool get authenticated => false;
}

class AuthAuthenticated extends AuthState {
  AuthAuthenticated(this.user);

  final User user;

  @override
  bool get authenticated => true;
}

class AuthUnauthenticated extends AuthState {
  @override
  bool get authenticated => false;
}
