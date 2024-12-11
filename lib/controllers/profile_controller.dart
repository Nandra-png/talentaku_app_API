import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/controllers/home_controller.dart';
import '../models/profile_models.dart';

class ProfileController extends GetxController {
  late HomeController homeController;
  
  @override
  void onInit() {
    super.onInit();
    homeController = Get.find<HomeController>();
  }

  TextPair getTextPair(String primaryText) {
    String secondaryText;
    IconData? icon;

    switch (primaryText) {
      case 'Nama Lengkap':
        secondaryText = homeController.userName;
        break;
      case 'NIS':
        secondaryText = '123456';
        break;
      case 'Tempat, Tanggal Lahir':
        secondaryText = 'Jakarta, 1 Januari 2020';
        break;
      case 'Alamat':
        secondaryText = 'Jl. Raya No. 1';
        break;
      case 'Kelompok':
        secondaryText = 'Pelangi';
        icon = Icons.group;
        break;
      default:
        secondaryText = '';
    }

    return TextPair(
      primaryText: primaryText,
      secondaryText: secondaryText,
      primaryStyle: TextStyle(
        fontSize: 12,
        color: AppColors.textPrimary,
      ),
      secondaryStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: AppColors.textDark,
      ),
      alignment: CrossAxisAlignment.start,
      icon: icon,
    );
  }
}

