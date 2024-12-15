import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_text_styles.dart';
import 'package:talentaku_app/constants/app_sizes.dart';
import 'package:talentaku_app/constants/app_icons.dart';
import 'package:talentaku_app/controllers/detail_laporan_controller.dart';
import 'package:talentaku_app/widgets/detail_laporan_card.dart';
import 'package:intl/intl.dart';

class DetailLaporanScreen extends StatelessWidget {
  final int reportId;

  const DetailLaporanScreen({
    super.key,
    required this.reportId,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailLaporanController());

    // Fetch report on init
    controller.fetchReport(reportId);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final report = controller.detailReport.value;
          if (report == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48,
                    color: AppColors.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Failed to load report',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
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
                            Text(
                              'Laporan Harian',
                              style: AppTextStyles.heading1.copyWith(
                                color: AppColors.textLight,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.spaceM),
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
                                      report.semester,
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
                                      _formatDate(report.created),
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
                Padding(
                  padding: EdgeInsets.all(AppSizes.paddingXL),
                  child: Obx(() => Column(
                        children: List.generate(
                          controller.sections.length,
                          (index) => DetailLaporanCard(
                            report: report,
                            title: controller.sections[index].title,
                            content: controller.sections[index].content,
                            icon: AppIcons.getLaporanSectionIcon(
                                controller.sections[index].title),
                            isExpanded: controller.sections[index].isExpanded,
                            onTap: () => controller.toggleSection(index),
                          ),
                        ),
                      )),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('dd MMM yyyy').format(date);
    } catch (e) {
      print('Error formatting date: $dateStr');
      return dateStr;
    }
  }
}
