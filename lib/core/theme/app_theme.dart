import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

ThemeData getAppTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.black),
      scrolledUnderElevation: 0,
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Colors.white,
    canvasColor: AppColors.primary,
    fontFamily: "Beiruti",
    colorScheme: const ColorScheme(
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.white,
      brightness: Brightness.light,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.red,
      surface: AppColors.white,
      onSurface: AppColors.black,
    ),
    textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: AppColors.black,
          displayColor: AppColors.black,
          fontFamily: "Beiruti",
        ),
    datePickerTheme: const DatePickerThemeData(
      dayForegroundColor: WidgetStatePropertyAll(AppColors.black),
    ),
  );
}
