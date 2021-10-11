import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_radixweb/ui/authenticaiton/bloc/authentication_bloc.dart';
import 'package:flutter_radixweb/ui/authenticaiton/data/providers/authentication_firebase_provider.dart';
import 'package:flutter_radixweb/ui/authenticaiton/data/repositories/authenticaiton_repository.dart';
import 'package:flutter_radixweb/ui/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter_radixweb/ui/login/screen/login_page.dart';
import 'package:flutter_radixweb/ui/login/screen/login_screen.dart';
import 'package:flutter_radixweb/ui_component/loading_indicator/loading_indicator.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'constant/index.dart';
import 'ui/authenticaiton/data/providers/google_sign_in_provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(
        authenticationRepository: AuthenticationRepository(
          authenticationFirebaseProvider: AuthenticationFirebaseProvider(
            firebaseAuth: FirebaseAuth.instance,
          ),
          googleSignInProvider: GoogleSignInProvider(
            googleSignIn: GoogleSignIn(),
          ),
        ),
      ),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: AppColors.kAppPrimarySwatch,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RadixStart(),
      ),
    );
  }
}


class RadixStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        builder:(context, state) {
          if (state is AuthenticationInitial) {
            BlocProvider.of<AuthenticationBloc>(context)
                .add(AuthenticationStarted());
            return LoadingIndicator();
          } else if (state is AuthenticationLoading) {
            return LoadingIndicator();
          } else if (state is AuthenticationSuccess) {
            return BottomNavBar();
          } else if(state is AuthenticationFailiure){
            return LoginPage();
          }
          return Container();
        },
        listener: (context, state) {
          // if (state is AuthenticationFailiure) {
          //   Navigator.pushReplacement(context,
          //       MaterialPageRoute(builder: (_) => LoginScreen()));
          // }
        }),
  );
}

class RadixStartPoint extends StatefulWidget {
  @override
  _RadixStartPointState createState() => _RadixStartPointState();
}

class _RadixStartPointState extends State<RadixStartPoint> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: BlocConsumer(
        builder:(context, state) {
          if (state is AuthenticationInitial) {
            BlocProvider.of<AuthenticationBloc>(context)
                .add(AuthenticationStarted());
            return CircularProgressIndicator();
          } else if (state is AuthenticationLoading) {
            return CircularProgressIndicator();
          } else if (state is AuthenticationSuccess) {
            return Text('Welcome :${state.authenticationDetail.uid}');
          } else if(state is AuthenticationFailiure){
            return LoginScreen();
          }
          return Container();
        },
        listener: (context, state) {
          if (state is AuthenticationFailiure) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => LoginScreen()));
          }
        }),
  );

}

