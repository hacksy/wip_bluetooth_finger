import 'package:clone_app_xxx/src/core/sl/injection_container.dart';
import 'package:clone_app_xxx/src/features/devices/presentation/bloc/device/connect_device_cubit.dart';
import 'package:clone_app_xxx/src/features/devices/presentation/bloc/device/data_read_cubit.dart';
import 'package:clone_app_xxx/src/features/devices/presentation/bloc/device/device_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectToDevice extends StatelessWidget {
  const ConnectToDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: BlocBuilder<ConnectToDeviceCubit, DeviceState>(
          bloc: sl<ConnectToDeviceCubit>(),
          builder: (context, state) {
            return Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      state.connected
                          ? sl<ConnectToDeviceCubit>().disconnectToDevice()
                          : sl<ConnectToDeviceCubit>().connectToDevice();
                    },
                    child: Text(state.connected ? 'Disconnect' : 'Connect')),
                const Text('Hello'),
                ElevatedButton(
                    onPressed: () {
                      sl<DataReadCubit>().readField(
                          sl<ConnectToDeviceCubit>().state.entity, 'Battery');
                    },
                    child: const Text('Get Battery')),
                ElevatedButton(
                    onPressed: () {
                      sl<DataReadCubit>().readField(
                          sl<ConnectToDeviceCubit>().state.entity, 'Name');
                    },
                    child: const Text('Get SerialNumber')),
                ElevatedButton(
                    onPressed: () {
                      sl<DataReadCubit>().readField(
                          sl<ConnectToDeviceCubit>().state.entity,
                          'SerialNumber');
                    },
                    child: const Text('Get HWVersionName')),
                ElevatedButton(
                    onPressed: () {
                      sl<DataReadCubit>().readField(
                          sl<ConnectToDeviceCubit>().state.entity,
                          'HWVersionName');
                    },
                    child: const Text('Get Name')),
                BlocBuilder<DataReadCubit, DataReadState>(
                    bloc: sl<DataReadCubit>(),
                    builder: (context, state) {
                      return Text('${state.fieldName}: ${state.fieldValue}');
                    }),
              ],
            );
          }),
    );
  }
}
