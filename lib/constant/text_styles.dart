import 'package:flutter/material.dart';
import 'package:flutter_radixweb/constant/app_font_size.dart';

import 'index.dart';
import 'size_config.dart';

class TextStyles {
  static void initFontSizeCalculation() {
    AppFontSize.init();
    AppFontSize.large = SizeConfig.isTabletDevice ? 48 : 32;
    AppFontSize.h1 = SizeConfig.isTabletDevice ? 38.5 : 22;
  }

  // H1

  static TextStyle getH1BlackRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h1,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH1Black(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h1,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH1SemiBoldBlackRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppinsSemiBold,
      fontSize: AppFontSize.h1,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH1SemiBoldBlack(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppinsSemiBold,
      fontSize: AppFontSize.h1,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH1BlackItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h1,
      color: Colors.black87,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  static TextStyle getH1WhiteRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h1,
      color: Colors.white,
      fontWeight: FontWeight.w500);

  static TextStyle getH1White(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h1,
      color: Colors.white,
      fontWeight: fontWeight);

  static TextStyle getH1WhiteItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h1,
      color: Colors.white,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  //  H2 ------------------

  static TextStyle getH2BlackRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h2,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH2Black(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h2,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH2BlackItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h2,
      color: Colors.black87,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  static TextStyle getH2WhiteRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h2,
      color: Colors.white,
      fontWeight: FontWeight.w500);

  static TextStyle getH2White(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h2,
      color: Colors.white,
      fontWeight: fontWeight);

  static TextStyle getH2WhiteItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h2,
      color: Colors.white,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  // H3

  static TextStyle getH3BlackRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h3,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH3Black(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h3,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH3SemiBoldBlackRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppinsSemiBold,
      fontSize: AppFontSize.h3,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH3SemiBoldBlack(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppinsSemiBold,
      fontSize: AppFontSize.h3,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH3MediumBlackRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppinsMedium,
      fontSize: AppFontSize.h3,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH3MediumBlack(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppinsMedium,
      fontSize: AppFontSize.h3,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH3BlackItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h3,
      color: Colors.black87,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  static TextStyle getH3WhiteRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h3,
      color: Colors.white,
      fontWeight: FontWeight.w500);

  static TextStyle getH3White(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h3,
      color: Colors.white,
      fontWeight: fontWeight);

  static TextStyle getH3WhiteItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h3,
      color: Colors.white,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  // H4

  static TextStyle getH4BlackRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h4,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH4Black(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h4,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH4SemiBoldBlackRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppinsSemiBold,
      fontSize: AppFontSize.h4,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH4SemiBoldBlack(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppinsSemiBold,
      fontSize: AppFontSize.h4,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH4MediumBlackRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppinsMedium,
      fontSize: AppFontSize.h4,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH4MediumBlack(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppinsMedium,
      fontSize: AppFontSize.h4,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH4BlackItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h4,
      color: Colors.black87,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  static TextStyle getH4WhiteRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h4,
      color: Colors.white,
      fontWeight: FontWeight.w500);

  static TextStyle getH4White(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h4,
      color: Colors.white,
      fontWeight: fontWeight);

  static TextStyle getH4WhiteItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h4,
      color: Colors.white,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  // H5

  static TextStyle getH5BlackRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h5,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH5Black(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h5,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH5SemiBoldBlackRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppinsSemiBold,
      fontSize: AppFontSize.h5,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH5SemiBoldBlack(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppinsSemiBold,
      fontSize: AppFontSize.h5,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH5MediumBlackRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppinsMedium,
      fontSize: AppFontSize.h5,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH5MediumBlack(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppinsMedium,
      fontSize: AppFontSize.h5,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH5BlackItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h5,
      color: Colors.black87,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  static TextStyle getH5WhiteRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h5,
      color: Colors.white,
      fontWeight: FontWeight.w500);

  static TextStyle getH5White(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h5,
      color: Colors.white,
      fontWeight: fontWeight);

  static TextStyle getH5WhiteItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h5,
      color: Colors.white,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  // H6

  static TextStyle getH6BlackRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h6,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH6Black(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h6,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH6MediumBlackRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppinsMedium,
      fontSize: AppFontSize.h6,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getH6MediumBlack(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppinsMedium,
      fontSize: AppFontSize.h6,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getH6BlackItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h6,
      color: Colors.black87,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  static TextStyle getH6WhiteRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h6,
      color: Colors.white,
      fontWeight: FontWeight.w500);

  static TextStyle getH6White(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h6,
      color: Colors.white,
      fontWeight: fontWeight);

  static TextStyle getH6WhiteItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.h6,
      color: Colors.white,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  // Large

  static TextStyle getLargeBlackRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.large,
      color: Colors.black87,
      fontWeight: FontWeight.w500);

  static TextStyle getLargeBlack(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.large,
      color: Colors.black87,
      fontWeight: fontWeight);

  static TextStyle getLargeBlackItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.large,
      color: Colors.black87,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  static TextStyle getLargeWhiteRegular() => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.large,
      color: Colors.white,
      fontWeight: FontWeight.w500);

  static TextStyle getLargeWhite(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.large,
      color: Colors.white,
      fontWeight: fontWeight);

  static TextStyle getLargeWhiteItalic(FontWeight fontWeight) => TextStyle(
      fontFamily: RadixStrings.appFont.poppins,
      fontSize: AppFontSize.large,
      color: Colors.white,
      fontWeight: fontWeight,
      fontStyle: FontStyle.italic);

  //  Custom

  static TextStyle getH1(
          Color color, FontWeight fontWeight, FontStyle fontStyle) =>
      TextStyle(
          fontFamily: RadixStrings.appFont.poppins,
          fontSize: AppFontSize.h1,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle);

  static TextStyle getH2(
          Color color, FontWeight fontWeight, FontStyle fontStyle) =>
      TextStyle(
          fontFamily: RadixStrings.appFont.poppins,
          fontSize: AppFontSize.h2,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle);

  static TextStyle getH3(
          Color color, FontWeight fontWeight, FontStyle fontStyle) =>
      TextStyle(
          fontFamily: RadixStrings.appFont.poppins,
          fontSize: AppFontSize.h3,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle);

  static TextStyle getH4(
          Color color, FontWeight fontWeight, FontStyle fontStyle) =>
      TextStyle(
          fontFamily: RadixStrings.appFont.poppins,
          fontSize: AppFontSize.h4,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle);

  static TextStyle getH4Medium(
      Color color, FontWeight fontWeight, FontStyle fontStyle) =>
      TextStyle(
          fontFamily: RadixStrings.appFont.poppinsMedium,
          fontSize: AppFontSize.h4,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle);

  static TextStyle getH5(
          Color color, FontWeight fontWeight, FontStyle fontStyle) =>
      TextStyle(
          fontFamily: RadixStrings.appFont.poppins,
          fontSize: AppFontSize.h5,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle);

  static TextStyle getH6(
          Color color, FontWeight fontWeight, FontStyle fontStyle) =>
      TextStyle(
          fontFamily: RadixStrings.appFont.poppins,
          fontSize: AppFontSize.h6,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle);

  static TextStyle getLargeText(
          Color color, FontWeight fontWeight, FontStyle fontStyle) =>
      TextStyle(
          fontFamily: RadixStrings.appFont.poppins,
          fontSize: AppFontSize.large,
          color: color,
          fontWeight: fontWeight,
          fontStyle: fontStyle);

  static InputDecoration getInputDecoration() => InputDecoration(
      filled: true,
      fillColor: AppColors.kWhite,
      hintText: RadixStrings.hint.kEnterRequiredValue,
      enabledBorder: getOutlineBorder(AppColors.kMainSignInBackGround),
      focusedBorder: getOutlineBorder(AppColors.kButtonBackground),
      errorBorder: getOutlineBorder(AppColors.kRed),
      focusedErrorBorder: getOutlineBorder(AppColors.kRed));

  static OutlineInputBorder getOutlineBorder(Color borderSideColor) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: borderSideColor,
          width: AppFontSize.value1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppFontSize.value10,
          ),
        ),
      );

  //Box Decoration
  static BoxDecoration pinPutDecoration = BoxDecoration(
    color: AppColors.kPinBackground,
    borderRadius: BorderRadius.circular(AppFontSize.value8),
    border:
        Border.all(color: AppColors.kPinBackground, width: AppFontSize.value1),
  );

  //Box Decoration
  static BoxDecoration pinPutEmptyDecoration = BoxDecoration(
    color: AppColors.kWhite,
    borderRadius: BorderRadius.circular(AppFontSize.value8),
    border: Border.all(
        color: AppColors.kButtonBackground, width: AppFontSize.value1),
  );

  //Box Decoration
  static BoxDecoration pinPutSelectedDecoration = BoxDecoration(
    color: AppColors.kWhite,
    boxShadow: [
      BoxShadow(
        color: AppColors.kGrey.withOpacity(0.35),
        offset: Offset(1.0, 1.0), //(x,y)
        blurRadius: AppFontSize.value4,
      ),
    ],
    borderRadius: BorderRadius.circular(AppFontSize.value8),
    border: Border.all(color: AppColors.kWhite, width: AppFontSize.value1),
  );
}
