import 'package:e_torismDemo/app/data/repositories/admin/guides/controllers/EditGuied.dart';
import 'package:get/get.dart';

class EditGuideBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<EditGuiedController>(
      EditGuiedController(),
      permanent: false,
    );
  }
}
