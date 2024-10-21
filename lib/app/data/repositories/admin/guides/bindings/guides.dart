import 'package:e_torismDemo/app/data/repositories/admin/guides/controllers/guides.dart';
import 'package:get/get.dart';

class GuidesBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<GuidesController>(
      GuidesController(),
      permanent: false,
    );
  }
}
