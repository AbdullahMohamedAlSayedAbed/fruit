import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit/constants.dart';
import 'package:fruit/core/Utils/app_colors.dart';
import 'package:fruit/core/Utils/app_router.dart';
import 'package:fruit/core/services/shared_preference_singletone.dart';
import 'package:fruit/core/widgets/custom_buttton.dart';

import 'custom_dots_indicator.dart';
import 'on_boarding_page_view_body.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: OnBoardingPageViewBody(
          controller: pageController,
        )),
        CustomDotsIndicator(
            currentPage: currentPage, pageController: pageController),
        const SizedBox(height: 29),
        Visibility(
          visible: currentPage == 1,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomButton(
              text: 'ابدأ الان',
              onTap: () {
                SharedPreferenceSingleton.setBool(kOnBoardingVisited, true);
                Navigator.of(context).pushReplacementNamed(AppRouter.login);
              },
            ),
          ),
        ),
        const SizedBox(height: 43),
      ],
    );
  }
}
