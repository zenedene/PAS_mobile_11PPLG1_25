import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_25/controller/bottom_nav_controller.dart';
import 'package:pas_mobile_11pplg1_25/pages/favorite_page.dart';
import 'package:pas_mobile_11pplg1_25/pages/products_page.dart';
import 'package:pas_mobile_11pplg1_25/pages/profile_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final BottomNavController controller = Get.find<BottomNavController>();

  final List<Widget> pages = [ProductsPage(), FavoritePage(), ProfilePage()];

  final List<String> pageTitles = const ["Daftar Produk", "Favorit", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(pageTitles[controller.currentIndex.value])),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Obx(
        () =>
            IndexedStack(index: controller.currentIndex.value, children: pages),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.shopping_bag_rounded),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(IconData icon, String title, int index) {
    return Obx(
      () => ListTile(
        leading: Icon(icon),
        title: Text(title),
        selected: controller.currentIndex.value == index,
        onTap: () {
          controller.changePage(index);
          Get.back();
        },
      ),
    );
  }
}
