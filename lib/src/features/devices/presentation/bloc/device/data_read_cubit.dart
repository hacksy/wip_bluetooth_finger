import 'package:clone_app_xxx/src/features/devices/domain/entity/device_entity.dart';
import 'package:clone_app_xxx/src/features/devices/domain/usecases/read_field_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataReadCubit extends Cubit<DataReadState> {
  final ReadFieldUseCase _readFieldUseCase;

  DataReadCubit(ReadFieldUseCase readFieldUseCase)
      : _readFieldUseCase = readFieldUseCase,
        super(const DataReadState(
            status: DataReadStatus.initial, fieldName: '', fieldValue: ''));

  void readField(DeviceEntity device, String fieldName) async {
    final result = await _readFieldUseCase
        .call(ReadFieldParams(device: device, field: fieldName));
    result.fold(
        (l) => emit(DataReadState(
              fieldName: fieldName,
              fieldValue: '',
              status: DataReadStatus.error,
            )),
        (r) => emit(DataReadState(
              fieldName: fieldName,
              fieldValue: r,
              status: DataReadStatus.success,
            )));
  }
}

class DataReadState extends Equatable {
  const DataReadState(
      {required this.fieldName,
      required this.fieldValue,
      required this.status});
  final String fieldName;
  final DataReadStatus status;
  final String fieldValue;
  @override
  List<Object> get props => [status, fieldName, fieldValue];
}

enum DataReadStatus {
  initial,
  loading,
  error,
  success,
}
