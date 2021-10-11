import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterButtonPressEvent extends RegisterEvent {
  final String email;
  final String password;
  final String name;
  RegisterButtonPressEvent({required this.email, required this.name, required this.password});

  @override
  String toString() => 'getting user list';
}
