import 'package:flutter/material.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:ques/features/bluetooth/models.dart/bluetooth_models.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/app_bar.dart';
import 'package:ques/widgets/widgets.dart';

class EditDeviceRoute extends MaterialPageRoute<void> {
  EditDeviceRoute({required BluetoothDevice device})
      : super(
          builder: (_) => EditDeviceScreen(device: device),
        );
}

class EditDeviceScreen extends HookWidget {
  const EditDeviceScreen({
    super.key,
    required this.device,
  });

  final BluetoothDevice device;

  Future<void> onAdd(BuildContext context) async {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController(
      text: device.name,
    );

    return Scaffold(
      appBar: QSAppBar(title: context.l10n.add_new_device_page_add_new_device),
      backgroundColor: context.colors.background,
      floatingActionButton: QSPrimaryButton(
        text: context.l10n.add_new_device_page_add,
        onPressed: () => onAdd(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            QSText(
              context.l10n.add_new_device_page_edit_device_name,
              style: context.textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            QSTextField(controller: textController),
            const SizedBox(height: 24),
            QSText(
              context.l10n.add_new_device_page_select_device_type,
              style: context.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
