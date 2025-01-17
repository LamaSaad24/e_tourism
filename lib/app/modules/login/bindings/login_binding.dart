import 'package:get/get.dart';
import 'package:e_torismDemo/app/data/repositories/user/auth/auth_repository.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );
  }
}
