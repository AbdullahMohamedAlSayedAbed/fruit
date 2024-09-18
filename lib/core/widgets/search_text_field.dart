import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit/core/Utils/app_style.dart';
import 'package:fruit/core/Utils/assets.dart';
import 'package:svg_flutter/svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, required this.hintText, this.suffixIcon});

  final String hintText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0x0A000000),
          blurRadius: 9,
          offset: Offset(0, 2),
          spreadRadius: 0,
        ),
      ]),
      child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              suffixIcon: suffixIcon,
              prefixIcon: SizedBox(
                  width: 20,
                  child:
                      Center(child: SvgPicture.asset(Assets.imagesSearchicon))),
              border: buildBorder(),
              enabledBorder: buildBorder(),
              focusedBorder: buildBorder(),
              filled: true,
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: AppStyle.body13Regular.copyWith(
                color: const Color(0xFF949D9E),
              ))),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(
          width: 1,
          color: Colors.white,
        ));
  }
}
