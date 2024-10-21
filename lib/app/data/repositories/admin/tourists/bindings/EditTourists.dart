import 'package:e_torismDemo/app/data/repositories/admin/tourists/controllers/EditTourists.dart';
import 'package:get/get.dart';

class EditTouristsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<EditTouristsController>(
      EditTouristsController(),
      permanent: false,
    );
  }
}
