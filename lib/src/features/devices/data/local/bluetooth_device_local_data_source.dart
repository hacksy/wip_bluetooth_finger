import 'dart:async';

import 'package:clone_app_xxx/src/features/devices/data/models/device_model.dart';
import 'package:clone_app_xxx/src/features/devices/domain/entity/device_entity.dart';
import 'package:flutter_blue/flutter_blue.dart';

abstract class IDeviceLocalDataSource {
  Stream<List<DeviceModel>> searchBluetoothDevice();
}

class BluetoothDeviceLocalDataSource implements IDeviceLocalDataSource {
  @override
  Stream<List<DeviceModel>> searchBluetoothDevice() {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    flutterBlue.startScan(timeout: const Duration(seconds: 4));
    return flutterBlue.scanResults.map((event) {
      return event
          .map((e) => DeviceModel(
                name: e.device.name,
                id: e.device.id.id,
                kind: DeviceKind.ble,
              ))
          .toList();
    });
  }
}
