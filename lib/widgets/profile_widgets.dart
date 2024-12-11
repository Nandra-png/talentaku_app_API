import 'package:flutter/material.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../models/profile_models.dart';

// Enum to define box style options
enum BoxStyle { shadow, border }

class TextPairWidget extends StatelessWidget {
  final TextPair model;
  final BoxStyle boxStyle;
  final IconData? icon;

  const TextPairWidget({
    Key? key,
    required this.model,
    this.boxStyle = BoxStyle.shadow,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration boxDecoration = boxStyle == BoxStyle.shadow
        ? BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppSizes.radiusM),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(2, 4),
              ),
            ],
          )
        : BoxDecoration(
            border: Border.all(
              color: AppColors.primary,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(AppSizes.radiusM),
          );

    return Container(
      decoration: boxDecoration,
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.paddingL),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: AppSizes.iconXL, color: AppColors.primary),
            SizedBox(width: AppSizes.spaceS),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.primaryText,
                  style: model.primaryStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  model.secondaryText,
                  style: model.secondaryStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

