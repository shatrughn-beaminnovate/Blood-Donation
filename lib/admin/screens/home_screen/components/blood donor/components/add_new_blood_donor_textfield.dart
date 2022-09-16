import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNewDonorTextFormField extends StatelessWidget {
  const AddNewDonorTextFormField(
      {Key? key,
      this.hintText,
      this.controller,
      this.textInputType,
      this.onTap,
      this.validator,
      this.readOnly,
      this.inputFormatters})
      : super(key: key);

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      validator: validator,
      controller: controller,
      readOnly: readOnly ?? false,
      inputFormatters: inputFormatters,
      onTap: onTap,
      style: Theme.of(context).textTheme.headline2,
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
        labelStyle: Theme.of(context).textTheme.headline2,
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xFF000000).withOpacity(0.38)),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xFF000000).withOpacity(0.38)),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        border: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color(0xFF000000).withOpacity(0.38)),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      ),
    );
  }
}
