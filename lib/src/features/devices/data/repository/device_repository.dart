import 'package:clone_app_xxx/src/core/domain/failures.dart';
import 'package:clone_app_xxx/src/features/devices/data/local/bluetooth_device_local_data_source.dart';
import 'package:clone_app_xxx/src/features/devices/domain/entity/device_entity.dart';
import 'package:clone_app_xxx/src/features/devices/domain/repository/device_repository_interface.dart';
import 'package:dartz/dartz.dart';

class DeviceRepository extends IDeviceRepository {
  DeviceRepository({required this.deviceLocalDataSource});
  final IDeviceLocalDataSource deviceLocalDataSource;
  @override
  Either<Failure, Stream<List<DeviceEntity>>> searchDevices(
      List<String>? searchPrefix) {
    try {
      final stream = deviceLocalDataSource.searchBluetoothDevice(searchPrefix);
      return Right(stream);
    } on Exception {
      return Left(GeneralFailure());
    }
  }
}
