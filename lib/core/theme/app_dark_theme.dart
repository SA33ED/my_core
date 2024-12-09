import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

ThemeData getAppDarkTheme() {
  return ThemeData.dark(useMaterial3: true).copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xff393939),
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.white),
      scrolledUnderElevation: 0,
      centerTitle: true,
      titleTextStyle: CustomTextStyle.beiruti500sized22,
    ),
    scaffoldBackgroundColor: const Color(0xff393939),
    canvasColor: AppColors.primary,
    colorScheme: const ColorScheme(
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.white,
      brightness: Brightness.dark,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.red,
      surface: AppColors.white,
      onSurface: AppColors.grey,
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: Color(0xff393939)),
    textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: AppColors.white,
          displayColor: AppColors.white,
          fontFamily: "Beiruti",
        ),
    buttonBarTheme: const ButtonBarThemeData(
      alignment: MainAxisAlignment.center,
    ),
    datePickerTheme: const DatePickerThemeData(
      dayForegroundColor: WidgetStatePropertyAll(AppColors.black),
    ),
  );
}
