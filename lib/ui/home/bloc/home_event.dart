import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeGetUserListEvent extends HomeEvent {

  @override
  String toString() => 'getting user list';
}
