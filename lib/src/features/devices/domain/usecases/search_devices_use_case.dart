import 'package:clone_app_xxx/src/core/domain/failures.dart';
import 'package:clone_app_xxx/src/core/domain/use_case.dart';
import 'package:clone_app_xxx/src/features/devices/domain/entity/device_entity.dart';
import 'package:clone_app_xxx/src/features/devices/domain/repository/device_repository_interface.dart';
import 'package:dartz/dartz.dart';

class SearchDevicesUseCase extends UseCase<void, SearchDevicesParams> {
  SearchDevicesUseCase(this.repository);

  final IDeviceRepository repository;

  @override
  Either<Failure, Stream<List<DeviceEntity>>> call(SearchDevicesParams params) {
    return repository.searchDevices(params.searchPrefix);
  }
}

class SearchDevicesParams {
  SearchDevicesParams({required this.searchPrefix});
  final List<String>? searchPrefix;
}
