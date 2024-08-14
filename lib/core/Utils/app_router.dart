import 'package:flutter/material.dart';
import 'package:fruit/Features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit/Features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const String splash = 'splash';
  static const String onBoarding = 'onBoarding';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {

    switch (settings.name) {
      case splash:
      return MaterialPageRoute(builder: (context) => const SplashView());
      case onBoarding:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}