import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_radixweb/ui/register/bloc/register_bloc.dart';
import 'package:flutter_radixweb/ui/register/screen/register_screen.dart';

class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(),
      child: RegisterScreen());
}
