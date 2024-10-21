import 'package:e_torismDemo/app/data/repositories/admin/drivers/controllers/EditDriver.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDriverView extends GetView<EditDriverController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('تعديل بيانات السائق'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Form(
            key: _formKey,
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                return SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      TextFormField(
                        controller: controller.fNameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            labelText: 'الاسم الأول'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'هذا الحقل مطلوب';
                          } else if (value.length > 255) {
                            return ' بجب ان يكون أقل من 255 محارف';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        controller: controller.lNameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            labelText: 'اسم العائلة'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'هذا الحقل مطلوب';
                          } else if (value.length > 255) {
                            return ' بجب ان يكون أقل من 255 محارف';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        controller: controller.mobileController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            labelText: 'رقم الهاتف'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'هذا الحقل مطلوب';
                          } else if (value.length < 10) {
                            return ' بجب ان يحتوي على 10 محارف';
                          } else if (value.length > 15) {
                            return ' بجب ان يكون أقل من 15 محارف';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        controller: controller.plateController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            labelText: 'رقم اللوحة'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'هذا الحقل مطلوب';
                          } else if (value.length < 5) {
                            return ' بجب ان يحتوي على 5 محارف';
                          } else if (value.length > 10) {
                            return ' بجب ان يكون أقل من 10 محارف';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                          controller: controller.descriptionController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                              labelText: 'الوصف')),
                      SizedBox(height: 20),
                      Obx(() => Center(
                              child: Text(
                            controller.msg.value,
                            style: TextStyle(
                                fontSize: 19, color: Colors.blueAccent),
                          ))),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // إذا كانت الحقول صحيحة
                            Map<String, dynamic> updatedDriver = {
                              'id': controller.driver['id'],
                              'fName': controller.fNameController.text,
                              'lName': controller.lNameController.text,
                              'phoneNumber': controller.mobileController.text,
                              'plateNumber': controller.plateController.text,
                              'description':
                                  controller.descriptionController.text,
                            };
                            controller.updateDrive(updatedDriver);
                            // Get.offNamed("/drivers");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple),
                        child: Text('تحديث',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ));
              }
            })));
  }
}
