import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:ques/features/bluetooth/bluetooth_notifier.dart';
import 'package:ques/features/home/home_screen.dart';
import 'package:ques/features/location/location_notifier.dart';
import 'package:ques/features/router/routes.dart';
import 'package:ques/features/search/search_screen.dart';
import 'package:ques/features/settings/settings_screen.dart';
import 'package:ques/widgets/widgets.dart';

class MainPage extends MaterialPage<void> {
  MainPage({required Tabs tab}) : super(child: MainScreen(tab: tab));
}

class MainScreen extends HookConsumerWidget {
  const MainScreen({
    super.key,
    required this.tab,
  });

  final Tabs tab;

  TabController _useTabControllerEffect() {
    final tabController = useTabController(
      initialLength: Tabs.values.length,
      initialIndex: tab.index,
    );

    useEffect(
      () {
        tabController.animateTo(tab.index);

        return null;
      },
      [tab],
    );

    return tabController;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        ref
          ..read(locationProvider.notifier)
          ..read(bluetoothProvider.notifier);
        return null;
      },
      [],
    );

    final tabController = _useTabControllerEffect();

    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: Tabs.values.map((t) => t.mapToScreen()).toList(),
          ),
          QSBottomNavigationBar(
            currentTab: tab,
            onTabChanged: (tab) => GoMainRoute(tab: tab).go(context),
          ),
        ],
      ),
    );
  }
}

extension TabScreens on Tabs {
  int get index => Tabs.values.indexOf(this);

  Widget mapToScreen() {
    switch (this) {
      case Tabs.home:
        return const HomeScreen();
      case Tabs.search:
        return const SearchScreen();
      case Tabs.settings:
        return const SettingsScreen();
    }
  }
}
