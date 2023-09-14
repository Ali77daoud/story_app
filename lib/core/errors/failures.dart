import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class WrongDataFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class InfoAlreadyExistsFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class OfflineFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UnExpectedFailure extends Failure {
  @override
  List<Object?> get props => [];
}
