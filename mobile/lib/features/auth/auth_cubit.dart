import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_comms/flutter_comms.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> with StateSender {
  AuthCubit() : super(const AuthState.initial()) {
    init();
  }

  StreamSubscription<User?>? authStateSubscription;
  StreamSubscription<User?>? userChangesSubscription;

  Future<void> init() async {
    final initialUser = FirebaseAuth.instance.currentUser;
    _onUser(initialUser);

    await userChangesSubscription?.cancel();
    userChangesSubscription = FirebaseAuth.instance.userChanges().listen(
      (user) {
        if (user?.email != initialUser?.email ||
            user?.displayName != initialUser?.displayName ||
            user?.uid != initialUser?.uid) {
          _onUser(user);
        }
      },
    );
  }

  void _onUser(User? user) {
    if (user != null) {
      emit(AuthState.authenticated(user: user));
    } else {
      emit(const AuthState.unauthenticated());
    }
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

  Future<bool> changeUserName({required String userName}) async {
    try {
      final result = await state.mapOrNull(
        authenticated: (authenticated) async {
          final user = authenticated.user;
          await user.updateDisplayName(userName);

          return true;
        },
      );

      if (result != null) {
        return result;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> changePassword({
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      return false;
    }

    try {
      final result = await state.mapOrNull(
        authenticated: (authenticated) async {
          final user = authenticated.user;
          await user.updatePassword(password);

          return true;
        },
      );

      if (result != null) {
        return result;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> close() async {
    await authStateSubscription?.cancel();
    await userChangesSubscription?.cancel();
    await super.close();
  }
}

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.initial() = AuthInitial;

  const factory AuthState.authenticated({
    required User user,
  }) = AuthAuthenticated;

  const factory AuthState.unauthenticated() = AuthUnauthenticated;

  bool get authenticated => map(
        initial: (_) => false,
        authenticated: (_) => true,
        unauthenticated: (_) => false,
      );
}
