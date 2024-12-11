import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_text_styles.dart';
import 'package:talentaku_app/constants/app_sizes.dart';
import 'package:talentaku_app/models/info_popup_event.dart';

class InfoPopup extends StatelessWidget {
  final InfoPopupEvent popupEvent;

  const InfoPopup({
    Key? key,
    required this.popupEvent,
  }) : super(key: key);

  static void show({
    String title = 'Informasi',
    required String message,
    IconData icon = Icons.info_outline,
    Color? iconColor,
  }) {
    Get.dialog(
      InfoPopup(
        popupEvent: InfoPopupEvent(
          title: title,
          message: message,
          icon: icon,
          iconColor: iconColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.paddingXL),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              popupEvent.icon,
              size: AppSizes.iconL * 2,
              color: popupEvent.iconColor ?? AppColors.primary,
            ),
            SizedBox(height: AppSizes.spaceM),
            Text(
              popupEvent.title,
              style: AppTextStyles.heading3,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSizes.spaceS),
            Text(
              popupEvent.message,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textPrimary.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSizes.spaceL),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: AppSizes.paddingL),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusM),
                  ),
                ),
                child: Text(
                  'Mengerti',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textLight,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 