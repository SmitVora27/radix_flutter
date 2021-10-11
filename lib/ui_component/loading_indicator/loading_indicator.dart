import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_radixweb/constant/app_font_size.dart';
import 'package:flutter_radixweb/constant/index.dart';

class LoadingIndicator extends StatelessWidget {
  final Color backgroundColor;
  final Color valueColor;

  LoadingIndicator({
    this.backgroundColor = AppColors.kButtonBackground,
    this.valueColor = AppColors.kMain,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Material(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 3.0,
          child: Container(
            height: AppFontSize.value100,
            width: AppFontSize.value100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(
                AppFontSize.value10,
              ),
            ),
            child: CircularProgressIndicator(),
          ),
        ),
      );
}