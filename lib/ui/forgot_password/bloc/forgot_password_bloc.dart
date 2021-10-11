import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_radixweb/ui/forgot_password/bloc/forgot_password_event.dart';
import 'package:flutter_radixweb/ui/forgot_password/bloc/forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordStateInitial());

  ForgotPasswordState get initialState => ForgotPasswordStateInitial();

  @override
  Stream<ForgotPasswordState> mapEventToState(
      ForgotPasswordEvent event) async* {
    if (event is ForgotPasswordSendEvent) {
      try {
        yield ForgotPasswordStateLoading();
        await FirebaseAuth.instance.sendPasswordResetEmail(email: event.email).then((value) {
        });
        yield ForgotPasswordStateSuccess();
      } on PlatformException catch (error) {
        if (error.code == 'ERROR_INVALID_EMAIL') {
          yield ForgotPasswordStateFail(error: "Your email id is invalid");
        } else {
          yield ForgotPasswordStateFail(error: "An error occurred, please check your credentials");
        }
      }
      catch (e) {
        yield ForgotPasswordStateFail(error: e.toString());
      }
    }
  }
}
