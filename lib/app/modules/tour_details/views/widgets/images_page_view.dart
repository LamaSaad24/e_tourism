import 'package:e_torismDemo/app/modules/tour_details/controllers/tour_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesPageView extends StatelessWidget {
  const ImagesPageView({
    super.key,
    required this.controller,
  });

  final TourDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: PageView.builder(
        itemCount: 3,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        onPageChanged: (index) => controller.changePage(index),
        itemBuilder: (context, index) {
          return Image.network(
            controller.tour['tour_image'],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
