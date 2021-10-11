import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_radixweb/constant/images.dart';
import 'package:flutter_radixweb/constant/index.dart';
import 'package:flutter_radixweb/constant/validators.dart';
import 'package:flutter_radixweb/ui/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter_radixweb/ui/register/bloc/register_bloc.dart';
import 'package:flutter_radixweb/ui/register/bloc/register_event.dart';
import 'package:flutter_radixweb/ui/register/bloc/register_state.dart';
import 'package:flutter_radixweb/ui_component/custom_button/custum_button.dart';
import 'package:flutter_radixweb/ui_component/custom_label_text_form_field/custom_label_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final FocusNode _fullNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  bool _isObscureText = true;
  bool _isObscureConfirmPasswordText = true;

  String _fullName = '';
  String _emailAddress = '';
  String _password = '';
  String _confirmPassword = '';
  late RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
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
          child: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state){
              if(state is RegisterStateFail){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.error),
                  backgroundColor: AppColors.kRed,
                ));
              }
              if(state is RegisterStateSuccess){
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
        CustomLabelTextFormField(
          controller: _fullNameController,
          onSaved: (value) => _fullName = value!,
          focusNode: _fullNameFocus,
          keyboardType: TextInputType.name,
          inputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.words,
          onSubmitted: (term) {
            _fieldFocusChange(
              context,
              _fullNameFocus,
              _emailFocus,
            );
          },
          onValidator: _validateFullName,
          decoration: TextStyles.getInputDecoration().copyWith(
            hintText: RadixStrings.hint.kYourName,
            labelText: RadixStrings.hint.kYourName,
            fillColor: AppColors.kWhite,
          ),
        ),
        SizedBox(
          height: AppFontSize.value15,
        ),
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
          inputAction: TextInputAction.next,
          onSubmitted: (term) {
            _fieldFocusChange(
              context,
              _passwordFocus,
              _confirmPasswordFocus
            );
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
        SizedBox(
          height: AppFontSize.value15,
        ),
        // Confirm Password field
        CustomLabelTextFormField(
          obscureText: _isObscureConfirmPasswordText,
          controller: _confirmPasswordController,
          onSaved: (value) => _confirmPassword = value!,
          focusNode: _confirmPasswordFocus,
          inputAction: TextInputAction.go,
          onSubmitted: (term) {
            FocusScope.of(context).requestFocus(FocusNode());
            _onRegisterPress();
          },
          onValidator: _validateConfirmPassword,
          decoration: TextStyles.getInputDecoration().copyWith(
            hintText: RadixStrings.hint.kConfirmPassword,
            labelText: RadixStrings.hint.kConfirmPassword,
            suffixIcon: InkWell(
              child: Icon(
                _isObscureConfirmPasswordText
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: AppColors.kGrey,
              ),
              onTap: () {
                setState(() {
                  _isObscureConfirmPasswordText =
                  !_isObscureConfirmPasswordText;
                });
              },
            ),
            fillColor: AppColors.kWhite,
          ),
        ),
        SizedBox(
          height: AppFontSize.value15,
        ),
        // Login button
        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if(state is RegisterStateLoading){
              return Center(
                child: CircularProgressIndicator(
                ),
              );
            }
            return CustomAppButton(
              text: RadixStrings.button.kRegister,
              buttonTextStyle: TextStyles.getH3SemiBoldBlackRegular().copyWith(color: AppColors.kWhite),
              backgroundColor: AppColors.kMain,
              onPressed: (){
                _onRegisterPress();
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
              RadixStrings.label.kLogin,
              style: TextStyles.getH5SemiBoldBlackRegular(),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    ),
  );

  void _onRegisterPress(){
    if(_formKey.currentState?.validate() ?? false){
      _registerBloc.add(RegisterButtonPressEvent(
          name: _fullNameController.text,
          email: _emailController.text.trim(),
          password: _passwordController.text
      ));
    } else{
      setState(() {
        _autoValidateMode = AutovalidateMode.onUserInteraction;
      });
    }
  }

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
            RadixStrings.label.kRegister,
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
          _renderForm(),
        ],
      ),
    ),
  );

  // Validating confirm password
  String? _validateConfirmPassword(String? val) {
    if (val?.trim().isEmpty ?? false) {
      return RadixStrings.message.kEnterConfirmPassword;
    } else if (_password != _confirmPassword) {
      return RadixStrings.message.kEnterPasswordMatch;
    } else if (!Validator.isValidPassword(val ?? "")) {
      return RadixStrings.message.kEnterValidPassword;
    } else {
      return null;
    }
  }

  // Validating Your Name
  String? _validateFullName(String? val) {
    if (val?.trim().isEmpty ?? false) {
      return RadixStrings.message.kEnterYourName;
    } else {
      return null;
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
