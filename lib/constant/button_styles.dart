import 'package:flutter/material.dart';

import 'index.dart';

class ButtonStyles {

  static ButtonStyle socialTransparentIcon = ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      EdgeInsets.zero,
    ),
    elevation: MaterialStateProperty.all<double>(AppFontSize.value0),
    overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
  );
}
