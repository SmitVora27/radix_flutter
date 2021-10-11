import 'package:equatable/equatable.dart';
import 'package:flutter_radixweb/ui/home/model/profile_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeGetJobListEmptySuccess extends HomeState {}

class HomeGetUserListSuccess extends HomeState {
  final List<ProfileModel>? userDetails;
  HomeGetUserListSuccess({this.userDetails});

  @override
  String toString() => 'Home User list';
}

class RedirectToProfile extends HomeState {}

class HomeGetUserListFail extends HomeState {
  final String error;

  const HomeGetUserListFail({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'HomeFailure { error: $error }';
}
