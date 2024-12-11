import 'package:flutter/material.dart';
import 'package:talentaku_app/models/program_tambahan_event.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_text_styles.dart';
import 'package:talentaku_app/constants/app_sizes.dart';
import 'package:get/get.dart';

class ProgramDetailSheet extends StatelessWidget {
  final ProgramEvent program;

  const ProgramDetailSheet({
    Key? key,
    required this.program,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSizes.bottomSheetHeight,
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header dengan garis dan judul
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8, bottom: 18),
            child: Column(
              children: [
                Container(
                  width: AppSizes.bottomSheetIndicatorWidth,
                  height: AppSizes.bottomSheetIndicatorHeight,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFDEDEDE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceXL),
                Text(
                  program.title,
                  style: AppTextStyles.heading2.copyWith(
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
                child: Column(
                  children: [
                    // Image
                    Container(
                      width: double.infinity,
                      height: AppSizes.bottomSheetImageHeight,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F2F2),
                        borderRadius: BorderRadius.circular(AppSizes.radiusM),
                        image: DecorationImage(
                          image: AssetImage(program.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.spaceXL),

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: AppSizes.paddingXL),
                      child: Text(
                        program.description,
                        textAlign: TextAlign.justify,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: const Color(0xFF797979),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.paddingXL,
              vertical: AppSizes.paddingL,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, -4),
                  blurRadius: 16,
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () => Get.back(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF4F4F4),
                minimumSize:
                    Size(double.infinity, AppSizes.bottomSheetButtonHeight),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                ),
              ),
              child: Text(
                'Kembali',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
