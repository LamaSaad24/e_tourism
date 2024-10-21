import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:e_torismDemo/app/modules/home/controllers/main_nav.controller.dart';
import 'package:e_torismDemo/utils/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.controller,
  });

  final MainNavController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        selectedItemColor: AppColors.customRed,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (int index) => controller.homeController.changeTabIndex(index),
        currentIndex: controller.homeController.tabIndex.value,
        items: [
          BottomNavigationBarItem(
            label: 'الرئيسية',
            icon: Icon(
              Icons.home_filled,
              size: 30.r,
            ),
          ),
          // BottomNavigationBarItem(
          //   label: 'الفئات',
          //   icon: Icon(
          //     Icons.category,
          //     size: 30.r,
          //   ),
          // ),
          BottomNavigationBarItem(
            label: 'رحلاتي',
            icon: Icon(
              Icons.tour_rounded,
              size: 30.r,
            ),
          ),
          // BottomNavigationBarItem(
          //   label: 'المفضلة',
          //   icon: Icon(
          //     Icons.favorite,
          //     size: 30.r,
          //   ),
          // ),
        ],
      ),
    );
  }
}
