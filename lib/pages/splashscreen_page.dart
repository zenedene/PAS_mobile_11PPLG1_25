import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pas_mobile_11pplg1_25/controller/splashscreen_controller.dart';

class SplashscreenPage extends StatelessWidget {
  const SplashscreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashscreenController controller =
        Get.find<SplashscreenController>();
    return const Scaffold(body: Center(child: Text("SplashScreen")));
  }
}
