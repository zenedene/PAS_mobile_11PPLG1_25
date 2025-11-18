import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_25/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  /// 🔹 Cek status login dan navigasi otomatis
  Future<void> checkLoginStatus() async {
    // Delay untuk menampilkan splashscreen (opsional)
    await Future.delayed(const Duration(seconds: 2));

    try {
      final prefs = await SharedPreferences.getInstance();
      final username = prefs.getString('username');

      if (username != null && username.isNotEmpty) {
        Get.offAllNamed(AppRoutes.mainpage);
      } else {
        Get.offAllNamed(AppRoutes.loginpage);
      }
    } catch (e) {
      print('Error checking login status: $e');
      Get.offAllNamed(AppRoutes.loginpage);
    } finally {
      isLoading.value = false;
    }
  }
  Future<bool> isUserLoggedIn() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final username = prefs.getString('username');
      return username != null && username.isNotEmpty;
    } catch (e) {
      print('Error checking if user logged in: $e');
      return false;
    }
  }
  Future<String?> getSavedUsername() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString('username');
    } catch (e) {
      print('Error getting saved username: $e');
      return null;
    }
  }
}
