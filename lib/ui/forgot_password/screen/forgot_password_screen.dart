import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_radixweb/constant/images.dart';
import 'package:flutter_radixweb/constant/index.dart';
import 'package:flutter_radixweb/constant/validators.dart';
import 'package:flutter_radixweb/ui/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:flutter_radixweb/ui/forgot_password/bloc/forgot_password_event.dart';
import 'package:flutter_radixweb/ui/forgot_password/bloc/forgot_password_state.dart';
import 'package:flutter_radixweb/ui_component/custom_button/custum_button.dart';
import 'package:flutter_radixweb/ui_component/custom_label_text_form_field/custom_label_text_form_field.dart';
import 'package:flutter_radixweb/ui_component/loading_indicator/loading_indicator.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  late ForgotPasswordBloc _forgotPasswordBloc;
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  String _emailAddress = '';

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _forgotPasswordBloc = BlocProvider.of<ForgotPasswordBloc>(context);
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

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.kWhite,
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: AppFontSize.value16),
      child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, state){
          if (state is ForgotPasswordStateSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully sent link to your registered mail"),backgroundColor: AppColors.kMain,));

          } else if (state is ForgotPasswordStateFail) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error),backgroundColor: AppColors.kRed,));
          }
        },
        builder: (context, state) => InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () => FocusScope.of(context).unfocus(),
          child: buildSafeArea(context, state),
        ),
      )
    ),
  );

  Widget buildSafeArea(BuildContext context, state) {
    if (state is ForgotPasswordStateLoading) {
      return LoadingIndicator();
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppFontSize.value20,),
            IconButton(
              padding: EdgeInsets.zero,
                onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back)),
          SizedBox(height: AppFontSize.value60,),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: AppFontSize.value25,
                ),
                child: Image.asset(
                  Images.kRadixLogo,
                  height: AppFontSize.value60,
                ),
              ),
            ),
          SizedBox(height: AppFontSize.value30,),
          Text(
            RadixStrings.message.kForgotPassword,
            style: TextStyles.getH1BlackRegular().copyWith(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: AppFontSize.value10,
              bottom: AppFontSize.value25,
            ),
            child: Text(
            RadixStrings.message.kConfirmEmail,
              style: TextStyles.getH4BlackRegular(),
            ),
          ),
          _renderForgotForm(),
        ],
      ),
    );
  }

  // Forgot password form widget, render the forgot password form
  Widget _renderForgotForm() => Form(
    key: _formKey,
    autovalidateMode: _autoValidate,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // Email field
        CustomLabelTextFormField(
          controller: _emailController,
          onSaved: (value) => _emailAddress = value!,
          inputAction: TextInputAction.done,
          maxInput: 254,
          keyboardType: TextInputType.emailAddress,
          onSubmitted: (term) {
            FocusScope.of(context).requestFocus(FocusNode());
            _onSendPress();
          },
          onValidator: _validateEmail,
          decoration: TextStyles.getInputDecoration().copyWith(
            hintText: RadixStrings.hint.kEmail,
            labelText: RadixStrings.hint.kEmail,
            fillColor: AppColors.kWhite,
          ),
        ),
        SizedBox(
          height: AppFontSize.value50,
        ),
        // Send button
        CustomAppButton(
          text: RadixStrings.button.kSend,
          buttonTextStyle: TextStyles.getH3SemiBoldBlackRegular().copyWith(color: AppColors.kWhite),
          backgroundColor: AppColors.kMain,
          onPressed: _onSendPress,
        ),
      ],
    ),
  );

  void _onSendPress(){
    _formKey.currentState?.save();

    var cacheCurrentFormState = _formKey.currentState;

    if (cacheCurrentFormState != null) {
      if (cacheCurrentFormState.validate()) {
        FocusScope.of(context).requestFocus(FocusNode());
        // Forgot passowrd API call to send email
        _forgotPasswordBloc.add(
          ForgotPasswordSendEvent(
            email: _emailAddress,
          ),
        );
      } else {
        setState(() {
          _autoValidate = AutovalidateMode.always;
        });
      }
    } else {

    }
  }
}
