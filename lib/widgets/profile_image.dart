import 'package:flutter/material.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../models/profile_image_picker.dart';

class ProfileImagePicker extends StatelessWidget {
  final ProfileImagePickerModel model;

  ProfileImagePicker({required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Profile image
        CircleAvatar(
          backgroundImage: model.image,
          radius: model.avatarRadius,
          backgroundColor: Colors.grey.shade300,
        ),

        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: model.onCameraTap,
            child: CircleAvatar(
              radius: model.cameraRadius,
              backgroundColor: AppColors.primary,
              child: model.cameraIcon,
            ),
          ),
        ),
      ],
    );
  }

  // Option for selecting from camera or gallery
  static Widget buildOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: AppSizes.radiusXXL,
            backgroundColor: Colors.grey.shade300,
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: AppSizes.paddingS),
          Text(label),
        ],
      ),
    );
  }
}
