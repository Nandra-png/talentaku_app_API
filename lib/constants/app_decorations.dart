import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_sizes.dart';

class AppDecorations {
  static BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.cardBackground,
    borderRadius: BorderRadius.circular(AppSizes.radiusXL),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        spreadRadius: 1,
        blurRadius: 10,
        offset: const Offset(0, 1),
      ),
    ],
  );

  static BoxDecoration iconContainerDecoration = BoxDecoration(
    color: AppColors.primary.withOpacity(0.1),
    borderRadius: BorderRadius.circular(AppSizes.radiusM),
  );

  static BoxDecoration broadcastDecoration = BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [AppColors.primaryLight, Color(0xFFD5DDFF)],
    ),
    borderRadius: BorderRadius.circular(AppSizes.radiusL),
  );

  static BoxDecoration classCardDecoration = BoxDecoration(
    color: AppColors.primaryLight,
    borderRadius: BorderRadius.circular(AppSizes.radiusL),
    boxShadow: [
      BoxShadow(
        color: const Color(0x14000000),
        blurRadius: 10,
        offset: const Offset(0, 1),
      ),
    ],
  );

  static BoxDecoration notificationButtonDecoration = BoxDecoration(
    color: const Color(0xFFF4F4F4),
    borderRadius: BorderRadius.circular(AppSizes.radiusL),
  );

  static BoxDecoration categoryLineDecoration = BoxDecoration(
    color: AppColors.primary,
    borderRadius: BorderRadius.circular(AppSizes.radiusS),
  );

  static BoxDecoration bottomNavDecoration = BoxDecoration(
    color: AppColors.cardBackground,
    borderRadius: BorderRadius.circular(AppSizes.radiusXL),
  );
} 