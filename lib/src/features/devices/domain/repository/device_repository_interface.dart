import 'package:clone_app_xxx/src/core/domain/failures.dart';
import 'package:clone_app_xxx/src/features/devices/domain/entity/device_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IDeviceRepository {
  Either<Failure, Stream<List<DeviceEntity>>> searchDevices();
}
