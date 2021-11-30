import 'package:clone_app_xxx/src/core/domain/failures.dart';
import 'package:clone_app_xxx/src/core/domain/use_case.dart';
import 'package:clone_app_xxx/src/features/devices/domain/entity/device_entity.dart';
import 'package:clone_app_xxx/src/features/devices/domain/repository/device_repository_interface.dart';
import 'package:dartz/dartz.dart';

class ConnectToDeviceUseCase extends FutureUseCase<void, DeviceParams> {
  ConnectToDeviceUseCase(this.repository);

  final IDeviceRepository repository;

  @override
  Future<Either<Failure, bool>> call(DeviceParams params) {
    return repository.connectToDevice(params.device);
  }
}

class DeviceParams {
  DeviceParams({required this.device});
  final DeviceEntity device;
}
