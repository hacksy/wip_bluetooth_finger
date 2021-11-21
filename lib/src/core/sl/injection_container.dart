import 'package:clone_app_xxx/src/features/devices/data/local/bluetooth_device_local_data_source.dart';
import 'package:clone_app_xxx/src/features/devices/data/repository/device_repository.dart';
import 'package:clone_app_xxx/src/features/devices/domain/repository/device_repository_interface.dart';
import 'package:clone_app_xxx/src/features/devices/domain/usecases/search_devices_use_case.dart';
import 'package:clone_app_xxx/src/features/devices/presentation/bloc/device/device_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<IDeviceLocalDataSource>(
      () => BluetoothDeviceLocalDataSource());

  sl.registerFactory<IDeviceRepository>(
      () => DeviceRepository(deviceLocalDataSource: sl()));

  sl.registerFactory<SearchDevicesUseCase>(() => SearchDevicesUseCase(sl()));
  sl.registerSingleton<DeviceCubit>(DeviceCubit(sl()));
}
