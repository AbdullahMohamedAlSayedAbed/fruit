import 'package:flutter/material.dart';
import 'package:fruit/core/Utils/app_colors.dart';
import 'package:fruit/core/Utils/app_style.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'ليس لديك حساب؟',
          style:
              AppStyle.body16Semibold.copyWith(color: Colors.grey[400]),
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              'انشاء حساب',
              style: AppStyle.body16Semibold
                  .copyWith(color: AppColors.primary),
            ))
      ],
    );
  }
}
