import 'dart:async';

import 'package:clone_app_xxx/src/core/domain/excepcion.dart';
import 'package:clone_app_xxx/src/features/devices/data/local/bluetooth_device_from_device_extension.dart';
import 'package:clone_app_xxx/src/features/devices/data/models/device_model.dart';
import 'package:clone_app_xxx/src/features/devices/domain/entity/device_entity.dart';
import 'package:flutter_blue/flutter_blue.dart';

abstract class IDeviceLocalDataSource {
  Stream<List<DeviceModel>> searchBluetoothDevice(List<String>? searchPrefix);

  Future<bool> connectToDevice(DeviceModel device);
  Future<bool> disconnectToDevice(DeviceModel device);

  Future<String> readField(DeviceModel device, String field);
}

class BluetoothDeviceLocalDataSource implements IDeviceLocalDataSource {
  @override
  Stream<List<DeviceModel>> searchBluetoothDevice(List<String>? searchPrefix) {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    flutterBlue.startScan(timeout: const Duration(seconds: 4));
    return flutterBlue.scanResults.map((event) {
      return event
          .map((e) => DeviceModel(
                name: e.device.name,
                id: e.device.id.id,
                kind: DeviceKind.ble,
              ))
          .where((device) {
        if (searchPrefix != null && searchPrefix.isNotEmpty) {
          final regex = r'(' +
              searchPrefix.reduce((value, element) => '$value|$element') +
              ')';
          return device.name.contains(RegExp(regex));
        }
        return true;
      }).toList();
    });
  }

  @override
  Future<bool> connectToDevice(DeviceModel device) async {
    final ble = device.toBluetoothDevice();
    await ble
        .connect()
        .onError((error, stackTrace) => throw (UnableToConnectException()));

    return true;
  }

  @override
  Future<bool> disconnectToDevice(DeviceModel device) async {
    final ble = device.toBluetoothDevice();
    ble
        .disconnect()
        .onError((error, stackTrace) => throw (UnableToDisconnectException()));
    return true;
  }

  @override
  Future<String> readField(DeviceModel device, String field) async {
    final ble = device.toBluetoothDevice();
    final services = await ble.discoverServices();
    if (serviceMaps.containsKey(field)) {
      for (BluetoothService service in services) {
        if (service.uuid.toString() == serviceMaps[field]['serviceUUID']) {
          final characteristics = service.characteristics;
          for (BluetoothCharacteristic characteristic in characteristics) {
            if (characteristic.uuid.toString() ==
                serviceMaps[field]['characteristicUUID']) {
              return (await characteristic.read()).toString();
            }
          }
        }
      }
    }
    return '';
  }
}

final Map serviceMaps = {
  'Battery': {
    'serviceUUID': '0000180f-0000-1000-8000-00805f9b34fb',
    'characteristicUUID': '00002a19-0000-1000-8000-00805f9b34fb'
  },
  'Manufacturer': {
    'serviceUUID': '0000180a-0000-1000-8000-00805f9b34fb',
    'characteristicUUID': '00002a29-0000-1000-8000-00805f9b34fb'
  },
  'Name': {
    'serviceUUID': '0000180a-0000-1000-8000-00805f9b34fb',
    'characteristicUUID': '00002a24-0000-1000-8000-00805f9b34fb'
  },
  'SerialNumber': {
    'serviceUUID': '0000180a-0000-1000-8000-00805f9b34fb',
    'characteristicUUID': '00002a29-0000-1000-8000-00805f9b34fb'
  },
  'HWVersionName': {
    'serviceUUID': '0000180a-0000-1000-8000-00805f9b34fb',
    'characteristicUUID': '00002a24-0000-1000-8000-00805f9b34fb'
  },
};
