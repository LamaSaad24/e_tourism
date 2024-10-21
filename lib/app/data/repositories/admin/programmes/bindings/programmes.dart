import 'package:e_torismDemo/app/data/repositories/admin/programmes/controllers/programmes.dart';
import 'package:get/get.dart';

class ProgrammesBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ProgrammesController>(
      ProgrammesController(),
      permanent: false,
    );
  }
}
