import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_25/components/custom_button.dart';
import 'package:pas_mobile_11pplg1_25/components/custom_textfield.dart';
import 'package:pas_mobile_11pplg1_25/controller/login_controller.dart';
import 'package:pas_mobile_11pplg1_25/pages/register_page.dart';
import 'package:pas_mobile_11pplg1_25/routes/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo atau Icon
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lock_outline,
                    size: 60,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 32),

                // Title
                Text(
                  'Selamat Datang',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 8),

                // Subtitle
                Text(
                  'Silakan login untuk melanjutkan',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 48),

                // Email TextField
                CustomTextField(
                  controller: controller.emailController,
                  labelText: 'Username',
                  hintText: 'Masukkan username Anda',
                  prefixIcon: Icons.person_outline,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),

                // Password TextField (TANPA Obx karena tidak ada observable)
                CustomTextField(
                  controller: controller.passwordController,
                  labelText: 'Password',
                  hintText: 'Masukkan password Anda',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 24),

                // Login Button dengan Obx untuk loading state
                Obx(() {
                  return CustomButton(
                    text: 'Login',
                    onPressed: controller.login,
                    isLoading: controller.isLoading.value,
                    icon: Icons.login,
                    height: 54,
                  );
                }),
                const SizedBox(height: 16),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Belum punya akun?',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      const SizedBox(height: 8),

                      // Tombol Daftar bergaya gradient dan rounded
                      CustomButton(
                        text: 'Daftar Sekarang',
                        onPressed: () =>
                            Get.offAllNamed(AppRoutes.registerpage),
                        height: 54,
                        width: 900,
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
