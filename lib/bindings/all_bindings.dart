import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_25/controller/bottom_nav_controller.dart';
import 'package:pas_mobile_11pplg1_25/controller/favorite_controller.dart';
import 'package:pas_mobile_11pplg1_25/controller/login_controller.dart';
import 'package:pas_mobile_11pplg1_25/controller/products_controller.dart';
import 'package:pas_mobile_11pplg1_25/controller/register_controller.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<ProductsController>(() => ProductsController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<FavoriteController>(() => FavoriteController());
  }
}
