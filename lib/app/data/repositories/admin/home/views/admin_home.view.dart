import 'package:e_torismDemo/app/data/repositories/admin/home/views/widgets/DashboardCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_torismDemo/app/data/repositories/admin/home/controllers/admin_home.controller.dart';

import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('لوحة التحكم'),
        backgroundColor: Colors.deepPurple,
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'الصفحة الرئيسية',
            route: '/home_dash',
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'الدليل السياحيين',
            icon: Icons.drive_eta,
            route: '/guides',
          ),
          AdminMenuItem(
            title: 'السائقين ',
            icon: Icons.drive_eta,
            route: '/drivers',
          ),
          AdminMenuItem(
            title: 'البرامج السياحية',
            icon: Icons.add_chart,
            route: '/programmes',
          ),
          AdminMenuItem(
            title: 'الرحلات ',
            icon: Icons.tour,
            route: '/tours',
          ),
          AdminMenuItem(
            title: 'السياح ',
            icon: Icons.drive_eta,
            route: '/tourists',
          ),
          AdminMenuItem(
            title: 'تسجيل الخروج ',
            icon: Icons.logout,
            route: '/logout',
          ),
        ],
        selectedRoute: '/',
        onSelected: (item) {
          if (item.route != null) {
            Navigator.of(context).pushNamed(item.route!);
          }
        },
      ),
      body: SingleChildScrollView(child: Obx(() {
        return controller.isLoading.value
            ? Center(child: CupertinoActivityIndicator())
            : Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الصفحة الرئيسية',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
                      ),
                    ),
                    SizedBox(height: 20),
                    GridView.count(
                      crossAxisCount: 2, // عدد الأعمدة
                      crossAxisSpacing: 10, // المسافة بين الأعمدة
                      mainAxisSpacing: 10, // المسافة بين الصفوف
                      shrinkWrap:
                          true, // يتناسب مع محتوى الشاشة ولا يحتاج إلى التمرير
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context,
                                '/guides'); // تأكد من تعريف المسار '/guides'
                          },
                          child: DashboardCard(
                            icon: Icons.people,
                            color: Colors.amber,
                            label: "الدليل السياحي",
                            value: controller.guides.length,
                            route: '/guides',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context,
                                '/drivers'); // تأكد من تعريف المسار '/guides'
                          },
                          child: DashboardCard(
                            icon: Icons.drive_eta,
                            color: Colors.deepOrangeAccent,
                            label: "السائقيين",
                            value: controller.drivers.length,
                            route: '/drivers',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context,
                                '/programmes'); // تأكد من تعريف المسار '/guides'
                          },
                          child: DashboardCard(
                            icon: Icons.add_chart,
                            color: Colors.lightBlueAccent,
                            label: "البرامج السياحية",
                            value: controller.programmes.length,
                            route: '/programmes',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context,
                                '/tours'); // تأكد من تعريف المسار '/guides'
                          },
                          child: DashboardCard(
                            icon: Icons.tour,
                            color: Colors.lightGreen,
                            label: "الرحلات",
                            value: controller.tours.length,
                            route: '/tours',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context,
                                '/tourists'); // تأكد من تعريف المسار '/guides'
                          },
                          child: DashboardCard(
                            icon: Icons.drive_eta,
                            color: Colors.greenAccent,
                            label: "السياح",
                            value: controller.tourists.length,
                            route: '/tourists',
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context,
                                '/home'); // تأكد من تعريف المسار '/guides'
                          },
                          child: DashboardCard(
                            icon: Icons.home,
                            color: Colors.deepPurpleAccent,
                            label: "صفحات المستخدم",
                            value: 0,
                            route: '/home',
                          ),
                        ),
                      ],
                    ),
                  ], //children
                ),
              );
      })),
    );
  }
}
