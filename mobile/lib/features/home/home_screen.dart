import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_comms/flutter_comms.dart';
import 'package:ques/features/add_device/select_device_route.dart';
import 'package:ques/features/bluetooth/bluetooth_cubit.dart';
import 'package:ques/features/devices/devices_cubit.dart';
import 'package:ques/features/edit_user_device/edit_user_device_route.dart';
import 'package:ques/features/location/location_cubit.dart';
import 'package:ques/features/maps/map_cubit.dart';
import 'package:ques/features/profile/profile_route.dart';
import 'package:ques/features/router/routes.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/utils/spaced.dart';
import 'package:ques/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
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

    return name != null ? '$greeting, $name' : greeting;
  }

  Future<void> _onRefresh(BuildContext context) async {
    await Future.wait([
      context.read<BluetoothCubit>().refresh(),
      context.read<LocationCubit>().init(),
      context.read<DevicesCubit>().init(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final devicesState = context.watch<DevicesCubit>().state;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.white,
              systemNavigationBarColor: Colors.white,
              statusBarBrightness: Brightness.light,
              systemStatusBarContrastEnforced: true,
            ),
            backgroundColor: context.colors.transparent,
            shadowColor: context.colors.transparent,
            floating: true,
            forceElevated: true,
            titleSpacing: 16,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(64),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                  ],
                ),
              ),
            ),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
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
              ],
            ),
          ),
          CupertinoSliverRefreshControl(onRefresh: () => _onRefresh(context)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: devicesState.map(
              initial: (_) => SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(
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
              success: _DevicesList.new,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }
}

class _DevicesList extends StatelessWidget with Sender<MapMessage> {
  const _DevicesList(this.success);

  final DevicesSuccess success;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          ...success.devices.map(
            (device) {
              return QSDeviceTile(
                device: device,
                onTap: () {
                  send(
                    MapMessage.navigate(device: device),
                    oneOff: true,
                  );
                  GoMainRoute(tab: Tabs.search).go(context);
                },
                onLongPress: () => Navigator.of(context).push(
                  EditUserDeviceRoute(
                    device: device.userDevice,
                  ),
                ),
              );
            },
          ).spaced(8),
          const SizedBox(height: 8),
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
    );
  }
}
