import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:e_torismDemo/app/data/repositories/admin/guides/controllers/guides.dart';
import 'package:e_torismDemo/app/data/repositories/admin/guides/views/widgets/common_card.dart';

class GuidesView extends GetView<GuidesController> {
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('الدليل السياحي'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white70),
            onPressed: () {
              Get.toNamed('/addGuide');
            },
          ),
        ],
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
      body: Obx(() {
        return controller.isLoading.value
            ? Center(child: CupertinoActivityIndicator())
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemCount: controller.guides.length,
                itemBuilder: (context, index) {
                  final guide = controller.guides[index];
                  return CommonCard(
                    // height: 166,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Container(
                              width: 36,
                              height: 36,
                              alignment: Alignment.center,
                              color: Colors.grey.shade200,
                              child: Icon(
                                Icons.person,
                                color: Colors.purple, // لون الرمز
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '${guide['fName']} ${guide['lName']}',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'رقم الهاتف: ${guide['mobile']}',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black26),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "العنوان: ${guide['address']}",
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black26),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'وصف: ${guide['description'].substring(0, 10)}',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.black26),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  Get.toNamed('/editGuide',
                                      arguments: {'id': '${guide['id']}'});
                                },
                              ),
                              IconButton(
                                icon:
                                    Icon(Icons.delete, color: Colors.redAccent),
                                onPressed: () {
                                  controller.deleteGuide(guide['id']);
                                  controller.refresh();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
      }),
    );
  }
}
