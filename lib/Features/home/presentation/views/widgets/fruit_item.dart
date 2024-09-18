import 'package:flutter/material.dart';
import 'package:fruit/core/Utils/app_colors.dart';
import 'package:fruit/core/Utils/app_style.dart';
import 'package:fruit/core/Utils/assets.dart';
import 'package:svg_flutter/svg.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border_outlined)),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 20),
                SvgPicture.asset(Assets.imagesWatermelonImage),
                const SizedBox(height: 24),
                ListTile(
                  title: Text(
                    'بطيخ',
                    style: AppStyle.body13Semibold
                        .copyWith(color: const Color(0xFF949D9E)),
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '20جنية ',
                          style: AppStyle.body16Bold
                              .copyWith(color: AppColors.secondary),
                        ),
                        TextSpan(
                          text: '/',
                          style: AppStyle.body13Bold
                              .copyWith(color: AppColors.secondary),
                        ),
                        TextSpan(
                          text: ' الكيلو',
                          style: AppStyle.body13Semibold
                              .copyWith(color: AppColors.lightSecondary),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  trailing: const CircleAvatar(
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
