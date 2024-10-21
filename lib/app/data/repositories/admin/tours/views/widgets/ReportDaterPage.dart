import 'package:e_torismDemo/app/data/repositories/admin/tours/controllers/SearchByDaterPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportDaterPage extends GetView<ReportDaterPageController> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => controller.fetchProgrammes(),
        child: Scaffold(
            appBar: AppBar(
              title: Text('الرحلات السياحية  '),
            ),
            body: Obx(() {
              return controller.isLoading.value
                  ? Center(child: CupertinoActivityIndicator())
                  : Column(
                      children: [
                        controller.programmes.length == 0
                            ? Center(
                                child: Text(
                                    "لا يوجد باصات لرحلات  سياحية متاحة في هذا التاريخ"))
                            : Expanded(
                                child: ListView.builder(
                                  itemCount: controller.programmes.length,
                                  itemBuilder: (context, index) {
                                    final programme =
                                        controller.programmes[index];
                                    return InkWell(
                                      onTap: () {},
                                      child: Card(
                                        elevation: 4,
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Stack(children: [
                                          // Image.asset(
                                          //   "assets/images/3.png", // تأكد من توفير المسار الصحيح للصورة
                                          //   fit: BoxFit.cover,
                                          //   width: double.infinity,
                                          //   height:
                                          //       200, // يمكنك تغيير الارتفاع حسب رغبتك
                                          // ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(8),
                                                color: Colors
                                                    .black, // خلفية نصف شفافة
                                                child: Center(
                                                  child: Text(
                                                    "  اسم السائق ${programme['fName']} ${programme['lName']}",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "  هاتف" +
                                                    programme['phoneNumber'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "  رقم اللوحة" +
                                                    programme['plateNumber'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                color: Colors
                                                    .black54, // خلفية نصف شفافة
                                                child: Text(
                                                  "  عدد الباصات ${programme["tours_count"]}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                    );
                                  },
                                ),
                              ),
                      ],
                    );
            })));
  }
}
