import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newss_app/core/constants/assets.gen.dart';
import 'package:newss_app/core/extensions/context_extension.dart';
import 'package:newss_app/core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = "Splash_Screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      context.goToNamedReplace(Routes.layout);
    });
  }

  @override
  Widget build(BuildContext context) {
    log(context.isDark.toString());
    return Scaffold(
      body: Center(
        child: Image.asset(
          context.isDark
              ? Assets.icons.splashLogoDark.path
              : Assets.icons.splashLogoLight.path,
          height: context.height / 4,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
