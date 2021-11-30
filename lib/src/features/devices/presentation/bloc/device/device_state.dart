import 'package:clone_app_xxx/src/features/devices/domain/entity/device_entity.dart';
import 'package:equatable/equatable.dart';

enum DeviceStatus {
  initial,
  selected,
  connected,
  error,
}

class DeviceState extends Equatable {
  DeviceState.initial()
      : status = DeviceStatus.initial,
        connected = false,
        entity = DeviceEntity.none(),
        message = null;

  const DeviceState.selected(this.entity, this.connected)
      : status = DeviceStatus.selected,
        message = null;

  DeviceState.error(this.message)
      : status = DeviceStatus.error,
        connected = false,
        entity = DeviceEntity.none();

  final DeviceStatus status;
  final DeviceEntity entity;
  final String? message;
  final bool connected;
  @override
  String toString() {
    return 'DeviceState{entity:$entity,status:$status,connected:$connected}';
  }

  @override
  List<Object?> get props => [
        status,
        entity,
        connected,
        message,
      ];
}
