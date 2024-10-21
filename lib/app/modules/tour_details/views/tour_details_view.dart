import 'package:e_torismDemo/app/modules/tour_details/controllers/tour_details_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:e_torismDemo/app/modules/tour_details/views/widgets/app_bar_widget.dart';
import 'package:e_torismDemo/app/modules/tour_details/views/widgets/buttons_widget.dart';
import 'package:e_torismDemo/app/modules/tour_details/views/widgets/page_indicator.dart';
import 'package:e_torismDemo/utils/colors.dart';

class TourDetailsView extends GetView<TourDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TourAppBar(),
        body: (Obx(() {
          if (controller.isLoading.value) {
            return CupertinoActivityIndicator();
          } else {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              physics: NeverScrollableScrollPhysics(),
              children: [
                Image.network(
                  "http://etourismsvu.mooo.com/${controller.tour['photo']}",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 90.h,
                ),
                SizedBox(height: 15.h),
                PageIndicator(controller: controller),
                SizedBox(height: 30.h),
                Text(
                  "السعر  ${controller.tour['price']}\$",
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: AppColors.customRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "  عدد السياح المشتركين ${controller.tour['number']}",
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: AppColors.customRed,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "الوصف  ${controller.tour['description']}",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 20.h),
                ButtonsWidget(controller: controller),
              ],
            );
          }
        })));
  }
}
