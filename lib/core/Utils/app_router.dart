import 'package:flutter/material.dart';
import 'package:fruit/Features/auth/presentation/views/login_view.dart';
import 'package:fruit/Features/auth/presentation/views/sign_up_view.dart';
import 'package:fruit/Features/home/presentation/views/home_view.dart';
import 'package:fruit/Features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit/Features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const String splash = 'splash';
  static const String onBoarding = 'onBoarding';
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String homeView = 'homeView';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {

    switch (settings.name) {
      case splash:
      return MaterialPageRoute(builder: (context) => const SplashView());
      case onBoarding:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
      case login:
      return MaterialPageRoute(builder: (context) => const LoginView());
      case signUp:
      return MaterialPageRoute(builder: (context) => const SignUpView());
      case homeView:
      return MaterialPageRoute(builder: (context) => const HomeView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}