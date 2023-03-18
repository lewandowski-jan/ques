import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_comms/flutter_comms.dart';

class AuthCubit extends Cubit<AuthState> with StateSender {
  AuthCubit() : super(AuthInitial()) {
    init();
  }

  StreamSubscription<User?>? authStateSubscription;

  Future<void> init() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      emit(AuthAuthenticated(user));
    } else {
      emit(AuthUnauthenticated());
    }

    await authStateSubscription?.cancel();
    authStateSubscription = FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        if (user == null) {
          emit(AuthUnauthenticated());
        } else {
          emit(AuthAuthenticated(user));
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
  Future<void> close() async {
    await authStateSubscription?.cancel();
    await super.close();
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
