import 'package:equatable/equatable.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordStateInitial extends ForgotPasswordState {}

class ForgotPasswordStateLoading extends ForgotPasswordState {}

class ForgotPasswordStateSuccess extends ForgotPasswordState {

  @override
  String toString() => 'Home User list';
}

class ForgotPasswordStateFail extends ForgotPasswordState {
  final String error;

  ForgotPasswordStateFail({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'HomeFailure { error: $error }';
}
