import 'package:e_torismDemo/app/data/repositories/admin/drivers/controllers/EditDriver.dart';
import 'package:get/get.dart';

class EditDriverBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<EditDriverController>(
      EditDriverController(),
      permanent: false,
    );
  }
}
