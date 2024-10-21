import 'package:e_torismDemo/app/data/repositories/admin/programmes/controllers/EditProgramme.dart';
import 'package:e_torismDemo/app/data/repositories/admin/programmes/controllers/programmes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditProgrammeView extends GetView<EditProgrammeController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(' تعديل بيانات البرنامج'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          TextFormField(
                            controller: controller.typeController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                labelText: 'النوع '),
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
                            controller: controller.nameController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                labelText: 'اسم '),
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
                              controller: controller.descriptionController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0),
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
                            controller: controller.startdateController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                labelText: 'تاريخ البدء'),
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
                                controller.startdateController.text =
                                    formattedDate;
                              }
                            },
                          ),
                          SizedBox(height: 10.h),
                          TextFormField(
                            controller: controller.enddateController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                labelText: 'تاريح الانتهاء'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'هذا الحقل مطلوب';
                              } else if (DateTime.parse(value).isBefore(
                                  DateTime.parse(
                                      controller.startdateController.text))) {
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
                                controller.enddateController.text =
                                    formattedDate;
                              }
                            },
                          ),
                          SizedBox(height: 10),
                          Obx(() => Center(
                                  child: Text(
                                controller.msg.value,
                                style: TextStyle(
                                    fontSize: 19, color: Colors.blueAccent),
                              ))),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Map<String, dynamic> updatedProgrammes = {
                                  'id': controller.programme['id'],
                                  'type': controller.typeController.text,
                                  'name': controller.nameController.text,
                                  'description':
                                      controller.descriptionController.text,
                                  'startDate':
                                      controller.startdateController.text,
                                  'endDate': controller.enddateController.text,
                                };
                                controller.updateProgramme(updatedProgrammes);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple),
                            child: Text('تحديث',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    )));
          }
        }));
  }
}
