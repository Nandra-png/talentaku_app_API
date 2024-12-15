import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:talentaku_app/apimodels/student_models.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_text_styles.dart';
import 'package:talentaku_app/constants/app_sizes.dart';
import 'package:talentaku_app/views/laporan_siswa/detail_laporan_screen.dart';
import 'package:talentaku_app/controllers/home_controller.dart';

class LaporanSiswaCard extends StatelessWidget {
  final StudentReportData laporan;

  const LaporanSiswaCard({
    Key? key,
    required this.laporan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleController = Get.find<HomeController>();

    return GestureDetector(
      onTap: () => Get.to(
        () => DetailLaporanScreen(reportId: laporan.id),
      ),
      child: Container(
        margin: EdgeInsets.only(bottom: AppSizes.paddingL),
        padding: EdgeInsets.all(AppSizes.paddingL),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.radiusL),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 10,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(AppSizes.paddingM),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
              ),
              child: Icon(
                Icons.description_outlined,
                color: AppColors.primary,
                size: AppSizes.iconL,
              ),
            ),
            SizedBox(width: AppSizes.paddingM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleController.title.value,
                    style: AppTextStyles.bodyLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppSizes.paddingXS),
                  Text(
                    _formatContent(),
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textPrimary.withOpacity(0.7),
                      height: 1.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppSizes.paddingXS),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: AppSizes.iconS,
                        color: AppColors.textSecondary,
                      ),
                      SizedBox(width: AppSizes.paddingXS),
                      Text(
                        _formatDate(laporan.created),
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

  String _formatContent() {
    final List<String> contents = [
      if (laporan.kegiatanAwalDihalaman.isNotEmpty) laporan.kegiatanAwalDihalaman.join(", "),
      if (laporan.kegiatanAwalBerdoa.isNotEmpty) laporan.kegiatanAwalBerdoa.join(", "),
      if (laporan.kegiatanIntiSatu.isNotEmpty) laporan.kegiatanIntiSatu.join(", "),
    ];

    return contents.isNotEmpty ? contents.join(" • ") : "No content available";
  }
}