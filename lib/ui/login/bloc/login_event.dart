import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressEvent extends LoginEvent {
  final String email;
  final String password;
  LoginButtonPressEvent({required this.email, required this.password});

  @override
  String toString() => 'getting user list';
}
