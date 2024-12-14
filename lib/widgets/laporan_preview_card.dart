import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:talentaku_app/apimodels/student_models.dart';
import 'package:talentaku_app/controllers/home_controller.dart';
import 'package:talentaku_app/models/laporan_preview_event.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_text_styles.dart';
import 'package:talentaku_app/constants/app_sizes.dart';
import 'package:talentaku_app/constants/app_decorations.dart';

class LaporanPreviewCard extends StatelessWidget {
  final Datum laporan;

  const LaporanPreviewCard({
    Key? key,
    required this.laporan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return GestureDetector(
      onTap: () {
        Get.snackbar(
          'Sukses',
          'Laporan berhasil dibuka',
          backgroundColor: AppColors.success,
          colorText: AppColors.textLight,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(AppSizes.paddingXL),
        );
      },
      child: Container(
        width: AppSizes.cardWidth,
        margin: const EdgeInsets.only(right: AppSizes.paddingL),
        decoration: AppDecorations.cardDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSizes.paddingL),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(AppSizes.radiusXL),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSizes.paddingM),
                    decoration: AppDecorations.iconContainerDecoration,
                    child: Icon(
                      Icons.description_outlined,
                      color: AppColors.primary,
                      size: AppSizes.iconL,
                    ),
                  ),
                  const SizedBox(width: AppSizes.paddingM),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.title.value,
                          style: AppTextStyles.bodyLarge,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: AppSizes.paddingXS),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today_sharp,
                              color: AppColors.textSecondary,
                              size: AppSizes.iconS,
                            ),
                            const SizedBox(width: AppSizes.paddingXS),
                            Text(
                              DateFormat('dd MMM yyyy').format(laporan.created),
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.paddingL),
              child: Text(
                laporan.snack.join(", "),
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textPrimary,
                  height: AppSizes.textSmall,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

