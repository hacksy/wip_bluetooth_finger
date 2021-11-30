import 'dart:math';

import 'package:clone_app_xxx/src/core/sl/injection_container.dart';
import 'package:clone_app_xxx/src/features/devices/domain/entity/device_entity.dart';
import 'package:clone_app_xxx/src/features/devices/presentation/bloc/device/device_cubit.dart';
import 'package:flutter/material.dart';

class BluetoothConnectionWidget extends StatelessWidget {
  const BluetoothConnectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Search for Devices'),
      onPressed: () {
        sl<DeviceCubit>().startSearch(['Daydream']);
      },
    );
  }
}

Future<DeviceEntity?> searchForDevices(BuildContext context,
    [Duration timeout = const Duration(seconds: 4)]) async {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Connect to Device'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: const [
                  ColoredCircularProgressIndicator(),
                  SizedBox(
                    width: 12,
                  ),
                  Text('Searching'),
                ],
              )
            ],
          ),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel')),
          ],
        );
      });
  return null;
}

class ColoredCircularProgressIndicator extends StatelessWidget {
  const ColoredCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: CustomColor(),
    );
  }
}

class CustomColor extends Animation<Color> {
  @override
  void addListener(VoidCallback listener) {}

  @override
  void addStatusListener(AnimationStatusListener listener) {}

  @override
  void removeListener(VoidCallback listener) {}

  @override
  void removeStatusListener(AnimationStatusListener listener) {}

  @override
  AnimationStatus get status => AnimationStatus.completed;

  @override
  Color get value {
    return [Colors.green, Colors.red, Colors.yellow][Random().nextInt(3)];
  }
}
