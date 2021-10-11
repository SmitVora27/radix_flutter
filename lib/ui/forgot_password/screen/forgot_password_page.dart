import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_radixweb/ui/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:flutter_radixweb/ui/forgot_password/screen/forgot_password_screen.dart';
class ForgotPasswordPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => BlocProvider<ForgotPasswordBloc>(
      create: (context) => ForgotPasswordBloc(),
      child: ForgotPasswordScreen());
}
