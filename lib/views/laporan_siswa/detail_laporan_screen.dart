import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_text_styles.dart';
import 'package:talentaku_app/constants/app_sizes.dart';
import 'package:talentaku_app/constants/app_icons.dart';
import 'package:talentaku_app/controllers/detail_laporan_controller.dart';
import 'package:talentaku_app/widgets/detail_laporan_card.dart';

class DetailLaporanScreen extends StatelessWidget {
  const DetailLaporanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailLaporanController());
    final Map<String, dynamic> args = Get.arguments as Map<String, dynamic>;
    final String date = args['date'] as String;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: AppSizes.detailHeaderHeight,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(AppSizes.detailHeaderRadius),
                    bottomRight: Radius.circular(AppSizes.detailHeaderRadius),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.paddingXL),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              AppIcons.back,
                              color: AppColors.textLight,
                              size: AppSizes.iconL,
                            ),
                            onPressed: () => Get.back(),
                          ),
                          // SizedBox(width: AppSizes.spaceS),
                          Text(
                            'Laporan Harian',
                            style: AppTextStyles.heading1.copyWith(
                              color: AppColors.textLight,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSizes.spaceM),
                      // Info Tags
                      Padding(
                        padding: EdgeInsets.only(
                            left: AppSizes.paddingXL + AppSizes.iconL),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.paddingM,
                                vertical: AppSizes.paddingXS,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.textLight,
                                borderRadius:
                                    BorderRadius.circular(AppSizes.radiusM),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    AppIcons.semester,
                                    size: AppSizes.iconS,
                                    color: AppColors.primary,
                                  ),
                                  SizedBox(width: AppSizes.paddingXS),
                                  Text(
                                    'Semester 1',
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: AppSizes.spaceS),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.paddingM,
                                vertical: AppSizes.paddingXS,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.textLight,
                                borderRadius:
                                    BorderRadius.circular(AppSizes.radiusM),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    AppIcons.calendar,
                                    size: AppSizes.iconS,
                                    color: AppColors.primary,
                                  ),
                                  SizedBox(width: AppSizes.paddingXS),
                                  Text(
                                    date,
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w600,
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

              // Content
              Padding(
                padding: EdgeInsets.all(AppSizes.paddingXL),
                child: Obx(() => Column(
                      children: List.generate(
                        controller.sections.length,
                        (index) => DetailLaporanCard(
                          title: controller.sections[index].title,
                          content: controller.sections[index].content,
                          icon: AppIcons.getLaporanSectionIcon(
                              controller.sections[index].title),
                          isExpanded: controller.sections[index].isExpanded,
                          status: controller.sections[index].status,
                          onTap: () => controller.toggleExpansion(index),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
