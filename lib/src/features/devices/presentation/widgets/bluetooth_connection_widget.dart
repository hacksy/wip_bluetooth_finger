import 'package:clone_app_xxx/src/core/sl/injection_container.dart';
import 'package:clone_app_xxx/src/features/devices/presentation/bloc/device/device_cubit.dart';
import 'package:flutter/material.dart';

class BluetoothConnectionWidget extends StatelessWidget {
  const BluetoothConnectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Search for Devices'),
      onPressed: () {
        sl<DeviceCubit>().startSearch();
      },
    );
  }
}
