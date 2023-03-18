import 'package:flutter/material.dart';
import 'package:ques/resources/colors.dart';

class QSTheme {
  static ThemeData light(BuildContext context) {
    return _build(
      context: context,
      primary: QSColors.of(context).primary,
      secondary: QSColors.of(context).secondary,
      lighterText: QSColors.of(context).textLight,
      darkerText: QSColors.of(context).textDark,
      surface: QSColors.of(context).secondaryLight,
      background: QSColors.of(context).background,
      error: QSColors.of(context).accent,
      onError: QSColors.of(context).accentLight,
      brightness: Brightness.light,
    );
  }

  static ThemeData dark(BuildContext context) {
    return _build(
      context: context,
      primary: QSColors.of(context).primary,
      secondary: QSColors.of(context).secondary,
      lighterText: QSColors.of(context).textLight,
      darkerText: QSColors.of(context).textDark,
      surface: QSColors.of(context).secondaryLight,
      background: QSColors.of(context).background,
      error: QSColors.of(context).accent,
      onError: QSColors.of(context).accentLight,
      brightness: Brightness.light,
    );
  }

  static ThemeData _build({
    required BuildContext context,
    required Brightness brightness,
    required QSColor primary,
    required QSColor secondary,
    required QSColor lighterText,
    required QSColor darkerText,
    required QSColor surface,
    required QSColor background,
    required QSColor error,
    required QSColor onError,
  }) {
    final defaultTextColor = QSColors.of(context).text;

    return ThemeData.from(
      colorScheme: ColorScheme(
        primary: primary,
        secondary: secondary,
        surface: surface,
        background: background,
        error: error,
        onPrimary: lighterText,
        onSecondary: darkerText,
        onSurface: darkerText,
        onBackground: darkerText,
        onError: onError,
        brightness: brightness,
      ),
    ).copyWith(
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
        ),
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: defaultTextColor,
          fontSize: 48,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: defaultTextColor,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: defaultTextColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: defaultTextColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          color: defaultTextColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(
          color: defaultTextColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: defaultTextColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: defaultTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

extension BuildContextTheme on BuildContext {
  QSColors get colors => QSColors.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;
}
