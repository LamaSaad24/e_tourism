import 'package:e_torismDemo/app/modules/home/controllers/SearchByDaterPage.dart';
import 'package:get/get.dart';

class SearchBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SearchByDaterPageController>(
      SearchByDaterPageController(),
      permanent: false,
    );
  }
}
