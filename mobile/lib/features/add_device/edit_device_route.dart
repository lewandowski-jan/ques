import 'package:flutter/material.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/bluetooth/models.dart/bluetooth_models.dart';
import 'package:ques/features/devices/devices_cubit.dart';
import 'package:ques/features/devices/models/devices_models.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';
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

  Future<void> onTapAdd(
    BuildContext context, {
    required DeviceType? deviceType,
    required String name,
    required VoidCallback onError,
  }) async {
    if (name.isNotEmpty) {
      final result = await context.read<DevicesCubit>().addDevice(
            device: device,
            name: name,
            deviceType: deviceType,
          );

      if (result) {
        return Navigator.of(context).popUntil((route) => route.isFirst);
      }

      showToast(
        context.l10n.add_new_device_page_device_exists,
        textStyle: context.textTheme.bodySmall,
        backgroundColor: context.colors.accent,
      );
    }

    onError();
  }

  @override
  Widget build(BuildContext context) {
    final hasError = useState(false);
    final nameController = useSyncedTextEditingController(
      (_) => hasError.value = false,
      initialText: device.name,
    );

    final selectedType = useState<DeviceType?>(null);

    return Scaffold(
      appBar: QSAppBar(title: context.l10n.add_new_device_page_add_new_device),
      backgroundColor: context.colors.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: QSPrimaryButton(
        text: context.l10n.add_new_device_page_add,
        onPressed: () => onTapAdd(
          context,
          deviceType: selectedType.value,
          name: nameController.text,
          onError: () => hasError.value = true,
        ),
      ),
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
            QSTextField(
              controller: nameController,
              hasError: hasError.value,
            ),
            const SizedBox(height: 24),
            QSText(
              context.l10n.add_new_device_page_select_device_type,
              style: context.textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Center(
              child: Wrap(
                runSpacing: 16,
                spacing: 16,
                children: DeviceType.values
                    .map(
                      (type) => QSDeviceTypeTile(
                        type: type,
                        selected: selectedType.value == type,
                        onTap: () => selectedType.value = type,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
