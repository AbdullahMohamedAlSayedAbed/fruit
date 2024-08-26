import 'package:flutter/material.dart';
import 'package:fruit/core/Utils/app_colors.dart';
import 'package:fruit/core/Utils/app_style.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'تمتلك حساب بالفعل؟',
          style: AppStyle.body16Semibold.copyWith(color: Colors.grey[400]),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'تسجيل دخول',
              style: AppStyle.body16Semibold.copyWith(color: AppColors.lightPrimary),
            ))
      ],
    );
  }
}
