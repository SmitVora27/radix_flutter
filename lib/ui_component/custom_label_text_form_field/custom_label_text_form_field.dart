import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_radixweb/constant/index.dart';

class CustomLabelTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onValidator;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final bool obscureText;
  final FormFieldSetter<String>? onSaved;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;
  final String label;
  final bool? enabled;
  final bool isMultiLine;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final int? maxInput;
  final int? maxLength;
  final bool? onlyInt;
  final TextStyle? style;
  final TextInputAction textInputAction;

  CustomLabelTextFormField({
    required this.controller,
    this.hintText,
    this.onSubmitted,
    this.onValidator,
    this.inputAction,
    this.focusNode,
    this.onSaved,
    this.onTap,
    this.keyboardType,
    this.decoration,
    this.maxInput,
    this.onlyInt,
    this.style,
    this.onChanged,
    this.maxLength,
    this.enabled = true,
    this.isMultiLine = false,
    this.textCapitalization = TextCapitalization.none,
    this.readOnly = false,
    this.textInputAction = TextInputAction.done,
    this.label = "",
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetList = [];
    List<TextInputFormatter> _inputFormatters = [];
    if (maxInput != null) {
      _inputFormatters.add(
        LengthLimitingTextInputFormatter(
          maxInput,
        ),
      );
    }
    if (onlyInt != null) {
      if (onlyInt == true) {
        _inputFormatters.add(
          FilteringTextInputFormatter.allow(
            RegExp(
              r'[0-9]',
            ),
          ),
        );
      }
    }
    if (label.isNotEmpty) {
      _widgetList.addAll(
        [
          Text(
            label,
            style: TextStyles.getH5SemiBoldBlackRegular(),
          ),
          SizedBox(
            height: AppFontSize.value10,
          ),
        ],
      );
    }
    _widgetList.add(
      TextFormField(
        cursorColor: AppColors.kButtonBackground,
        enabled: enabled,
        decoration: decoration,
        controller: controller,
        validator: onValidator as String? Function(String?)?,
        keyboardType: keyboardType,
        onFieldSubmitted: onSubmitted,
        textInputAction: inputAction,
        focusNode: focusNode,
        onSaved: onSaved,
        minLines: isMultiLine ? 5 : 1,
        maxLines: isMultiLine ? 5 : 1,
        obscureText: obscureText,
        textCapitalization: textCapitalization,
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        onChanged: onChanged,
        readOnly: readOnly,
        inputFormatters: _inputFormatters,
        style: style,
        textAlignVertical: TextAlignVertical.center,
        maxLength: maxLength,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _widgetList,
    );
  }
}
