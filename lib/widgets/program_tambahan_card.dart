import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/apimodels/program_model.dart';

import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_text_styles.dart';
import 'package:talentaku_app/constants/app_sizes.dart';
import 'package:talentaku_app/constants/app_decorations.dart';
import 'program_detail_sheet.dart';

class ProgramCard extends StatelessWidget {
  final Program program; // Ganti ProgramEvent menjadi Program

  const ProgramCard({
    Key? key,
    required this.program,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          ProgramDetailSheet(program: program), // Kirim program ke detail sheet
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
        );
      },
      child: Container(
        width: AppSizes.cardWidth,
        height: AppSizes.programCardHeight,
        margin: EdgeInsets.only(right: AppSizes.paddingL),
        decoration: AppDecorations.cardDecoration,
        child: Row(
          children: [
            // Ganti programEvent.image dengan program.photo
            Container(
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.radiusXL),
                  bottomLeft: Radius.circular(AppSizes.radiusXL),
                ),
                child: program.photo != null
                    ? Image.network(
                        program.photo!, // Jika ada photo, tampilkan dari URL
                        fit: BoxFit.cover,
                        height: double.infinity,
                      )
                    : Container(color: Colors.grey), // Placeholder jika tidak ada photo
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(AppSizes.paddingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Tampilkan program.name
                    Text(
                      program.name,
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: AppSizes.spaceS),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.paddingM,
                        vertical: AppSizes.paddingXS,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(AppSizes.radiusXL),
                      ),
                      child: Text(
                        'Lihat Detail',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
