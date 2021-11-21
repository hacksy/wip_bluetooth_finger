import 'package:clone_app_xxx/src/core/domain/use_case.dart';
import 'package:clone_app_xxx/src/features/devices/domain/usecases/search_devices_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'device_list_state.dart';

class DeviceCubit extends Cubit<DeviceListState> {
  final SearchDevicesUseCase _searchDevicesUseCase;

  DeviceCubit(SearchDevicesUseCase searchDevicesUseCase)
      : _searchDevicesUseCase = searchDevicesUseCase,
        super(const DeviceListState.empty());

  void endSearch() {
    emit(const DeviceListState.empty());
  }

  void startSearch([List<String> searchPrefix = const <String>[]]) async {
    emit(const DeviceListState.searching());
    final result = _searchDevicesUseCase
        .call(SearchDevicesParams(searchPrefix: searchPrefix));
    result.fold(
        (failure) =>
            emit(const DeviceListState.error('Error while loading devices')),
        (deviceListStream) => {
              deviceListStream.forEach((deviceList) {
                emit(DeviceListState.loaded(deviceList));
              })
            });
  }
}
