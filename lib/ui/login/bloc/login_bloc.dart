import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_radixweb/constant/shared_preference_helper.dart';
import 'package:flutter_radixweb/ui/home/model/profile_model.dart';
import 'package:flutter_radixweb/ui/login/bloc/login_event.dart';
import 'package:flutter_radixweb/ui/login/bloc/login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {

  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

  LoginBloc() : super(LoginStateInitial());

  LoginState get initialState => LoginStateInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressEvent) {
      yield LoginStateLoading();
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: event.email, password: event.password).then((value) async{
          await FirebaseFirestore.instance.collection('user').doc(value.user?.uid).get().then((value) async{
            ProfileModel profileSave = ProfileModel.fromJSON(value.data());
            await sharedPreferenceHelper.save("userData", profileSave.toJson());
          });
        });
        yield LoginStateSuccess();
      } catch(e){
        yield LoginStateFail(error: e.toString());
      }
    }
  }
}