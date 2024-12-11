import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/models/program_tambahan_event.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_text_styles.dart';
import 'package:talentaku_app/constants/app_sizes.dart';
import 'package:talentaku_app/constants/app_decorations.dart';
import 'program_detail_sheet.dart';

class ProgramCard extends StatelessWidget {
  final ProgramEvent programEvent;

  const ProgramCard({
    Key? key,
    required this.programEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          ProgramDetailSheet(program: programEvent),
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
            Container(
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.radiusXL),
                  bottomLeft: Radius.circular(AppSizes.radiusXL),
                ),
                child: Image.asset(
                  programEvent.image,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(AppSizes.paddingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      programEvent.title,
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
