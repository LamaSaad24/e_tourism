import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:e_torismDemo/app/modules/home/controllers/shopping_controller.dart';
import 'package:e_torismDemo/app/modules/home/views/widgets/product_cart_list.widget.dart';
import 'package:e_torismDemo/utils/colors.dart';

class ShoppingNavPage extends GetView<ShoppingController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(height: 20),
          TabBar(
            labelStyle: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
            indicatorColor: AppColors.customRed,
            onTap: (index) => controller.changeTabIndex(index),
            tabs: [
              Tab(
                text: 'الرحلات المسجل عليها',
              ),
              Tab(
                text: ' ',
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () => IndexedStack(
                index: controller.selectedIndex.value,
                children: [
                  ProductCartList(),
                  Center(
                    child: Text(
                      'لا توجد طلبات تم تسليمها 🥲',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
