import 'package:get/get.dart';
import 'package:talentaku_app/apiservice/api_service.dart';
import 'package:talentaku_app/main.dart';
import 'package:talentaku_app/views/login/login.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initializeApp();
  }

  Future<void> initializeApp() async {
    await Future.delayed(const Duration(seconds: 3));
    
    // Check if user is already logged in
    final token = await ApiService.getToken();
    if (token != null) {
      try {
        // Verify token by making an API call
        await ApiService.fetchUserProfile();
        // If successful, navigate to main screen
        Get.offAll(() => MainScreen());
      } catch (e) {
        // If token is invalid, clear it and go to login
        await ApiService.removeToken();
        Get.offAll(() => LoginScreen());
      }
    } else {
      // No token found, go to login screen
      Get.offAll(() => LoginScreen());
    }
  }
}
