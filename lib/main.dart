import 'package:flutter/material.dart';
import 'package:newss_app/core/api/endpoints.dart';
import 'package:newss_app/core/routing/app_router.dart';
import 'package:newss_app/core/api/web_service.dart';
import 'package:newss_app/core/theme/app_theme.dart';
import 'package:newss_app/features/category_news/data/data_source/category_news_remote_data_source.dart';
import 'core/routing/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var webService = WebService.initialize();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
