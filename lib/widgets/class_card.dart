import 'package:flutter/material.dart';
import 'package:talentaku_app/models/class_event.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_text_styles.dart';
import 'package:talentaku_app/constants/app_sizes.dart';
import 'package:talentaku_app/constants/app_decorations.dart';
import 'package:talentaku_app/widgets/info_popup.dart';

class ClassCard extends StatelessWidget {
  final ClassEvent classEvent;

  const ClassCard({
    Key? key,
    required this.classEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        InfoPopup.show(
          title: 'Fitur Dalam Pengembangan',
          message: 'Mohon maaf, fitur kelas belum tersedia saat ini. Silakan coba lagi nanti.',
          icon: Icons.construction,
          iconColor: AppColors.primaryDark,
        );
      },
      child: Container(
        width: double.infinity,
        height: AppSizes.classCardHeight,
        margin: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: AppSizes.classCardHeight,
              decoration: AppDecorations.classCardDecoration,
            ),
            Padding(
              padding: EdgeInsets.only(left: AppSizes.paddingXL, top: AppSizes.paddingXL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    classEvent.groupName,
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: AppSizes.paddingXS),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_sharp,
                        size: AppSizes.iconS,
                        color: AppColors.primaryDark,
                      ),
                      SizedBox(width: AppSizes.paddingXS),
                      Text(
                        classEvent.ageRange,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.primaryDark,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: AppSizes.paddingXL,
                top: AppSizes.paddingXL * 3.6,
              ),
              child: Row(
                children: List.generate(
                  4,
                  (index) => Container(
                    width: AppSizes.avatarIconSize,
                    height: AppSizes.avatarIconSize,
                    margin: EdgeInsets.only(left: AppSizes.paddingXS),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: Icon(
                      Icons.person,
                      size: AppSizes.iconM,
                      color: AppColors.cardBackground,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: AppSizes.paddingL,
              top: AppSizes.paddingL,
              child: Container(
                width: AppSizes.classImageSize,
                height: AppSizes.classImageSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(classEvent.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
