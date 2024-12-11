import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Headings
  static const TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 18,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Body Text
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // Caption
  static TextStyle caption = TextStyle(
    fontSize: 12,
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary.withOpacity(0.7),
    height: 1.5,
  );
}
