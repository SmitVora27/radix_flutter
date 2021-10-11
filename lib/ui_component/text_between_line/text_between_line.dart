import 'package:flutter/material.dart';
import 'package:flutter_radixweb/constant/index.dart';

class TextBetweenLine extends StatelessWidget {
  final String? text;

  TextBetweenLine({
    this.text,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(
          top: AppFontSize.value25,
          bottom: AppFontSize.value20,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Divider(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppFontSize.value20,
              ),
              child: Text(
                text ?? RadixStrings.label.kOr,
                style: TextStyles.getH6MediumBlackRegular(),
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
      );
}
