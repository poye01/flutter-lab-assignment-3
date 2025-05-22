import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      background: AppColors.background,
      error: AppColors.error,
      onPrimary: AppColors.onPrimary,
    ),
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      iconTheme: const IconThemeData(color: Colors.black87),
      titleTextStyle: AppTextTheme.light.titleLarge,
      elevation: 0,
    ),
    textTheme: AppTextTheme.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(        backgroundColor: AppColors.secondary,
        foregroundColor: Colors.white,
        textStyle: AppTextTheme.light.labelLarge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.black87),
  );
}
