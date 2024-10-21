import 'package:e_torismDemo/app/data/repositories/admin/tours/controllers/SearchByDaterPage.dart';
import 'package:get/get.dart';

class ReportDaterPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<ReportDaterPageController>(
      ReportDaterPageController(),
      permanent: false,
    );
  }
}
