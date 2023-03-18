import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ques/features/add_device/edit_device_route.dart';
import 'package:ques/features/bluetooth/bluetooth_cubit.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/utils/spaced.dart';
import 'package:ques/widgets/app_bar.dart';
import 'package:ques/widgets/widgets.dart';

class SelectDeviceRoute extends MaterialPageRoute<void> {
  SelectDeviceRoute() : super(builder: (_) => const SelectDeviceScreen());
}

class SelectDeviceScreen extends StatelessWidget {
  const SelectDeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bluetoothState = context.watch<BluetoothCubit>().state;

    return Scaffold(
      appBar: QSAppBar(title: context.l10n.add_new_device_page_add_new_device),
      backgroundColor: context.colors.background,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            QSText(
              context.l10n.add_new_device_page_select_device,
              style: context.textTheme.bodySmall,
            ),
            const SizedBox(height: 8),
            bluetoothState.map(
              initial: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
              found: (state) => Column(
                children: state.devices.values
                    .map(
                      (device) => QSDeviceTile(
                        device: device,
                        onTap: () => Navigator.of(context).push(
                          EditDeviceRoute(device: device),
                        ),
                      ),
                    )
                    .spacedWith(const SizedBox(height: 12))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
