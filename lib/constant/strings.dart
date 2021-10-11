class RadixStrings {
  static _AppFont appFont = _AppFont();
  static _ScreenTitle screenTitle = _ScreenTitle();
  static _HintString hint = _HintString();
  static _LabelString label = _LabelString();
  static _ButtonTitleString button = _ButtonTitleString();
  static _MessageString message = _MessageString();
}

class _AppFont {
  final String poppins = 'Poppins';
  final String poppinsMedium = 'PoppinsMedium';
  final String poppinsSemiBold = 'PoppinsSemiBold';
}

class DateFormats {
  static const String kFullDateTime = "yyyy-MM-dd'T'HH:mm:ss.SSSZ";
  static const String kFormattedFullDateTime = "yyyy-MM-dd hh:mm aa";
}

class _ScreenTitle {
  final String kAppName = "Radix";
  final String kMyProfile = "My Profile";
}

class _HintString {
  final String kEnterRequiredValue = "Enter required value";
  final String kPassword = "Password";
  final String kEmail = "Email Address";
  final String kYourName = "Your Name";
  final String kConfirmPassword = "Confirm Password";
}

class _LabelString {
  final String kForgotYourPassword = "Forgot password?";
  final String kSignUp = "Don't have an Account? Register";
  final String kLogin = "Already have an Account? Login";
  final String kOr = "OR";
  final String kEmail = "Email Address";
  final String kWelcome = "Welcome back!";
  final String kRegister = "Register";
  final String kStaySigned = "Stay signed in with your account to organize change more effectively.";
}

class _ButtonTitleString {
  final String kLogin = "Log in";
  final String kRegister = "Register";
  final String kSend = "Send";
}

class _MessageString {
  final String kEnterEmail = "Please enter an email";
  final String kEnterValidEmail = "Please enter a valid email";
  final String kEnterPassword = "Please enter password";
  final String kForgotPassword = "Forgot password?";
  final String kNoUser = "No users";
  final String kConfirmEmail =
      "Confirm your email and we'll send the instructions for reset password";
  final String kBackToLogin = "Back to Login";
  final String kEnterConfirmPassword = "Please enter confirm password";
  final String kEnterPasswordMatch =
      "Password and confirm password must be same";
  final String kEnterYourName = "Please enter your name";
  final String kEnterValidPassword =
      "6-15 characters, Password must include one upper, one lower, one digit character as well as one symbol";
}