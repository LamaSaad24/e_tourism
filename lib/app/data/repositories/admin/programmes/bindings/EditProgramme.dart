import 'package:e_torismDemo/app/data/repositories/admin/programmes/controllers/EditProgramme.dart';
import 'package:get/get.dart';

class EditProgrammeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<EditProgrammeController>(
      EditProgrammeController(),
      permanent: false,
    );
  }
}
