import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_radixweb/ui/home/bloc/home_event.dart';
import 'package:flutter_radixweb/ui/home/bloc/home_state.dart';
import 'package:flutter_radixweb/ui/home/model/profile_model.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<ProfileModel> userList = [];

  HomeBloc() : super(HomeStateInitial());

  HomeState get initialState => HomeStateInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeGetUserListEvent) {
      yield HomeStateLoading();
      try{
        await FirebaseFirestore.instance.collection('user').get().then((value){
          userList = value.docs.map((userDetail) {
            return ProfileModel.fromJSON(userDetail.data());
          }).toList();
        });
        yield HomeGetUserListSuccess(userDetails: userList);
      } catch(e){
        yield HomeGetUserListFail(error: e.toString());
      }
    }
  }
}