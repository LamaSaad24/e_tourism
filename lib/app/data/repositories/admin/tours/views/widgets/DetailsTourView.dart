import 'package:e_torismDemo/app/data/repositories/admin/tours/controllers/DetailsTour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_torismDemo/utils/colors.dart';
import 'package:get/get.dart';

class DetailsTourView extends GetView<DetailsTourController> {
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final id = args['id'];
    controller.setTourId(id);

    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(' تفاصيل الرحلة'),
        backgroundColor: Colors.deepPurple,
      ),
      body: (Obx(() {
        return controller.isLoading.value
            ? Center(child: CupertinoActivityIndicator())
            : ListView(
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
                  SizedBox(height: 30.h),
                  SizedBox(height: 10.h),
                  Text(
                    " السعر: ${controller.tour['price']}\$  ",
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColors.customRed,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    " عدد السياح: ${controller.tour['number']} ",
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: AppColors.customRed,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "الوصف: ${controller.tour['description']} ",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "بدء الرحلة: ${controller.tour['startDate']} ",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "انتهاء الرحلة: ${controller.tour['endDate']} ",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              );
      })),
    );
  }
}
