import 'package:e_torismDemo/app/data/repositories/admin/programmes/controllers/EditProgramme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class AddProgrammeView extends GetView<EditProgrammeController> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final descriptionController = TextEditingController();
  final startdateController = TextEditingController();
  final enddateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('إضافة برنامج'),
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
                      controller: nameController,
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
                          labelText: 'الاسم '),
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
                      controller: typeController,
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
                          labelText: ' النوع'),
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
                    SizedBox(height: 10.h),
                    TextFormField(
                      controller: startdateController,
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
                          labelText: 'تاريخ بدء الرحلة'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'هذا الحقل مطلوب';
                        }
                        return null;
                      },
                      readOnly: true, // يمنع المستخدم من الكتابة يدويًا
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          startdateController.text = formattedDate;
                        }
                      },
                    ),
                    SizedBox(height: 10.h),
                    TextFormField(
                      controller: enddateController,
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
                          labelText: 'تاريخ انتهاء الرحلة'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'هذا الحقل مطلوب';
                        } else if (DateTime.parse(value).isBefore(
                            DateTime.parse(startdateController.text))) {
                          return ' يجب  أن يكون تاريخ الانتهاء بعد تاريخ البدء';
                        }
                        return null;
                      },
                      readOnly: true, // يمنع المستخدم من الكتابة يدويًا
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          enddateController.text = formattedDate;
                        }
                      },
                    ),
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
                          Map<String, dynamic> AddedProgramme = {
                            'name': nameController.text,
                            'type': typeController.text,
                            'description': descriptionController.text,
                            'startDate': startdateController.text,
                            'endDate': enddateController.text,
                          };
                          controller.AddProgramme(AddedProgramme);
                          // Get.back();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple),
                      child:
                          Text('إضافة', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                )),
          ),
        ));
  }
}
