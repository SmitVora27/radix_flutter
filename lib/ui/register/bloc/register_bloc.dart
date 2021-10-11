import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_radixweb/constant/shared_preference_helper.dart';
import 'package:flutter_radixweb/ui/home/model/profile_model.dart';
import 'package:flutter_radixweb/ui/register/bloc/register_event.dart';
import 'package:flutter_radixweb/ui/register/bloc/register_state.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

  RegisterBloc() : super(RegisterStateInitial());

  RegisterState get initialState => RegisterStateInitial();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterButtonPressEvent) {
      yield RegisterStateLoading();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email, password: event.password).then((value) async{
              await FirebaseFirestore.instance
                  .collection('user')
                  .doc(FirebaseAuth.instance.currentUser?.uid).set(
                {
                  'name' : event.name,
                  'email' : event.email,
                  'uid' : FirebaseAuth.instance.currentUser?.uid,
                }
              ).then((value) async{
                await FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser?.uid).get().then((value) async{
                  ProfileModel profileSave = ProfileModel.fromJSON(value.data());
                  await sharedPreferenceHelper.save("userData", profileSave.toJson());
                });
              });
        });
        yield RegisterStateSuccess();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          yield RegisterStateFail(error: 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          yield RegisterStateFail(error: 'The account already exists for the email.');
        } else {
          yield RegisterStateFail(error: e.toString());
        }
      } catch(e){
        yield RegisterStateFail(error: e.toString());
      }
    }
  }
}