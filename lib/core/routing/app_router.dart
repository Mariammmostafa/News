import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newss_app/core/routing/routes.dart';
import 'package:newss_app/features/home/home_screen.dart';
import 'package:newss_app/features/splash_screen/splash_screen.dart';

abstract class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    log('generateRoute -- ${settings.name}');
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.layout:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
