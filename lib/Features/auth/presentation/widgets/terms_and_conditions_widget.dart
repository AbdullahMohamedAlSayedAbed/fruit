import 'package:flutter/material.dart';
import 'package:fruit/core/Utils/app_colors.dart';
import 'package:fruit/core/Utils/app_style.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool valueCheckBox = false;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(14, 0),
      child: Row(
        children: [
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              value: valueCheckBox,
              side: const BorderSide(width: 1.5, color: Color(0xFFDCDEDE)),
              activeColor: const Color(0xFF2D9F5D),
              onChanged: (value) {
                valueCheckBox = value??false;
                setState(() {});  
              },
            ),
          ),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                      style: AppStyle.body13Semibold.copyWith(
                        color: const Color(0xFF949D9E),
                      )),
                  TextSpan(
                      text: 'الشروط والأحكام',
                      style: AppStyle.body13Semibold.copyWith(
                        color: AppColors.lightPrimary,
                      )),
                  TextSpan(
                      text: ' ',
                      style: AppStyle.body13Semibold.copyWith(
                        color: const Color(0xFF616A6B),
                      )),
                  TextSpan(
                      text: 'الخاصة',
                      style: AppStyle.body13Semibold.copyWith(
                        color: AppColors.lightPrimary,
                      )),
                  TextSpan(
                      text: ' ',
                      style: AppStyle.body13Semibold.copyWith(
                        color: const Color(0xFF616A6B),
                      )),
                  TextSpan(
                      text: 'بنا',
                      style: AppStyle.body13Semibold.copyWith(
                        color: AppColors.lightPrimary,
                      )),
                ],
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
