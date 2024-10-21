import 'package:e_torismDemo/app/data/repositories/admin/tourists/controllers/tourists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:e_torismDemo/app/data/repositories/admin/tourists/views/widgets/common_card.dart';

class TouristsView extends GetView<TouristsController> {
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(' السياح'),
        backgroundColor: Colors.deepPurple,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.add, color: Colors.white70),
        //     onPressed: () {
        //       Get.toNamed('/addTourist');
        //     },
        //   ),
        // ],
      ),
      body: Obx(() {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: controller.tourists.length,
          itemBuilder: (context, index) {
            final tourist = controller.tourists[index];
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
                      '${tourist['fName']} ${tourist['lName']}',
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'رقم الهاتف: ${tourist['phoneNumber']}',
                      style:
                          const TextStyle(fontSize: 15, color: Colors.black26),
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
