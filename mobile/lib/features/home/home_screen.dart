import 'package:flutter/material.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:ques/features/add_device/select_device_route.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  String _getGreeting(BuildContext context, String? name) {
    final now = DateTime.now().toLocal();

    late final String greeting;

    if (5 <= now.hour && now.hour < 12) {
      greeting = context.l10n.home_page_greeting_morning;
    } else if (12 <= now.hour && now.hour < 17) {
      greeting = context.l10n.home_page_greeting_afternoon;
    } else {
      greeting = context.l10n.home_page_greeting_evening;
    }

    return name != null ? '$greeting, $name!' : '$greeting!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: QSText(
                  _getGreeting(context, null),
                  style: context.textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 32),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: QSText(
                  context.l10n.home_page_devices,
                  style: context.textTheme.bodySmall,
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: QSTextButton(
                  text: context.l10n.home_page_add_new_device,
                  onPressed: () => Navigator.of(context).push(
                    SelectDeviceRoute(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
