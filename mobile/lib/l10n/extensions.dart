import 'package:flutter/material.dart';
import 'package:ques/features/router/routes.dart';
import 'package:ques/l10n/localizations.dart';

extension BuildContextLocalizations on BuildContext {
  QSLocalizations get l10n => QSLocalizations.of(this)!;
}

extension QSLocalizationsX on QSLocalizations {
  String getBottomNavigationLabel(Tabs tab) {
    switch (tab) {
      case Tabs.home:
        return main_page_bottom_navigation_home;
      case Tabs.search:
        return main_page_bottom_navigation_search;
      case Tabs.settings:
        return main_page_bottom_navigation_settings;
    }
  }
}
