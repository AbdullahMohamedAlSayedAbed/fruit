import 'package:flutter/material.dart';
import 'package:fruit/core/Utils/app_style.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("الاكثر مبيعا", style: AppStyle.body16Bold),
        const Spacer(),
        Text(
          'المزيد',
          textAlign: TextAlign.center,
          style:
              AppStyle.body13Regular.copyWith(color: const Color(0xFF949D9E)),
        )
      ],
    );
  }
}
