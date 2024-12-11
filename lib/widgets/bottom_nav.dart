import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_decorations.dart';
import 'package:talentaku_app/constants/app_sizes.dart';
import '../controllers/navigation_controller.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();

    return Obx(
      () => Container(
        height: AppSizes.bottomNavHeight,
        margin: const EdgeInsets.only(bottom: 0),
        decoration: AppDecorations.bottomNavDecoration,
        child: CrystalNavigationBar(
          currentIndex: controller.selectedIndex.value,
          height: AppSizes.bottomNavHeight - 13,
          unselectedItemColor: Colors.grey,
          backgroundColor: AppColors.cardBackground,
          onTap: controller.changeIndex,
          items: [
            CrystalNavigationBarItem(
              icon: IconlyBold.home,
              unselectedIcon: IconlyLight.home,
              selectedColor: AppColors.primary,
            ),
            CrystalNavigationBarItem(
              icon: IconlyBold.paper,
              unselectedIcon: IconlyLight.paper,
              selectedColor: AppColors.primary,
            ),
            // CrystalNavigationBarItem(
            //   icon: IconlyBold.category,
            //   unselectedIcon: IconlyLight.category,
            //   selectedColor: AppColors.primary,
            // ),
            CrystalNavigationBarItem(
              icon: IconlyBold.profile,
              unselectedIcon: IconlyLight.profile,
              selectedColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
