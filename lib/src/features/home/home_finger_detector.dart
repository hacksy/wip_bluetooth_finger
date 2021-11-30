import 'package:clone_app_xxx/src/core/sl/injection_container.dart';
import 'package:clone_app_xxx/src/features/devices/presentation/bloc/device/connect_device_cubit.dart';
import 'package:clone_app_xxx/src/features/devices/presentation/bloc/device/device_cubit.dart';
import 'package:clone_app_xxx/src/features/devices/presentation/bloc/device/device_list_state.dart';
import 'package:clone_app_xxx/src/features/devices/presentation/widgets/bluetooth_connection_widget.dart';
import 'package:clone_app_xxx/src/features/home/connect_to_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFingerDetector extends StatelessWidget {
  const HomeFingerDetector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('Finger oxymeter'),
        actions: [
          GestureDetector(
              onTap: () {
                searchForDevices(context);
              },
              child: const Icon(Icons.info_sharp)),
        ],
      ),
      body: Column(children: [
        const BluetoothConnectionWidget(),
        BlocBuilder<DeviceCubit, DeviceListState>(
          bloc: sl<DeviceCubit>(),
          builder: (context, state) {
            switch (state.status) {
              case DeviceListStatus.empty:
                return const SizedBox();
              case DeviceListStatus.searching:
                return const CircularProgressIndicator();
              case DeviceListStatus.loaded:
                final items = state.entity;
                return Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return ListTile(
                        onTap: () {
                          sl<ConnectToDeviceCubit>().selectDevice(item);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const ConnectToDevice()));
                        },
                        title: Text(item.name),
                        subtitle: Text(item.id),
                      );
                    },
                  ),
                );
              case DeviceListStatus.error:
                return const Text('Error');
            }
          },
        ),
      ]),
    );
  }
}
