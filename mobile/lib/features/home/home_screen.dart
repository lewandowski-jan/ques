import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:ques/features/add_device/select_device_route.dart';
import 'package:ques/features/devices/devices_cubit.dart';
import 'package:ques/features/profile/profile_route.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/utils/spaced.dart';
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
    final devicesState = context.watch<DevicesCubit>().state;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QSText(
                    _getGreeting(context, null),
                    style: context.textTheme.bodyMedium,
                  ),
                  QSAvatar(
                    size: 50,
                    onTap: () => Navigator.of(context).push(ProfileRoute()),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  QSText(
                    context.l10n.home_page_devices,
                    style: context.textTheme.bodySmall,
                  ),
                  const QSDevicesSortingButton(),
                ],
              ),
              const SizedBox(height: 16),
              devicesState.map(
                initial: (_) => const SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Center(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                success: (success) => Column(
                  children: success.devices
                      .map((device) => QSDeviceTile(device: device))
                      .spaced(8)
                      .toList(),
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
