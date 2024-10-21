import 'package:e_torismDemo/app/modules/home/controllers/SearchByDaterPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchByDaterPage extends GetView<SearchByDaterPageController> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () => controller.fetchProgrammes(),
        child: Scaffold(
            appBar: AppBar(
              title: Text('البرامج المتاحة  '),
            ),
            body: Obx(() {
              return controller.isLoading.value
                  ? Center(child: CupertinoActivityIndicator())
                  : Column(
                      children: [
                        controller.programmes.length == 0
                            ? Center(
                                child: Text(
                                    "لا يوجد برامج سياحية متاحة في هذا التاريخ"))
                            : Expanded(
                                child: ListView.builder(
                                  itemCount: controller.programmes.length,
                                  itemBuilder: (context, index) {
                                    final programme =
                                        controller.programmes[index];
                                    return InkWell(
                                      onTap: () {
                                        // الانتقال إلى صفحة تفاصيل الرحلة عند النقر
                                        Get.toNamed(
                                          '/tour-details', // قم بتحديد مسار الصفحة المناسبة
                                          // arguments: programmeList[index]['title'], // تمرير بيانات الرحلة
                                        );
                                      },
                                      child: Card(
                                        elevation: 4,
                                        clipBehavior: Clip.antiAlias,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Stack(children: [
                                          Image.asset(
                                            "assets/images/1.png", // تأكد من توفير المسار الصحيح للصورة
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height:
                                                200, // يمكنك تغيير الارتفاع حسب رغبتك
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(8),
                                                color: Colors
                                                    .black54, // خلفية نصف شفافة
                                                child: Center(
                                                  child: Text(
                                                    programme['name'],
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                programme['type'],
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(8),
                                                color: Colors
                                                    .black54, // خلفية نصف شفافة
                                                child: Text(
                                                  programme["startDate"],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(8),
                                                color: Colors
                                                    .black54, // خلفية نصف شفافة
                                                child: Text(
                                                  programme["description"],
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
