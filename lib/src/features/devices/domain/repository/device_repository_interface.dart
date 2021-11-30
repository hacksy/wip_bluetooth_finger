import 'package:clone_app_xxx/src/core/domain/failures.dart';
import 'package:clone_app_xxx/src/features/devices/domain/entity/device_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IDeviceRepository {
  Either<Failure, Stream<List<DeviceEntity>>> searchDevices(
      List<String>? searchPrefix);

  Future<Either<Failure, bool>> connectToDevice(DeviceEntity device);
  Future<Either<Failure, bool>> disconnectToDevice(DeviceEntity device);

  Future<Either<Failure, String>> readField(DeviceEntity device, String field);
}
