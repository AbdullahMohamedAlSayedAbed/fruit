import 'package:flutter/material.dart';
import 'package:fruit/Features/splash/presentation/views/splash_view.dart';

class AppRouter {
  static const String splash = 'splash';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {

    switch (settings.name) {
      case splash:
      return MaterialPageRoute(builder: (context) => const SplashView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}