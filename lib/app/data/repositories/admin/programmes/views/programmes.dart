import 'package:e_torismDemo/app/data/repositories/admin/programmes/controllers/programmes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:e_torismDemo/app/data/repositories/admin/programmes/views/widgets/common_card.dart';

class ProgrammesView extends GetView<ProgrammesController> {
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('البرامج السياحية'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white70),
            onPressed: () {
              Get.toNamed('/addProgramme');
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
            title: 'تسجيل دخول  ',
            icon: Icons.drive_eta,
            route: '/login',
          )
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
                itemCount: controller.programmes.length,
                itemBuilder: (context, index) {
                  final programme = controller.programmes[index];
                  return CommonCard(
                    // height: 166,
                    // child: Padding(
                    // padding: const EdgeInsets.all(6),
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
                          '${programme['name']}',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          ' النوع: ${programme['type']}',
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black26),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'وصف: ${programme['description'].substring(0, 15)}',
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black26),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                Get.toNamed('/editProgrammes',
                                    arguments: {'id': '${programme['id']}'});
                              },
                            ),
                            IconButton(
                              icon:
                                  Icon(Icons.delete, color: Colors.deepPurple),
                              onPressed: () {
                                controller.deleteProgramme(programme['id']);
                                controller.refresh();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    // ),
                  );
                },
              );
      }),
    );
  }
}
