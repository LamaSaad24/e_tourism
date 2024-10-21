import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:e_torismDemo/app/modules/home/controllers/home_controller.dart';
import 'package:e_torismDemo/utils/colors.dart';

class ProductItemsList extends StatelessWidget {
  const ProductItemsList({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return CupertinoActivityIndicator();
      } else if (controller.tours.isEmpty) {
        return Center(
          child: Text(
            'لا توجد عناصر لعرضها 🙁',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      } else
        return GridView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
          itemCount: controller.tours.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final tour = controller.tours[index];
            return InkWell(
              onTap: () {
                Get.toNamed('/tour_details',
                    arguments: {'id': '${tour['id']}'});
              },
              child: Card(
                elevation: 4,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      "http://etourismsvu.mooo.com/${tour['photo']}",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 90.h,
                    ),
                    // Text(
                    //   tour['description'].substring(0,5),
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 15.sp,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            " ${tour['number'].toString()}" + "سائح",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        Text(
                          tour["price"].toString() + "\$" + "  التكلفة: ",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.customRed,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
    });
  }
}
