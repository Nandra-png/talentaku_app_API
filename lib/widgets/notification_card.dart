import 'package:flutter/material.dart';
import 'package:talentaku_app/models/notification_event.dart';
import 'package:talentaku_app/controllers/notification_controller.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_text_styles.dart';
import 'package:talentaku_app/constants/app_sizes.dart';

class NotificationCard extends StatelessWidget {
  final NotificationEvent notification;
  final NotificationController controller;

  const NotificationCard({
    Key? key,
    required this.notification,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.paddingM),
      padding: EdgeInsets.all(AppSizes.paddingL),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.radiusXL),
        border: notification.isUnread
            ? Border.all(color: AppColors.primary)
            : null,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(AppSizes.paddingM),
            decoration: BoxDecoration(
              color: controller
                  .getNotificationIconColor(notification.category)
                  .withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
            ),
            child: Icon(
              controller.getNotificationIcon(
                notification.category,
                notification.title,
              ),
              size: AppSizes.iconL,
              color: controller.getNotificationIconColor(notification.category),
            ),
          ),
          SizedBox(width: AppSizes.paddingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: AppTextStyles.bodyLarge,
                ),
                Text(
                  'Tanggal: ${notification.date}',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textPrimary.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          if (notification.isUnread)
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: AppColors.error,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
