import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor kAppPrimarySwatch =
      const MaterialColor(0xFF6F6FC9, const <int, Color>{
    50: const Color(0xFF6F6FC9),
    100: const Color(0xFF6F6FC9),
    200: const Color(0xFF6F6FC9),
    300: const Color(0xFF6F6FC9),
    400: const Color(0xFF6F6FC9),
    500: const Color(0xFF6F6FC9),
    600: const Color(0xFF6F6FC9),
    700: const Color(0xFF6F6FC9),
    800: const Color(0xFF6F6FC9),
    900: const Color(0xFF6F6FC9),
  });

  static const Color kMain = Color(0xFF6F6FC9);
  static const Color kMainSwatch = Color.fromRGBO(210, 75, 75, 1.0);
  static const Color kBrown900 = Color(0xFF3E2723);
  static const Color kInputTextBackground = Color(0xFFF2F2F2);
  static const Color kCircleAvatarBackground = Color(0xFFF2F4FF);
  static const Color kDashBackground = Color(0xFFFBFBFB);
  static const Color kButtonBackground = Color(0xFFB9BFFF);
  static const Color kChipBackground = Color(0xFFF5F6FF);
  static const Color kPinBackground = Color(0xFFE0E2FF);
  static const Color kIntroductionBoxBackground = Color(0xFFEBEDFF);
  static const Color kBlue = Color(0xFF28ACEA);
  static const Color kOrange = Color(0xFFF78E54);
  static const Color kGrey = Color(0xFF858585);
  static const Color kBorderGrey = Color(0xFFCDCDCD);
  static const Color kDarkGrey = Color(0xFF333333);
  static const Color kGreen = Color(0xFF119DA4);
  static const Color kRed = Color(0xFFF23E3E);
  static const Color kPurple = Color(0xFF303567);
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color kBoxBorder = Color(0xFFEDEEFC);
  static const Color kCircleBackground = Color(0xFFF3F4FF);
  static const Color kPostButtonBackground = Color(0xFFEEEEFE);
  static const Color kMainSignInBackGround = Color(0xFFDADCEF);
  static const Color kOutlineBorder = Color(0xFF8287C2);
  static const Color kSignInOpacity = Color.fromRGBO(199, 199, 251, 0.5);
  static const Color kSignInSecondaryOpacity =
      Color.fromRGBO(156, 156, 245, 0.23);
  static const Color kBlack = Colors.black87;
  static _SFLStringColor stringColor = _SFLStringColor();
}

class _SFLStringColor {
  final String kMain = '#6F6FC9';
  final String kBlack = '#000000';
}
