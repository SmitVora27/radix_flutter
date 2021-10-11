import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_radixweb/ui/home/bloc/home_bloc.dart';
import 'package:flutter_radixweb/ui/home/screen/home_screen.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: HomeScreen());
}
