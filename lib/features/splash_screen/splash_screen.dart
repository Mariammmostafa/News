import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newss_app/features/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = "Splash_Screen";

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Image.asset(
        "assets/image/splash.jpg",
        width: mediaQuery.width,
        height: mediaQuery.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
