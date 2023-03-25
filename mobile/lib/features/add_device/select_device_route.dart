import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ques/features/add_device/edit_device_route.dart';
import 'package:ques/features/bluetooth/bluetooth_cubit.dart';
import 'package:ques/features/devices/devices_cubit.dart';
import 'package:ques/features/devices/models/devices_models.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/utils/spaced.dart';
import 'package:ques/widgets/widgets.dart';

class SelectDeviceRoute extends MaterialPageRoute<void> {
  SelectDeviceRoute() : super(builder: (_) => const SelectDeviceScreen());
}

class SelectDeviceScreen extends StatelessWidget {
  const SelectDeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bluetoothState = context.watch<BluetoothCubit>().state;
    final addedDevicesIds = (context.watch<DevicesCubit>().state.mapOrNull(
                  success: (success) => success.devices,
                ) ??
            [])
        .map((e) => e.id);

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
              found: (state) {
                final bleDevices = {...state.devices}..removeWhere(
                    (key, value) => addedDevicesIds.contains(key),
                  );

                return Column(
                  children: bleDevices.values
                      .map(
                        (device) => QSDeviceTile(
                          device: Device(
                            userDevice:
                                UserDevice(id: device.id, name: device.name),
                            deviceLocation: DeviceLocation(
                              id: device.id,
                              latitude: null,
                              longitude: null,
                              distanceInMeters: device.distanceInMeters.round(),
                              discoveryDate: device.discoveryDate,
                            ),
                          ),
                          onTap: () => Navigator.of(context).push(
                            EditDeviceRoute(device: device),
                          ),
                        ),
                      )
                      .spacedWith(const SizedBox(height: 12))
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
