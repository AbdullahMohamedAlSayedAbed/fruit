import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit/core/Utils/app_colors.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({
    super.key,
    required this.currentPage,
    required this.pageController,
  });

  final int currentPage;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 2,
      position: currentPage,
      onTap: (position) {
        pageController.animateToPage(
          position,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      decorator: DotsDecorator(
        size: const Size(11, 11),
        activeSize: const Size(11, 11),
        activeColor: AppColors.primary,
        color: AppColors.primary.withOpacity(.5),
      ),
    );
  }
}
