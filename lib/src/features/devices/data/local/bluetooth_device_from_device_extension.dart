import 'package:clone_app_xxx/src/features/devices/data/models/device_model.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:flutter_blue/gen/flutterblue.pb.dart' as proto;

extension BluetoothDeviceFromDeviceModel on DeviceModel {
  BluetoothDevice toBluetoothDevice() {
    proto.BluetoothDevice p = proto.BluetoothDevice.create();

    p.name = name;
    p.type = proto.BluetoothDevice_Type.LE;
    p.remoteId = id;

    return BluetoothDevice.fromProto(p);
  }
}
