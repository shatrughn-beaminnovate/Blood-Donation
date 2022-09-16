import 'package:flutter/material.dart';

class LoginScreenTextFormField extends StatelessWidget {
  const LoginScreenTextFormField(
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
        cursorColor: const Color(0xFF000000).withOpacity(0.6),
        keyboardType: textInputType,
        onChanged: onChanged,
        validator: validate,
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
          errorStyle: TextStyle(
            fontFamily: "Roboto",
            color: Theme.of(context).errorColor,
            fontSize: 14.0,
          ),
          floatingLabelStyle:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            final Color color = states.contains(MaterialState.error)
                ? Theme.of(context).errorColor
                : const Color(0xFF000000).withOpacity(0.6);
            return TextStyle(color: color, fontFamily: "Roboto",);
          }),
          // floatingLabelStyle: TextStyle(
          //   fontFamily: "Roboto",
          //   color: const Color(0xFF000000).withOpacity(0.6),
          // ),
          // hintStyle: lableTextStyle ??
          //     TextStyle(
          //         fontSize: 16.0,
          //         color: const Color(0xFF000000).withOpacity(0.6)),
          suffixStyle: TextStyle(
            fontFamily: "Roboto",
            color: const Color(0xFF000000).withOpacity(0.6),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 11.0, horizontal: 12),
          // hintText: label,
          labelStyle: lableTextStyle ??
              TextStyle(
                  fontSize: 16.0,
                  color: const Color(0xFF000000).withOpacity(0.6)),
          enabledBorder: inputBorder ??
              OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(0xFF000000).withOpacity(0.38)),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          focusedBorder: inputBorder ??
              OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(0xFF000000).withOpacity(0.38)),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          border: inputBorder ??
              OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const Color(0xFF000000).withOpacity(0.38)),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        ),
      ),
    );
  }
}
