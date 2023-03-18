import 'package:flutter/material.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:ques/features/add_device/select_device_route.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/widgets/widgets.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
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
