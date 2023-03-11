// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $goLoadingRoute,
      $goSignInRoute,
      $goMainRoute,
    ];

GoRoute get $goLoadingRoute => GoRouteData.$route(
      path: '/',
      factory: $GoLoadingRouteExtension._fromState,
    );

extension $GoLoadingRouteExtension on GoLoadingRoute {
  static GoLoadingRoute _fromState(GoRouterState state) => GoLoadingRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

GoRoute get $goSignInRoute => GoRouteData.$route(
      path: '/sign-in',
      factory: $GoSignInRouteExtension._fromState,
    );

extension $GoSignInRouteExtension on GoSignInRoute {
  static GoSignInRoute _fromState(GoRouterState state) => GoSignInRoute();

  String get location => GoRouteData.$location(
        '/sign-in',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

GoRoute get $goMainRoute => GoRouteData.$route(
      path: '/:tab',
      factory: $GoMainRouteExtension._fromState,
    );

extension $GoMainRouteExtension on GoMainRoute {
  static GoMainRoute _fromState(GoRouterState state) => GoMainRoute(
        tab: _$TabsEnumMap._$fromName(state.params['tab']!),
      );

  String get location => GoRouteData.$location(
        '/${Uri.encodeComponent(_$TabsEnumMap[tab]!)}',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

const _$TabsEnumMap = {
  Tabs.home: 'home',
  Tabs.search: 'search',
  Tabs.settings: 'settings',
};

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}
