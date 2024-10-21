import 'package:e_torismDemo/app/data/repositories/admin/home/controllers/admin_home.controller.dart';
import 'package:get/get.dart';

class AdminHomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AdminHomeController>(
      AdminHomeController(),
      permanent: false,
    );
  }
}
