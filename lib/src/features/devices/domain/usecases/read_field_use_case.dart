import 'package:clone_app_xxx/src/core/domain/failures.dart';
import 'package:clone_app_xxx/src/core/domain/use_case.dart';
import 'package:clone_app_xxx/src/features/devices/domain/entity/device_entity.dart';
import 'package:clone_app_xxx/src/features/devices/domain/repository/device_repository_interface.dart';
import 'package:dartz/dartz.dart';

class ReadFieldUseCase extends FutureUseCase<String, ReadFieldParams> {
  ReadFieldUseCase(this.repository);

  final IDeviceRepository repository;

  @override
  Future<Either<Failure, String>> call(ReadFieldParams params) {
    return repository.readField(params.device, params.field);
  }
}

class ReadFieldParams {
  ReadFieldParams({required this.device, required this.field});
  final DeviceEntity device;
  final String field;
}
