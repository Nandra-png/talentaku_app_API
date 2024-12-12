import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/apimodels/user_model.dart';
import 'package:talentaku_app/apiservice/api_service.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/controllers/home_controller.dart';
import '../models/profile_models.dart';


class ProfileController extends GetxController {
  var user = Rxn<UserModel>(); // Observable user model

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  void fetchUserData() async {
    try {
      final fetchedUser = await ApiService.fetchUserProfile();
      user.value = fetchedUser;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load profile data');
    }
  }

  TextPair getTextPair(String primaryText) {
    if (user.value == null) {
      return TextPair(
        primaryText: primaryText,
        secondaryText: 'Loading...',
        primaryStyle: TextStyle(fontSize: 12, color: AppColors.textPrimary),
        secondaryStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.textDark),
        alignment: CrossAxisAlignment.start,
      );
    }

    final userData = user.value!;
    String secondaryText;

    switch (primaryText) {
      case 'Nama Lengkap':
        secondaryText = userData.fullname;
        break;
      case 'NIS':
        secondaryText = userData.nomorInduk;
        break;
      case 'Tempat, Tanggal Lahir':
        secondaryText = userData.birthInformation;
        break;
      case 'Alamat':
        secondaryText = userData.address;
        break;
      case 'Kelompok':
        secondaryText = userData.grades;
        break;
      default:
        secondaryText = '';
    }

    return TextPair(
      primaryText: primaryText,
      secondaryText: secondaryText,
      primaryStyle: TextStyle(fontSize: 12, color: AppColors.textPrimary),
      secondaryStyle:
          TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: AppColors.textDark),
      alignment: CrossAxisAlignment.start,
    );
  }
}
