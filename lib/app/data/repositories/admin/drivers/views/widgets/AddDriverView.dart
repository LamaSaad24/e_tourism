import 'package:e_torismDemo/app/data/repositories/admin/drivers/controllers/EditDriver.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDriverView extends GetView<EditDriverController> {
  final _formKey = GlobalKey<FormState>();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final mobileController = TextEditingController();
  final plateController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('إضافة  سائق'),
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
                          return ' بجب ان يحتوي على 10 محارف';
                        } else if (value.length > 15) {
                          return ' بجب ان يكون أقل من 15 محارف';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      controller: plateController,
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
                    TextField(
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
                            labelText: 'الوصف')),
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
                          // إذا كانت الحقول صحيحة
                          Map<String, dynamic> AddedDrive = {
                            'fName': fNameController.text,
                            'lName': lNameController.text,
                            'phoneNumber': mobileController.text,
                            'plateNumber': plateController.text,
                            'description': descriptionController.text,
                          };
                          controller.AddDrive(AddedDrive);
                          // Get.offNamed("/drivers");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple),
                      child:
                          Text('إضافة', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              )),
        ));
  }
}
