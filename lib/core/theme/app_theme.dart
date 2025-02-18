import 'package:flutter/material.dart';
import 'package:newss_app/core/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    useMaterial3: true,
    brightness: Brightness.light,
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.white,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: AppColors.black,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: AppColors.black,
      ),
      bodyMedium: TextStyle(
        color: AppColors.white,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    useMaterial3: true,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.white,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.black,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: AppColors.black,
      ),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        color: AppColors.white,
      ),
      bodyMedium: TextStyle(
        color: AppColors.black,
      ),
    ),
  );
}
