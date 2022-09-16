
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileTextFormField extends StatelessWidget {
  const ProfileTextFormField(
      {Key? key,
      this.height,
      this.width,
      this.validate,
      this.controller,
      required this.textInputType,
      this.autovalidateMode,
      required this.obscureText,
      this.focusNode,
      this.onChanged,
      this.inputFormatters,
      this.lableTextStyle,
      this.error,
      required this.readOnly,
      this.disableColor,
      this.suffixText,
      this.inputBorder,
      this.label})
      : super(key: key);

  final double? height;
  final double? width;
  final String? label;
  final bool obscureText;
  final String? Function(String?)? validate;
  final String Function(String?)? onChanged;
  final String? suffixText;

  final TextStyle? lableTextStyle;
  final FocusNode? focusNode;

  final AutovalidateMode? autovalidateMode;
  final TextEditingController? controller;
  //For Disable textFormField
  final Color? disableColor;
  final InputBorder? inputBorder;
  final bool readOnly;
  final TextInputType textInputType;
  final String? error;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //margin: const EdgeInsets.only(left: 49.0, right: 36.0),
      width: width,
      height: height,
      child: TextFormField(
        controller: controller,
        autovalidateMode: autovalidateMode,
        enabled: readOnly,
        focusNode: focusNode,
        keyboardType: textInputType,
        onChanged: onChanged,
        validator: validate,
        inputFormatters: inputFormatters,
        style: TextStyle(
          fontSize: 16.0,
          color: const Color(0xFF000000).withOpacity(0.6),
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
          suffix: Text(
            suffixText ?? " ",
          ),
          labelText: label,
          isDense: true,
          errorText: error,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 11.0, horizontal: 12),
        ),
      ),
    );
  }
}
