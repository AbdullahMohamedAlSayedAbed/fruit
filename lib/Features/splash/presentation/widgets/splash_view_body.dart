import 'package:flutter/material.dart';
import 'package:fruit/constants.dart';
import 'package:fruit/core/Utils/app_router.dart';
import 'package:fruit/core/Utils/assets.dart';
import 'package:fruit/core/services/shared_preference_singletone.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  Future<Null> executeNavigation() {
   bool onBoardingVisited = SharedPreferenceSingleton.getBool(kOnBoardingVisited);
    return Future.delayed(const Duration(seconds: 3), () {
      if (onBoardingVisited) {
        Navigator.pushReplacementNamed(context, AppRouter.login);
      } else {
        Navigator.pushReplacementNamed(context, AppRouter.onBoarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.imagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.imagesLogosvg),
        SvgPicture.asset(
          Assets.imagesSplashButton,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
