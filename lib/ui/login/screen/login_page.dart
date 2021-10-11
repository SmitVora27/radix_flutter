import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_radixweb/ui/login/bloc/login_bloc.dart';
import 'package:flutter_radixweb/ui/login/screen/login_screen.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: LoginScreen());
}
