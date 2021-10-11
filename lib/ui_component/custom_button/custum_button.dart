import 'package:flutter/material.dart';
import 'package:flutter_radixweb/constant/index.dart';

class CustomAppButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color backgroundColor;
  final double buttonWidth;
  final double buttonHeight;
  final TextStyle? buttonTextStyle;
  final Widget? textWithIcon;
  final LinearGradient? backgroundGradient;
  final double? buttonRadius;

  CustomAppButton({
    required this.onPressed,
    this.text,
    this.backgroundColor = AppColors.kButtonBackground,
    this.textColor,
    this.buttonTextStyle,
    this.textWithIcon,
    this.backgroundGradient,
    this.buttonRadius,
    this.buttonWidth = double.infinity,
    this.buttonHeight = 60.0,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: backgroundColor,
          gradient: backgroundGradient,
          borderRadius: BorderRadius.circular(
            buttonRadius ?? AppFontSize.value12,
          ),
        ),
        child: ElevatedButton(
          child: text!=null && text!.isNotEmpty
              ? Text(
                  text!,
                  style: buttonTextStyle ??
                      TextStyle(
                        color: textColor,
                        fontSize: AppFontSize.h4,
                      ),
                )
              : textWithIcon,
          style: ElevatedButton.styleFrom(
            onSurface: Colors.transparent,
            primary: Colors.transparent,
            onPrimary: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: onPressed,
        ),
      );
}
