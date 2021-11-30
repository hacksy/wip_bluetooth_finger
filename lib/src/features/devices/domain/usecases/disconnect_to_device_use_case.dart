import 'package:clone_app_xxx/src/core/domain/failures.dart';
import 'package:clone_app_xxx/src/core/domain/use_case.dart';
import 'package:clone_app_xxx/src/features/devices/domain/repository/device_repository_interface.dart';
import 'package:clone_app_xxx/src/features/devices/domain/usecases/connect_to_device_use_case.dart';
import 'package:dartz/dartz.dart';

class DisconnectToDeviceUseCase extends FutureUseCase<bool, DeviceParams> {
  DisconnectToDeviceUseCase(this.repository);

  final IDeviceRepository repository;

  @override
  Future<Either<Failure, bool>> call(DeviceParams params) {
    return repository.disconnectToDevice(params.device);
  }
}
