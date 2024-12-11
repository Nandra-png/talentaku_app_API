import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/controllers/notification_controller.dart';
import 'package:talentaku_app/widgets/notification_card.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_text_styles.dart';
import 'package:talentaku_app/constants/app_sizes.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Container(
            height: AppSizes.headerHeight,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppSizes.radiusXL),
                bottomRight: Radius.circular(AppSizes.radiusXL),
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: AppColors.textLight,
                            size: AppSizes.iconL,
                          ),
                          onPressed: controller.goBack,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.paddingM,
                            vertical: AppSizes.paddingS,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius:
                                BorderRadius.circular(AppSizes.radiusM),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'images/logo.png',
                                width: AppSizes.logoSize,
                                height: AppSizes.logoSize,
                              ),
                              SizedBox(width: AppSizes.paddingS),
                              Text(
                                'Pengumuman',
                                style: AppTextStyles.heading3.copyWith(
                                  color: AppColors.textLight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Category Tabs
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.paddingL),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
              child: Obx(() => Row(
                    children: List.generate(
                      controller.categories.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(
                          right: index < controller.categories.length - 1
                              ? AppSizes.paddingM
                              : 0,
                        ),
                        child: _buildCategoryTab(
                          controller.categories[index],
                          index,
                          controller,
                        ),
                      ),
                    ),
                  )),
            ),
          ),

          // Notification List
          Expanded(
            child: Obx(() {
              final notifications = controller.getFilteredNotifications();
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return NotificationCard(
                    notification: notifications[index],
                    controller: controller,
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(
    String title,
    int index,
    NotificationController controller,
  ) {
    return GestureDetector(
      onTap: () => controller.changeCategory(index),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.paddingL,
          vertical: AppSizes.paddingS,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: controller.selectedCategory.value == index
                ? AppColors.primaryDark
                : AppColors.textPrimary,
          ),
          borderRadius: BorderRadius.circular(AppSizes.radiusL),
        ),
        child: Text(
          title,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}
