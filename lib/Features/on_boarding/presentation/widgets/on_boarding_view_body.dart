import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit/constants.dart';
import 'package:fruit/core/Utils/app_colors.dart';
import 'package:fruit/core/widgets/custom_buttton.dart';

import 'on_boarding_page_view_body.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: OnBoardingPageViewBody()),
        DotsIndicator(
          dotsCount: 2,
          position: 1,
          decorator: DotsDecorator(
            activeColor: AppColors.primary,
            color: AppColors.primary.withOpacity(.5),
          ),
        ),
        const SizedBox(height: 29),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: CustomButton(
            text: 'ابدأ الان',
            onTap: () {},
          ),
        ),
        const SizedBox(height: 43),
      ],
    );
  }
}
