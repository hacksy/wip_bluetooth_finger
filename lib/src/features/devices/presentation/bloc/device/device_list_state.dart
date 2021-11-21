import 'package:clone_app_xxx/src/features/devices/domain/entity/device_entity.dart';
import 'package:equatable/equatable.dart';

enum DeviceListStatus {
  empty,
  searching,
  loaded,
  error,
}

class DeviceListState extends Equatable {
  const DeviceListState.empty()
      : status = DeviceListStatus.empty,
        entity = const <DeviceEntity>[],
        message = null;

  const DeviceListState.searching()
      : status = DeviceListStatus.searching,
        entity = const <DeviceEntity>[],
        message = null;

  const DeviceListState.loaded(this.entity)
      : status = DeviceListStatus.loaded,
        message = null;

  const DeviceListState.error(this.message)
      : status = DeviceListStatus.error,
        entity = const <DeviceEntity>[];

  final DeviceListStatus status;
  final List<DeviceEntity> entity;
  final String? message;

  @override
  String toString() {
    return 'DeviceListState{entity:$entity,status:$status}';
  }

  @override
  List<Object?> get props => [
        status,
        entity,
        message,
      ];
}
