import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_sizes.dart';
import '../../constants/app_colors.dart';
import '../../controllers/profile_controller.dart';
import '../../controllers/login_controller.dart';
import '../../widgets/custom_text_pair.dart';
import '../../widgets/login_button.dart';
import '../../widgets/profile_image.dart';
import '../../widgets/profile_widgets.dart';
import '../../widgets/welcome_sign.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    final loginController = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: AppSizes.spaceXL),
            const WelcomeSign(),
            const SizedBox(height: AppSizes.spaceL),

            // ProfileImagePicker
            Obx(() => ProfileImagePicker(
              model: loginController.getProfileImagePickerModel(context),
            )),

            const SizedBox(height: AppSizes.spaceXS),

            CustomTextPairWidget(
              model: loginController.getCustomTextPair(),
            ),

            const SizedBox(height: AppSizes.spaceM),

            // Row untuk NIS dan Kelompok
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
              child: Row(
                children: [
                  Expanded(
                    child: TextPairWidget(
                      icon: Icons.book,
                      model: profileController.getTextPair('NIS'),
                      boxStyle: BoxStyle.border,
                    ),
                  ),
                  SizedBox(width: AppSizes.spaceM),
                  Expanded(
                    child: TextPairWidget(
                      model: profileController.getTextPair('Kelompok'),
                      boxStyle: BoxStyle.border,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSizes.spaceM),

            // Informasi profil tambahan dengan padding horizontal
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingXL),
              child: Column(
                children: [
                  TextPairWidget(
                    model: profileController.getTextPair('Nama Lengkap'),
                  ),
                  const SizedBox(height: AppSizes.spaceS),
                  TextPairWidget(
                    model:
                        profileController.getTextPair('Tempat, Tanggal Lahir'),
                  ),
                  const SizedBox(height: AppSizes.spaceS),
                  TextPairWidget(
                    model: profileController.getTextPair('Alamat'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSizes.spaceL),

            // Logout Button
            SizedBox(
              width: AppSizes.profileCardWidth,
              child: ReusableButton(
                buttonText: "Logout",
                icon: Icons.logout,
                onPressed: () {
                  loginController.onLogoutPressed(context);
                },
                backgroundColor: AppColors.error,
                textColor: AppColors.textLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
