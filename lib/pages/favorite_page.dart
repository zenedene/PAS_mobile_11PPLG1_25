import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_25/controller/favorite_controller.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
  final FavoriteController controller = Get.find<FavoriteController>();
    return Scaffold(
      body: Center(
        child: Text(
          'Halaman Favorit',
          style: TextStyle(fontSize: 24, color: Colors.grey.shade600),
        ),
      ),
    );
  }
}