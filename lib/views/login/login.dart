import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentaku_app/constants/app_colors.dart';
import '../../constants/app_sizes.dart';
import '../../controllers/login_controller.dart';
import '../../widgets/custom_text_pair.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/login_button.dart'; // Import custom text field

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.backgroundLogin,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Image.asset("images/logo.png"),
                Container(
                  padding: EdgeInsets.all(AppSizes.paddingXL),
                  margin: EdgeInsets.all(AppSizes.paddingXL),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      // CustomTextPairWidget
                      CustomTextPairWidget(
                        model: controller.getPair(),
                      ),

                      SizedBox(height: AppSizes.spaceXL),

                      // Username input field menggunakan CustomTextFieldWidget
                      CustomTextFieldWidget(
                          model: controller.getUsernameModel()),

                      SizedBox(height: AppSizes.spaceXL),

                      // Password input field menggunakan CustomTextFieldWidget
                      CustomTextFieldWidget(
                          model: controller.getPasswordModel()),

                      SizedBox(height: AppSizes.spaceXL),

                      // Login button
                      // Login button
                      Obx(() => ReusableButton(
                            buttonText: 'Login',
                            isLoading: controller.isLoading.value,
                            icon: Icons.arrow_forward_ios_rounded,
                            onPressed: () => controller.onLoginPressed(context),
                          )),
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
