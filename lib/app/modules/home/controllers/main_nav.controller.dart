import 'dart:async';
import 'package:get/get.dart';
import 'package:e_torismDemo/app/modules/home/controllers/shopping_controller.dart';
import 'package:e_torismDemo/app/routes/app_pages.dart';
import 'home_controller.dart';

class MainNavController extends GetxController {
  final homeController = Get.find<HomeController>();
  final shoppingController = Get.find<ShoppingController>();

  Future<void> signOut() async {
    deleteControllers();
    Get.offAllNamed(AppPages.LOGIN);
  }

  void deleteControllers() {
    Get.delete<HomeController>(
      force: true,
    );
    Get.delete<ShoppingController>(
      force: true,
    );
  }

  @override
  void onInit() {
    super.onInit();
  }
}
