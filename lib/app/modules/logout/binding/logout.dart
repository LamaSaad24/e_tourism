import 'package:e_torismDemo/app/modules/logout/controller/logout.dart';
import 'package:get/get.dart';

class LogoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogoutController>(
      () => LogoutController(),
    );
  }
}
