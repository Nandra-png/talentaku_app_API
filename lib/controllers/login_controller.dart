import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talentaku_app/apimodels/user_model.dart';
import 'package:talentaku_app/apiservice/api_service.dart';
import 'package:talentaku_app/controllers/home_controller.dart';
import 'package:talentaku_app/models/profile_models.dart';
import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';
import '../models/login_models.dart';
import '../models/profile_image_picker.dart';
import '../models/text_pair.dart';
import '../models/text_field.dart';
import '../views/login/login_pick_image.dart';
import '../views/login/login.dart';

class LoginController extends GetxController {
  // Login model for state management
  var loginModel = LoginModel().obs;
  var isLoading = false.obs;
  var user = Rxn<UserModel>();
  var isImagePicked = false.obs;
  var profileImage = ''.obs;

  Future<void> login(
      BuildContext context, String username, String password) async {
    isLoading.value = true;
    isLoading.refresh(); // Memastikan UI terupdate

    try {
      final response = await ApiService.login(username, password);
      if (response.containsKey('data')) {
        user.value = UserModel.fromJson(response['data']);
        if (user.value?.photo != null) {
          profileImage.value = user.value!.photo!;
        }
        Get.snackbar('Success', 'Login Successful');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPickImage()),
        );
      } else {
        Get.snackbar('Error', 'Invalid username or password');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to connect to server');
    } finally {
      isLoading.value = false;
      isLoading
          .refresh(); // Memastikan UI terupdate lagi setelah proses selesai
    }
  }

  // Function to pick image and upload it
  Future<void> pickAndUploadImage(BuildContext context) async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage.value = pickedFile.path;
      isImagePicked.value = true;

      isLoading.value = true;
      try {
        final response = await ApiService.uploadProfilePhoto(File(pickedFile.path));
        if (response.containsKey('data')) {
          Get.snackbar('Success', 'Photo uploaded successfully');
          String uploadedPhotoUrl = response['data']['photo'];
          user.value?.photo = uploadedPhotoUrl;
          profileImage.value = uploadedPhotoUrl;
        } else {
          Get.snackbar('Error', 'Failed to upload photo');
        }
      } catch (e) {
        Get.snackbar('Error', 'Failed to upload photo: $e');
      } finally {
        isLoading.value = false;
      }
    }
  }

  // Controllers for username and password
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Function to create a CustomTextPair model
  CustomTextPairModel getPair() {
    return CustomTextPairModel(
      primaryText: "Selamat Datang",
      secondaryText: "Semangat buat hari ini ya...",
      primaryStyle: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),
      secondaryStyle: TextStyle(fontSize: 16, color: Colors.black),
      alignment: CrossAxisAlignment.start,
    );
  }

  // Function to create a CustomTextPair model
  CustomTextPairModel getCustomTextPair() {
    final homeController = Get.find<HomeController>();
    return CustomTextPairModel(
      primaryText: homeController.userName,
      secondaryText: "Siswa KB",
      primaryStyle: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.textDark),
      secondaryStyle: TextStyle(fontSize: 16, color: AppColors.primary),
      alignment: CrossAxisAlignment.start,
    );
  }

  CustomTextFieldModel getUsernameModel() {
    return CustomTextFieldModel(
      controller: usernameController,
      labelText: 'Username',
      onChanged: (value) => updateCredentials(),
    );
  }

  CustomTextFieldModel getPasswordModel() {
    return CustomTextFieldModel(
      controller: passwordController,
      labelText: 'Password',
      isPassword: true,
      onChanged: (value) => updateCredentials(),
    );
  }

  ProfileImagePickerModel getProfileImagePickerModel(BuildContext context) {
    return ProfileImagePickerModel(
      image: isImagePicked.value
          ? FileImage(File(profileImage.value))
          : AssetImage('images/default_image.png') as ImageProvider,
      avatarRadius: AppSizes.radiusLarge,
      cameraRadius: AppSizes.radiusXL,
      cameraBackgroundColor: AppColors.backgroundLogin,
      cameraIcon: Icon(Icons.add_a_photo, color: AppColors.textLight),
      onCameraTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(AppSizes.spaceM),
              height: 230,
              child: Column(
                children: [
                  const Text(
                    "Pilih dari",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: AppSizes.spaceXL),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildOption(
                        icon: Icons.camera_alt,
                        label: "Camera",
                        onTap: () {
                          Navigator.pop(context);
                          pickImageFromCamera(context);
                        },
                      ),
                      buildOption(
                        icon: Icons.photo_library,
                        label: "Gallery",
                        onTap: () {
                          Navigator.pop(context);
                          pickImageFromGallery(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Future<void> pickImageFromCamera(BuildContext context) async {
  //   final picker = ImagePicker();
  //   final XFile? pickedFile =
  //       await picker.pickImage(source: ImageSource.camera);
  //
  //   if (pickedFile != null) {
  //     profileImage.value = pickedFile.path;
  //     isImagePicked.value = true;
  //   }
  // }

  // Future<void> pickImageFromCamera(BuildContext context) async {
  //   final picker = ImagePicker();
  //   final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
  //   if (pickedFile != null) {
  //     profileImage.value = pickedFile.path;
  //     isImagePicked.value = true;
  //     await uploadImage(pickedFile.path);
  //   }
  // }

  Future<void> uploadImage(String filePath) async {
    isLoading.value = true;
    try {
      final response = await ApiService.uploadProfilePhoto(File(filePath));
      if (response.containsKey('data')) {
        String uploadedPhotoUrl = response['data']['photo'];
        profileImage.value = uploadedPhotoUrl;
        user.value?.photo = uploadedPhotoUrl;
        Get.snackbar('Success', 'Photo uploaded successfully');
      } else {
        Get.snackbar('Error', 'Failed to upload photo');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload photo: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickImage(ImageSource source, BuildContext context) async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      profileImage.value = pickedFile.path;
      isImagePicked.value = true;
      await uploadImage(pickedFile.path);
    }
  }

  Future<void> pickImageFromCamera(BuildContext context) async {
    await pickImage(ImageSource.camera, context);
  }

  Future<void> pickImageFromGallery(BuildContext context) async {
    await pickImage(ImageSource.gallery, context);
  }

  // Future<void> pickImageFromGallery(BuildContext context) async {
  //   final picker = ImagePicker();
  //   final XFile? pickedFile =
  //       await picker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedFile != null) {
  //     profileImage.value = pickedFile.path;
  //     isImagePicked.value = true;
  //     await uploadImage(pickedFile.path);
  //   }
  // }

  static Widget buildOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 40),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    usernameController.addListener(updateCredentials);
    passwordController.addListener(updateCredentials);
  }

  void updateCredentials() {
    loginModel.value.updateLoginState(
      usernameController.text,
      passwordController.text,
    );
  }

  void onLoginPressed(BuildContext context) {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    if (username.isNotEmpty && password.isNotEmpty) {
      login(context, username, password);
    } else {
      Get.snackbar('Error', 'Please fill all fields');
    }
  }

  void resetForm() {
    usernameController.clear();
    passwordController.clear();
    isImagePicked.value = false;
    profileImage.value = '';
  }

  void onLogoutPressed(BuildContext context) {
    Get.snackbar(
      'Anda Berhasil Logout',
      'Anda telah keluar dari akun Anda.',
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(AppSizes.paddingXL),
    );
    resetForm();
    Get.offAll(() => LoginScreen());
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
