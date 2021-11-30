import 'package:clone_app_xxx/src/features/devices/data/local/bluetooth_device_local_data_source.dart';
import 'package:clone_app_xxx/src/features/devices/data/repository/device_repository.dart';
import 'package:clone_app_xxx/src/features/devices/domain/repository/device_repository_interface.dart';
import 'package:clone_app_xxx/src/features/devices/domain/usecases/connect_to_device_use_case.dart';
import 'package:clone_app_xxx/src/features/devices/domain/usecases/disconnect_to_device_use_case.dart';
import 'package:clone_app_xxx/src/features/devices/domain/usecases/read_field_use_case.dart';
import 'package:clone_app_xxx/src/features/devices/domain/usecases/search_devices_use_case.dart';
import 'package:clone_app_xxx/src/features/devices/presentation/bloc/device/connect_device_cubit.dart';
import 'package:clone_app_xxx/src/features/devices/presentation/bloc/device/data_read_cubit.dart';
import 'package:clone_app_xxx/src/features/devices/presentation/bloc/device/device_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory<IDeviceLocalDataSource>(
      () => BluetoothDeviceLocalDataSource());

  sl.registerFactory<IDeviceRepository>(
      () => DeviceRepository(deviceLocalDataSource: sl()));

  sl.registerFactory<ConnectToDeviceUseCase>(
      () => ConnectToDeviceUseCase(sl()));
  sl.registerFactory<DisconnectToDeviceUseCase>(
      () => DisconnectToDeviceUseCase(sl()));
  sl.registerFactory<SearchDevicesUseCase>(() => SearchDevicesUseCase(sl()));
  sl.registerFactory<ReadFieldUseCase>(() => ReadFieldUseCase(sl()));

  sl.registerSingleton<ConnectToDeviceCubit>(ConnectToDeviceCubit(sl(), sl()));
  sl.registerSingleton<DataReadCubit>(DataReadCubit(
    sl(),
  ));

  sl.registerSingleton<DeviceCubit>(DeviceCubit(sl()));
}
