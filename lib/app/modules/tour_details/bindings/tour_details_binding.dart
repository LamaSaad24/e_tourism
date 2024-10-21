import 'package:e_torismDemo/app/modules/tour_details/controllers/tour_details_controller.dart';
import 'package:get/get.dart';

class TourDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TourDetailsController>(
      () => TourDetailsController(),
    );
  }
}
