import 'package:clone_app_xxx/src/features/devices/domain/entity/device_entity.dart';

class DeviceModel extends DeviceEntity {
  DeviceModel({
    required String id,
    required String name,
    DeviceKind kind = DeviceKind.unknown,
  }) : super(id: id, name: name, kind: kind);

  @override
  String toString() {
    return 'DeviceModel{id:$id,name:$name}';
  }
}
