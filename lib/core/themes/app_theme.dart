import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.white,
      primary: AppColors.red,
      secondary: AppColors.gray,
      background: AppColors.white,
    ),

    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.white,
      centerTitle: true,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.white,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
    ),
  );
}
