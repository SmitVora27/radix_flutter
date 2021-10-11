import 'package:equatable/equatable.dart';
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginStateInitial extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {}

class LoginStateFail extends LoginState {
  final String error;

  const LoginStateFail({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginStateFailure { error: $error }';
}
