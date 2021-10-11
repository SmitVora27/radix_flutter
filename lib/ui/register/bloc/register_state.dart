import 'package:equatable/equatable.dart';
abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterStateInitial extends RegisterState {}

class RegisterStateLoading extends RegisterState {}

class RegisterStateSuccess extends RegisterState {}

class RegisterStateFail extends RegisterState {
  final String error;

  const RegisterStateFail({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'HomeFailure { error: $error }';
}
