import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pas_mobile_11pplg1_25/bindings/all_bindings.dart';
import 'package:pas_mobile_11pplg1_25/pages/favorite_page.dart';
import 'package:pas_mobile_11pplg1_25/pages/login_page.dart';
import 'package:pas_mobile_11pplg1_25/pages/main_page.dart';
import 'package:pas_mobile_11pplg1_25/pages/products_page.dart';
import 'package:pas_mobile_11pplg1_25/pages/profile_page.dart';
import 'package:pas_mobile_11pplg1_25/pages/register_page.dart';
import 'package:pas_mobile_11pplg1_25/pages/splashscreen_page.dart';
import 'package:pas_mobile_11pplg1_25/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.mainpage,
      page: () => MainPage(),
      binding: AllBindings(),
    ),
    GetPage(
      name: AppRoutes.loginpage,
      page: () => LoginPage(),
      binding: AllBindings(),
    ),
    GetPage(
      name: AppRoutes.profilepage,
      page: () => ProfilePage(),
      binding: AllBindings(),
    ),
    GetPage(
      name: AppRoutes.productspage,
      page: () => ProductsPage(),
      binding: AllBindings(),
    ),
    GetPage(
      name: AppRoutes.registerpage,
      page: () => RegisterPage(),
      binding: AllBindings(),
    ),
    GetPage(
      name: AppRoutes.favoritepage,
      page: () => FavoritePage(),
      binding: AllBindings(),
    ),
    GetPage(
      name: AppRoutes.splashscreenpage,
      page: () => SplashscreenPage(),
      binding: AllBindings(),
    ),
  ];
}
