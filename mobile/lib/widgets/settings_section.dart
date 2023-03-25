import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/utils/spaced.dart';
import 'package:ques/widgets/widgets.dart';

enum SettingsSectionStyle { primary, secondary, accent }

class QSSettingsSection extends StatelessWidget {
  const QSSettingsSection({
    super.key,
    required this.buttons,
    required this.style,
    this.title,
  });

  final String? title;
  final List<SettingsButtonData> buttons;
  final SettingsSectionStyle style;

  QSColor _getPrimaryColor(BuildContext context) {
    switch (style) {
      case SettingsSectionStyle.primary:
        return context.colors.primaryLight;
      case SettingsSectionStyle.secondary:
        return context.colors.secondary;
      case SettingsSectionStyle.accent:
        return context.colors.accent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttonsLength = buttons.length;
    _SettingsButtonRounding getRounding(int index) {
      if (index == 0) {
        if (buttonsLength == 1) {
          return _SettingsButtonRounding.all;
        }
        return _SettingsButtonRounding.top;
      }

      if (index == buttonsLength - 1) {
        return _SettingsButtonRounding.bottom;
      }

      return _SettingsButtonRounding.zero;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          QSText(
            title!,
            style: context.textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
        ],
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: _getPrimaryColor(context)),
          ),
          child: Column(
            children: buttons
                .mapIndexed(
                  (index, button) => SizedBox(
                    height: index == 0 ? 50 : 49,
                    child: _SettingsButton(
                      data: button,
                      rounding: getRounding(index),
                      style: style,
                    ),
                  ),
                )
                .spacedWith(
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: _getPrimaryColor(context),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class SettingsButtonData {
  SettingsButtonData({
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback? onTap;
}

enum _SettingsButtonRounding { top, bottom, zero, all }

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({
    required this.data,
    required this.rounding,
    required this.style,
  });

  final SettingsButtonData data;
  final _SettingsButtonRounding rounding;
  final SettingsSectionStyle style;

  QSColor _getPrimaryColor(BuildContext context) {
    switch (style) {
      case SettingsSectionStyle.primary:
        return context.colors.primaryLight;
      case SettingsSectionStyle.secondary:
        return context.colors.secondary;
      case SettingsSectionStyle.accent:
        return context.colors.accent;
    }
  }

  QSColor _getSecondaryColor(BuildContext context) {
    switch (style) {
      case SettingsSectionStyle.primary:
        return context.colors.secondaryLight;
      case SettingsSectionStyle.secondary:
        return context.colors.background;
      case SettingsSectionStyle.accent:
        return context.colors.background;
    }
  }

  BorderRadiusGeometry _getBorderRadius() {
    switch (rounding) {
      case _SettingsButtonRounding.top:
        return const BorderRadius.vertical(top: Radius.circular(8));
      case _SettingsButtonRounding.bottom:
        return const BorderRadius.vertical(bottom: Radius.circular(8));
      case _SettingsButtonRounding.all:
        return const BorderRadius.all(Radius.circular(8));
      case _SettingsButtonRounding.zero:
        return BorderRadius.zero;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: data.onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: _getBorderRadius(),
          color: context.colors.textWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            QSText(
              data.text,
              style: context.textTheme.displaySmall,
            ),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _getPrimaryColor(context),
              ),
              child: Icon(
                Icons.chevron_right,
                color: _getSecondaryColor(context),
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
