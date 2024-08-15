import 'package:flutter/material.dart';
import 'package:fruit/core/Utils/app_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.hintText, this.keyboardType, this.suffixIcon});
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
            filled: true,
            fillColor: const Color(0xFFF9FAFA),
            hintText: hintText,
            hintStyle: AppStyle.body13Bold.copyWith(
              color: const Color(0xFF949D9E),
            )));
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          width: 1,
          color: Color(0xFFE6E9E9),
        ));
  }
}
