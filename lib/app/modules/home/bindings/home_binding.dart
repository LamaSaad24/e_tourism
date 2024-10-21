import 'package:get/get.dart';
import 'package:e_torismDemo/app/modules/home/controllers/home_controller.dart';
import 'package:e_torismDemo/app/modules/home/controllers/main_nav.controller.dart';
import 'package:e_torismDemo/app/modules/home/controllers/shopping_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(),
      permanent: false,
    );
    Get.put<ShoppingController>(
      ShoppingController(),
      permanent: false,
    );
    Get.put<MainNavController>(
      MainNavController(),
      permanent: false,
    );
  }
}
