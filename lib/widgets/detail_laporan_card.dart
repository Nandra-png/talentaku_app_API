import 'package:flutter/material.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_text_styles.dart';
import 'package:talentaku_app/constants/app_sizes.dart';

import '../apimodels/student_models.dart';

class DetailLaporanCard extends StatelessWidget {
  final Datum detailReport;
  // final String title;
  // final String content;
  final IconData icon;
  final bool isExpanded;
  final VoidCallback onTap;

  const DetailLaporanCard({
    Key? key,
    // required this.title,
    // required this.content,
    required this.icon,
    required this.isExpanded,
    required this.onTap,
    required this.detailReport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.paddingL),
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
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.all(AppSizes.paddingL),
          childrenPadding: EdgeInsets.only(
            left: AppSizes.paddingL,
            right: AppSizes.paddingL,
            bottom: AppSizes.paddingL,
          ),
          title: Row(
            children: [
              Container(
                width: AppSizes.detailIconSize,
                height: AppSizes.detailIconSize,
                padding: EdgeInsets.all(AppSizes.paddingS),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                ),
                child: Icon(
                  icon,
                  color: AppColors.primary,
                  size: AppSizes.iconM,
                ),
              ),
              SizedBox(width: AppSizes.paddingM),
              Expanded(
                child: Text(
                  detailReport.kegiatanAwalBerdoa as String,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          children: [
            Text(
              detailReport.kegiatanAwalBerdoa as String,
              style: AppTextStyles.bodyMedium.copyWith(
                height: 1.5,
              ),
            ),
          ],
          onExpansionChanged: (_) => onTap(),
          initiallyExpanded: isExpanded,
        ),
      ),
    );
  }
}
