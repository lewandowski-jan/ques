import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ques/features/auth/sign_in_page.dart';
import 'package:ques/features/loading/loading_page.dart';
import 'package:ques/features/main/main_page.dart';

part 'routes.g.dart';

const _goLoadingLocation = '/';
const _goMainLocation = '/:tab';
const _goSignInLocation = '/sign-in';

@TypedGoRoute<GoLoadingRoute>(path: _goLoadingLocation)
class GoLoadingRoute extends GoRouteData {
  GoLoadingRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const LoadingPage();
}

@TypedGoRoute<GoSignInRoute>(path: _goSignInLocation)
class GoSignInRoute extends GoRouteData {
  GoSignInRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      const SignInPage();
}

enum Tabs { home, search, settings }

@TypedGoRoute<GoMainRoute>(path: _goMainLocation)
class GoMainRoute extends GoRouteData {
  GoMainRoute({required this.tab});

  final Tabs tab;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      MainPage(tab: tab);
}
