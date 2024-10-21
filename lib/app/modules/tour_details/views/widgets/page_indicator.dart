import 'package:e_torismDemo/app/modules/tour_details/controllers/tour_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_torismDemo/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.controller,
  });

  final TourDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () => AnimatedSmoothIndicator(
          activeIndex: controller.photoIndex.value,
          count: 3,
          effect: WormEffect(
            dotColor: Colors.grey.shade400,
            activeDotColor: AppColors.customRed,
          ),
        ),
      ),
    );
  }
}
