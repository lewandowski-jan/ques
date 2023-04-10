import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:ques/features/foreground_task/task_handler.dart';
import 'package:ques/features/home/home_screen.dart';
import 'package:ques/features/router/routes.dart';
import 'package:ques/features/search/search_screen.dart';
import 'package:ques/features/settings/settings_screen.dart';
import 'package:ques/widgets/widgets.dart';

@pragma('vm:entry-point')
void _startTask() => FlutterForegroundTask.setTaskHandler(QuesTaskHandler());

class MainPage extends MaterialPage<void> {
  MainPage({required Tabs tab}) : super(child: MainScreen(tab: tab));
}

class MainScreen extends HookWidget {
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
  Widget build(BuildContext context) {
    final tabController = _useTabControllerEffect();

    return WillStartForegroundTask(
      onWillStart: () async => true,
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'notification_channel_id',
        channelName: 'Foreground Notification',
        channelDescription:
            'This notification appears when the foreground service is running.',
        channelImportance: NotificationChannelImportance.LOW,
        priority: NotificationPriority.LOW,
        iconData: const NotificationIconData(
          resType: ResourceType.mipmap,
          resPrefix: ResourcePrefix.ic,
          name: 'ic_launcher',
        ),
      ),
      iosNotificationOptions: const IOSNotificationOptions(),
      foregroundTaskOptions: const ForegroundTaskOptions(allowWifiLock: true),
      notificationTitle: 'Still looking for your devices',
      notificationText: 'Tap to return to the app',
      callback: _startTask,
      child: Scaffold(
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
