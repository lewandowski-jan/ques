import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/devices/devices_cubit.dart';
import 'package:ques/features/devices/models/devices_models.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class EditUserDeviceRoute extends MaterialPageRoute<void> {
  EditUserDeviceRoute({required UserDevice device})
      : super(
          builder: (_) => EditUserDeviceScreen(device: device),
        );
}

class EditUserDeviceScreen extends HookWidget {
  const EditUserDeviceScreen({
    super.key,
    required this.device,
  });

  final UserDevice device;

  Future<void> onTapSave(
    BuildContext context, {
    required DeviceType? deviceType,
    required String name,
    required VoidCallback onError,
  }) async {
    if (name.isNotEmpty) {
      final result = await context.read<DevicesCubit>().editDevice(
            device: UserDevice(
              id: device.id,
              name: name,
              type: deviceType ?? DeviceType.unknown,
            ),
          );

      if (result) {
        return Navigator.of(context).popUntil((route) => route.isFirst);
      }

      showToast(
        context.l10n.edit_user_device_page_something_went_wrong,
        textStyle: context.textTheme.bodySmall,
        backgroundColor: context.colors.accent,
      );
    }

    onError();
  }

  Future<void> onDelete(BuildContext context) async {
    final result = await context.read<DevicesCubit>().deleteDevice(
          deviceId: device.id,
        );

    if (result) {
      return Navigator.of(context).popUntil((route) => route.isFirst);
    }

    showToast(
      context.l10n.edit_user_device_page_something_went_wrong,
      textStyle: context.textTheme.bodySmall,
      backgroundColor: context.colors.accent,
    );
  }

  void onTapDelete(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: QSText(
          context.l10n.edit_user_device_page_alert,
          style: context.textTheme.bodySmall,
        ),
        content: QSText(
          context.l10n.edit_user_device_page_are_you_sure,
          style: context.textTheme.bodySmall,
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: QSText(
              context.l10n.edit_user_device_page_no,
              style: context.textTheme.bodySmall,
              color: context.colors.primaryLight,
            ),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              onDelete(context);
              Navigator.of(context).pop();
            },
            child: QSText(
              context.l10n.edit_user_device_page_yes,
              style: context.textTheme.bodySmall,
              color: context.colors.accent,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final hasError = useState(false);
    final nameController = useSyncedTextEditingController(
      (_) => hasError.value = false,
      initialText: device.name,
    );

    final selectedType = useState<DeviceType?>(device.type);

    return Scaffold(
      appBar: QSAppBar(title: context.l10n.edit_user_device_page_edit_device),
      backgroundColor: context.colors.background,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          QSPrimaryButton(
            text: context.l10n.edit_user_device_page_save,
            onPressed: () => onTapSave(
              context,
              deviceType: selectedType.value,
              name: nameController.text,
              onError: () => hasError.value = true,
            ),
          ),
          const SizedBox(height: 12),
          QSPrimaryButton(
            text: context.l10n.edit_user_device_page_delete,
            destructive: true,
            onPressed: () => onTapDelete(context),
          ),
        ],
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
