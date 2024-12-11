import 'package:flutter/material.dart';
import 'package:talentaku_app/models/broadcast_event.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/constants/app_text_styles.dart';
import 'package:talentaku_app/constants/app_sizes.dart';
import 'package:talentaku_app/constants/app_decorations.dart';
import 'package:talentaku_app/widgets/info_popup.dart';

class BroadcastCard extends StatelessWidget {
  final Event event;

  const BroadcastCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        InfoPopup.show(
          title: 'Pengumuman',
          message: 'Fitur detail pengumuman sedang dalam tahap pengembangan. Silakan tunggu update selanjutnya.',
          icon: Icons.campaign_outlined,
          iconColor: AppColors.primary,
        );
      },
      child: Container(
        width: double.infinity,
        height: AppSizes.broadcastHeight,
        margin: EdgeInsets.symmetric(vertical: AppSizes.paddingL),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusL),
          ),
          child: Container(
            decoration: AppDecorations.broadcastDecoration,
            child: Padding(
              padding: EdgeInsets.all(AppSizes.paddingL),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          event.name,
                          style: AppTextStyles.heading3,
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
                            color: AppColors.primaryDark.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(AppSizes.radiusXL),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.calendar_today_sharp,
                                color: AppColors.primaryDark,
                                size: AppSizes.iconS,
                              ),
                              SizedBox(width: AppSizes.paddingXS),
                              Text(
                                event.date,
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.primaryDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: AppSizes.iconL * 2,
                    height: AppSizes.iconL * 2,
                    decoration: BoxDecoration(
                      color: AppColors.primaryDark.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSizes.radiusM),
                    ),
                    child: Icon(
                      Icons.campaign_outlined,
                      color: AppColors.primaryDark,
                      size: AppSizes.iconL,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
