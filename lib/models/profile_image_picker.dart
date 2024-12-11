// models/profile_image_picker_model.dart
import 'package:flutter/material.dart';

class ProfileImagePickerModel {
  final ImageProvider image;
  final double avatarRadius;
  final double cameraRadius;
  final Color cameraBackgroundColor;
  final Icon cameraIcon;
  final VoidCallback onCameraTap;

  ProfileImagePickerModel({
    required this.image,
    required this.avatarRadius,
    required this.cameraRadius,
    required this.cameraBackgroundColor,
    required this.cameraIcon,
    required this.onCameraTap,
  });
}
