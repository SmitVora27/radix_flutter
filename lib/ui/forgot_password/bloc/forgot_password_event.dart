import 'package:equatable/equatable.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordSendEvent extends ForgotPasswordEvent {
  final String email;
  ForgotPasswordSendEvent({required this.email});

  @override
  String toString() => 'getting user list';
}
