import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_radixweb/constant/shared_preference_helper.dart';
import 'package:flutter_radixweb/ui/authenticaiton/data/repositories/authenticaiton_repository.dart';
import 'package:flutter_radixweb/ui/authenticaiton/models/authentication_detail.dart';
import 'package:flutter_radixweb/ui/home/model/profile_model.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();


  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(AuthenticationInitial());

  StreamSubscription<AuthenticationDetail>? authStreamSub;

  @override
  Future<void> close() {
    authStreamSub?.cancel();
    return super.close();
  }

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStarted) {
      try {
        yield AuthenticationLoading();
        authStreamSub = _authenticationRepository
            .getAuthDetailStream()
            .listen((authDetail) {
          add(AuthenticationStateChanged(authenticationDetail: authDetail));
        });
      } catch (error) {
        print(
            'Error occured while fetching authentication detail : ${error.toString()}');
        yield AuthenticationFailiure(
            message: 'Error occrued while fetching auth detail');
      }
    } else if (event is AuthenticationStateChanged) {
      if (event.authenticationDetail.isValid!) {
        yield AuthenticationSuccess(
            authenticationDetail: event.authenticationDetail);
      } else {
        yield AuthenticationFailiure(message: 'User has logged out');
      }
    } else if (event is AuthenticationGoogleStarted) {
      try {
        yield AuthenticationLoading();
        AuthenticationDetail authenticationDetail =
            await _authenticationRepository.authenticateWithGoogle();

        if (authenticationDetail.isValid!) {
          _storeToFirebase(authenticationDetail);
          yield AuthenticationSuccess(
              authenticationDetail: authenticationDetail);
        } else {
          yield AuthenticationFailiure(message: 'User detail not found.');
        }
      } catch (error) {
        print('Error occured while login with Google ${error.toString()}');
        yield AuthenticationFailiure(
          message: 'Unable to login with Google. Try again.',
        );
      }
    } else if (event is AuthenticationExited) {
      try {
        yield AuthenticationLoading();
        await _authenticationRepository.unAuthenticate();
      } catch (error) {
        print('Error occured while logging out. : ${error.toString()}');
        yield AuthenticationFailiure(
            message: 'Unable to logout. Please try again.');
      }
    }
  }

  void _storeToFirebase(AuthenticationDetail details) async {
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set(details.toMap())
          .then((value) async{
        await FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser?.uid).get().then((value) async{
          ProfileModel profileSave = ProfileModel.fromJSON(value.data());
          await sharedPreferenceHelper.save("userData", profileSave.toJson());
        });
      });
    } catch (e) {
      print(e);
    }
  }
}
