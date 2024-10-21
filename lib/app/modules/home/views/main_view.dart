import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:e_torismDemo/app/modules/home/controllers/main_nav.controller.dart';
import 'package:e_torismDemo/app/modules/home/views/nav_pages/home_nav_page.dart';
import 'package:e_torismDemo/app/modules/home/views/nav_pages/shopping_nav_page.dart';
import 'package:e_torismDemo/app/modules/home/views/widgets/bottom_nav_bar.dart';
import 'package:e_torismDemo/app/components/custom_app_bar.dart';

class MainView extends GetView<MainNavController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Obx(
            () => Text(
              controller.homeController.changeTabTitle(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(controller: controller),
      body: Obx(
        () => IndexedStack(
          index: controller.homeController.tabIndex.value,
          children: [
            HomeNavPage(),
            ShoppingNavPage(),
          ],
        ),
      ),
    );
  }
}
