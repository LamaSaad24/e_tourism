import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:e_torismDemo/app/modules/home/controllers/shopping_controller.dart';
import 'package:e_torismDemo/utils/colors.dart';

class ProductCartList extends GetView<ShoppingController> {
  const ProductCartList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.fetchToursItems(),
      child: Obx(() {
        if (controller.tourItems.isEmpty) {
          return Center(
            child: Text(
              'لا توجد رحلات مشترك فيها 🙁',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: controller.tourItems.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final tour = controller.tourItems[index];
              return Slidable(
                endActionPane: ActionPane(
                  motion: StretchMotion(),
                  extentRatio: 0.5,
                  children: [
                    SlidableAction(
                      onPressed: (context) {},
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                      backgroundColor: AppColors.yellowColor,
                      icon: Icons.add_circle,
                      foregroundColor: AppColors.whiteColor,
                    ),
                    SlidableAction(
                      onPressed: (context) => (),
                      // controller.removeCartItem(
                      // controller.tourItems[index].product_name),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                      backgroundColor: AppColors.redColor,
                      icon: Icons.delete,
                      foregroundColor: AppColors.whiteColor,
                    ),
                  ],
                ),
                child: Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  child: ListTile(
                    onTap: () {},
                    leading: Image.network(
                      "http://etourismsvu.mooo.com/${tour['photo']}",
                      fit: BoxFit.fill,
                      width: 80.w,
                    ),
                    title: Text(
                      tour['price'].toString(),
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      tour['description'],
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
