import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_text_styles.dart';
import 'package:talentaku_app/constants/app_sizes.dart';
import 'package:talentaku_app/constants/app_decorations.dart';
import '../controllers/home_controller.dart';
import '../views/notification/notification_screen.dart';

class WelcomeSign extends StatelessWidget {
  const WelcomeSign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Container(
      width: double.infinity,
      height: AppSizes.welcomeSignHeight,
      margin: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
      child: Stack(
        children: [
          // Logo
          Positioned(
            left: AppSizes.paddingXL,
            top: AppSizes.paddingL,
            child: Container(
              width: AppSizes.logoSize,
              height: AppSizes.logoSize,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/logo.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          // Welcome Text
          Positioned(
            left: AppSizes.logoSize + AppSizes.paddingXL * 2,
            top: AppSizes.paddingL,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang,',
                  style: AppTextStyles.bodySmall,
                ),
                Obx(() => Text(
                      controller.userName, // Observasi data username
                      style: AppTextStyles.heading1,
                    )),
              ],
            ),
          ),

          // Notification Button
          Positioned(
            right: 0,
            top: AppSizes.paddingL,
            child: GestureDetector(
              onTap: () => Get.to(() => const NotificationScreen()),
              child: Container(
                width: AppSizes.notificationIconSize,
                height: AppSizes.notificationIconSize,
                decoration: AppDecorations.notificationButtonDecoration,
                child: Icon(
                  Icons.notifications,
                  size: AppSizes.iconL,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
