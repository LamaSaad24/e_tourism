import 'package:e_torismDemo/app/data/repositories/admin/guides/controllers/EditGuied.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddGuideView extends GetView<EditGuiedController> {
  final _formKey = GlobalKey<FormState>();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('إضافة دليل'),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: fNameController,
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
                    controller: lNameController,
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
                    controller: mobileController,
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
                        return ' بجب ان يحتوي  على 10 محارف';
                      } else if (value.length > 15) {
                        return ' بجب ان يكون أقل من 15 محارف';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),
                  TextFormField(
                    controller: addressController,
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
                        labelText: 'العنوان'),
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
                      controller: descriptionController,
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
                          labelText: 'الوصف'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'هذا الحقل مطلوب';
                        } else if (value.length < 15) {
                          return ' بجب ان يحتوي على أكثر من 15 محرف';
                        }
                        return null;
                      }),
                  SizedBox(height: 20),
                  Obx(() => Center(
                          child: Text(
                        controller.msg.value,
                        style:
                            TextStyle(fontSize: 19, color: Colors.blueAccent),
                      ))),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Map<String, dynamic> AddedGuide = {
                          'fName': fNameController.text,
                          'lName': lNameController.text,
                          'mobile': mobileController.text,
                          'address': addressController.text,
                          'description': descriptionController.text,
                        };
                        controller.AddGuide(AddedGuide);
                        // Get.back();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple),
                    child: Text('إضافة', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
