import 'dart:async';

import 'package:async/async.dart' show StreamGroup;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/auth/auth_cubit.dart';
import 'package:ques/features/router/routes.dart';

class QSRouter {
  QSRouter({
    required List<Stream<dynamic>> refreshStreams,
  }) {
    final refreshListenable = GoRouterRefreshStream(
      StreamGroup.merge<dynamic>(refreshStreams),
    );

    router = GoRouter(
      routes: $appRoutes,
      debugLogDiagnostics: true,
      initialLocation: GoLoadingRoute().location,
      refreshListenable: refreshListenable,
      navigatorKey: navigatorKey,
      redirect: _redirect,
    );
  }

  late final GoRouter router;

  final navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get navigator => navigatorKey.currentState;

  String? _redirect(
    BuildContext context,
    GoRouterState state,
  ) {
    final authState = context.read<AuthCubit>().state;

    if (!authState.authenticated) {
      return _antiLoopGuard(state.location, GoSignInRoute().location);
    }

    if (authState.authenticated) {
      if (state.location == GoSignInRoute().location ||
          state.location == GoLoadingRoute().location) {
        return _antiLoopGuard(
          state.location,
          GoMainRoute(tab: Tabs.home).location,
        );
      } else {
        return null;
      }
    }

    return null;
  }

  String? _antiLoopGuard(String location, String? destination) {
    if (destination != null && location != destination) {
      return destination;
    }
    return null;
  }
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
