import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {}

class GeneralFailure extends Failure {}

class UnableToConnectFailure extends Failure {}

class UnableToFetchFailure extends Failure {}
