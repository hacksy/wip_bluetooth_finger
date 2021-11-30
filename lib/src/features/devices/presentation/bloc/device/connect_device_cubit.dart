import 'package:clone_app_xxx/src/features/devices/domain/entity/device_entity.dart';
import 'package:clone_app_xxx/src/features/devices/domain/usecases/connect_to_device_use_case.dart';
import 'package:clone_app_xxx/src/features/devices/domain/usecases/disconnect_to_device_use_case.dart';
import 'package:clone_app_xxx/src/features/devices/presentation/bloc/device/device_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectToDeviceCubit extends Cubit<DeviceState> {
  ConnectToDeviceCubit(ConnectToDeviceUseCase connectToDeviceUseCase,
      DisconnectToDeviceUseCase disconnectToDeviceUseCase)
      : _connectToDeviceUseCase = connectToDeviceUseCase,
        _disconnectToDeviceUseCase = disconnectToDeviceUseCase,
        super(DeviceState.initial());
  final ConnectToDeviceUseCase _connectToDeviceUseCase;
  final DisconnectToDeviceUseCase _disconnectToDeviceUseCase;

  void selectDevice(DeviceEntity item) {
    emit(DeviceState.selected(item, false));
  }

  void connectToDevice() async {
    final result =
        await _connectToDeviceUseCase.call(DeviceParams(device: state.entity));

    result.fold((l) => emit(DeviceState.error("Error ")),
        (r) => emit(DeviceState.selected(state.entity, true)));
  }

  void disconnectToDevice() async {
    final result = await _disconnectToDeviceUseCase
        .call(DeviceParams(device: state.entity));
    result.fold((l) => emit(DeviceState.error("Error ")),
        (r) => emit(DeviceState.selected(state.entity, false)));
  }
}
