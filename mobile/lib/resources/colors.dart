import 'package:flutter/material.dart';

class QSColor extends Color {
  const QSColor._(super.value);

  QSColor._color(Color color) : super(color.value);

  QSColor alphaBlend(QSColor background) {
    return QSColor._color(Color.alphaBlend(this, background));
  }

  @override
  QSColor withOpacity(double opacity) {
    return QSColor._color(super.withOpacity(opacity));
  }
}

class QSColorTween extends Tween<QSColor?> {
  QSColorTween({super.begin, super.end});

  @override
  QSColor? lerp(double t) => QSColor._color(Color.lerp(begin, end, t)!);
}

abstract class QSColors {
  const QSColors._();

  static QSColors of(BuildContext context) =>
      QSColors.ofBrightness(Theme.of(context).brightness);

  static QSColors ofBrightness(Brightness brightness) {
    switch (brightness) {
      case Brightness.light:
        return const _ColorsLight();
      case Brightness.dark:
        return const _ColorsLight();
    }
  }

  QSColor get primary;
  QSColor get primaryLight;
  QSColor get secondary;
  QSColor get secondaryLight;
  QSColor get background;
  QSColor get accent;
  QSColor get accentLight;

  QSColor get transparent;

  QSColor get textDark;
  QSColor get text;
  QSColor get textLight;
  QSColor get textWhite;
}

class _ColorsLight extends QSColors {
  const _ColorsLight() : super._();

  @override
  QSColor get accent => const QSColor._(0xFFFF6680);
  @override
  QSColor get accentLight => const QSColor._(0xFFFF99AA);
  @override
  QSColor get background => const QSColor._(0xFFFFFFFF);
  @override
  QSColor get primary => const QSColor._(0xFF272643);
  @override
  QSColor get primaryLight => const QSColor._(0xFF2C698D);
  @override
  QSColor get secondary => const QSColor._(0xFFBAE8E8);
  @override
  QSColor get secondaryLight => const QSColor._(0xFFE3F6F5);

  @override
  QSColor get transparent => const QSColor._(0x00000000);

  @override
  QSColor get text => const QSColor._(0xFF3C3B3B);
  @override
  QSColor get textDark => const QSColor._(0xFF000000);
  @override
  QSColor get textLight => const QSColor._(0xFF9B9B9B);
  @override
  QSColor get textWhite => const QSColor._(0xFFF9F9F9);
}
