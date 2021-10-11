import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_radixweb/constant/button_styles.dart';
import 'package:flutter_radixweb/constant/images.dart';
import 'package:flutter_radixweb/constant/index.dart';
import 'package:flutter_radixweb/constant/validators.dart';
import 'package:flutter_radixweb/ui/authenticaiton/bloc/authentication_bloc.dart';
import 'package:flutter_radixweb/ui/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter_radixweb/ui/forgot_password/screen/forgot_password_page.dart';
import 'package:flutter_radixweb/ui/login/bloc/login_bloc.dart';
import 'package:flutter_radixweb/ui/login/bloc/login_event.dart';
import 'package:flutter_radixweb/ui/login/bloc/login_state.dart';
import 'package:flutter_radixweb/ui/register/screen/register_page.dart';
import 'package:flutter_radixweb/ui_component/custom_button/custum_button.dart';
import 'package:flutter_radixweb/ui_component/custom_label_text_form_field/custom_label_text_form_field.dart';
import 'package:flutter_radixweb/ui_component/text_between_line/text_between_line.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  late LoginBloc _loginBloc;
  bool _isObscureText = true;
  String _emailAddress = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  // Method which use for changing text field focus
  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.kWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppFontSize.value18),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state){
              if(state is LoginStateFail){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.error),
                  backgroundColor: AppColors.kRed,
                ));
              }
              if(state is LoginStateSuccess){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BottomNavBar()));
              }
            },
            builder: (context, snapshot) {
              return _renderLoginUI();
            }
          ),
        ),
      ));

  // Login form widget, render the login form
  Widget _renderForm() => Form(
    key: _formKey,
    autovalidateMode: _autoValidateMode,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Email field
        CustomLabelTextFormField(
          controller: _emailController,
          onSaved: (value) => _emailAddress = value!,
          focusNode: _emailFocus,
          keyboardType: TextInputType.emailAddress,
          inputAction: TextInputAction.next,
          onSubmitted: (term) {
            _fieldFocusChange(
              context,
              _emailFocus,
              _passwordFocus,
            );
          },
          onValidator: _validateEmail,
          decoration: TextStyles.getInputDecoration().copyWith(
            hintText: RadixStrings.hint.kEmail,
            labelText: RadixStrings.hint.kEmail,
            fillColor: AppColors.kWhite,
          ),
        ),
        SizedBox(
          height: AppFontSize.value15,
        ),
        // Password field
        CustomLabelTextFormField(
          obscureText: _isObscureText,
          controller: _passwordController,
          onSaved: (value) => _password = value!,
          focusNode: _passwordFocus,
          inputAction: TextInputAction.go,
          onSubmitted: (term) {
            FocusScope.of(context).requestFocus(FocusNode());
            // _onLoginPress();
          },
          onValidator: _validatePassword,
          decoration: TextStyles.getInputDecoration().copyWith(
            hintText: RadixStrings.hint.kPassword,
            labelText: RadixStrings.hint.kPassword,
            suffixIcon: InkWell(
              child: Icon(
                _isObscureText ? Icons.visibility : Icons.visibility_off,
                color: AppColors.kGrey,
              ),
              onTap: () {
                setState(() {
                  _isObscureText = !_isObscureText;
                });
              },
            ),
            fillColor: AppColors.kWhite,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            child: Text(
              RadixStrings.label.kForgotYourPassword,
              style: TextStyles.getH5SemiBoldBlackRegular(),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> ForgotPasswordPage()));
            },
          ),
        ),
        SizedBox(
          height: AppFontSize.value12,
        ),
        // Login button
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if(state is LoginStateLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomAppButton(
              text: RadixStrings.button.kLogin,
              buttonTextStyle: TextStyles.getH3SemiBoldBlackRegular().copyWith(color: AppColors.kWhite),
              backgroundColor: AppColors.kMain,
              onPressed: (){
                _loginButtonPress();
              },
            );
          }
        ),
        SizedBox(
          height: AppFontSize.value12,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            child: Text(
              RadixStrings.label.kSignUp,
              style: TextStyles.getH5SemiBoldBlackRegular(),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> RegisterPage()));
            },
          ),
        ),
      ],
    ),
  );

  Widget _renderBottomButtonsUI() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _renderForm(),
      TextBetweenLine(),
      // Social login buttons widget
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                  AuthenticationGoogleStarted());
            },
            style: ButtonStyles.socialTransparentIcon,
            child: Image.asset(
              Images.kIconGoogle,
            ),
          ),
        ],
      ),
    ],
  );

  // Render the whole screen login form
  Widget _renderLoginUI() => SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(AppFontSize.value8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppFontSize.value30,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: AppFontSize.value30,
              ),
              child: Image.asset(
                Images.kRadixLogo,
                height: AppFontSize.value60,
              ),
            ),
          ),
          Text(
            RadixStrings.label.kWelcome,
            style: TextStyles.getH1BlackRegular(),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: AppFontSize.value10,
              bottom: AppFontSize.value25,
            ),
            child: Text(
              RadixStrings.label.kStaySigned,
              style: TextStyles.getH4BlackRegular(),
            ),
          ),
          _renderBottomButtonsUI(),
        ],
      ),
    ),
  );

  void _loginButtonPress(){
    if(_formKey.currentState?.validate() ?? false){
      _loginBloc.add(LoginButtonPressEvent(email: _emailController.text.trim(), password: _passwordController.text));
    } else{
      setState(() {
        _autoValidateMode = AutovalidateMode.onUserInteraction;
      });
    }
  }

  // Validating password
  String? _validatePassword(String? val) {
    if (val?.trim().isEmpty ?? false) {
      return RadixStrings.message.kEnterPassword;
    } else if (!Validator.isValidPassword(val ?? "")) {
      return RadixStrings.message.kEnterValidPassword;
    } else {
      return null;
    }
  }

  // Validating email
  String? _validateEmail(String? val) {
    if (val?.trim().isEmpty ?? false) {
      return RadixStrings.message.kEnterEmail;
    } else if (!Validator.isValidEmail(val ?? "")) {
      return RadixStrings.message.kEnterValidEmail;
    } else {
      return null;
    }
  }
}
