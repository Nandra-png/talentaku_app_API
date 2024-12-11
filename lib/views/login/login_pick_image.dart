// views/login_pick_image.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import 'package:talentaku_app/main.dart';
import 'package:talentaku_app/widgets/custom_text_pair.dart';
import 'package:talentaku_app/widgets/login_button.dart';
import '../../constants/app_sizes.dart';
import '../../controllers/login_controller.dart';
import '../../widgets/profile_image.dart';

class LoginPickImage extends StatelessWidget {
  const LoginPickImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.backgroundLogin,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(AppSizes.spaceXS),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("images/logo.png", fit: BoxFit.fill),
                Container(
                  padding: const EdgeInsets.all(AppSizes.spaceL),
                  margin: const EdgeInsets.all(AppSizes.avatarIconSize),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.textLight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // CustomTextPairWidget
                      CustomTextPairWidget(
                        model: controller.getPair(),
                      ),

                      SizedBox(height: AppSizes.spaceXL),

                      // ProfileImagePicker wrapped in Obx for real-time updates
                      Obx(() => ProfileImagePicker(
                        model: controller.getProfileImagePickerModel(context),
                      )),

                      SizedBox(height: AppSizes.spaceXL),

                      ReusableButton(
                        buttonText: 'Lanjut',
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MainScreen()),
                          );
                        },
                        icon: Icons.arrow_forward_ios_rounded,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
