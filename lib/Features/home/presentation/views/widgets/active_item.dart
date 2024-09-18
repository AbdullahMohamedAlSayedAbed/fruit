import 'package:flutter/material.dart';
import 'package:fruit/core/Utils/app_colors.dart';
import 'package:fruit/core/Utils/app_style.dart';
import 'package:svg_flutter/svg.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.assetName, required this.text});
  final String assetName;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: const Color(0xffeeeeee),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(child: SvgPicture.asset(assetName)),
            ),
            const SizedBox(width: 4),
            Text(text,
                style: AppStyle.body11Bold.copyWith(color: AppColors.primary)),
          ],
        ),
      ),
    );
  }
}
