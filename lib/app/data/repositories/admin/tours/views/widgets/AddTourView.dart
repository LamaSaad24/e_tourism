import 'package:e_torismDemo/app/data/repositories/admin/tours/controllers/DetailsTour.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTourView extends GetView<DetailsTourController> {
  final _formKey = GlobalKey<FormState>();

  final descController = TextEditingController();
  final statusController = TextEditingController();
  final guiedController = TextEditingController();
  final driverController = TextEditingController();
  final programmeController = TextEditingController();
  final priceController = TextEditingController();
  final startdateController = TextEditingController();
  final enddateController = TextEditingController();
  final numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('إضافة رحلة'),
          backgroundColor: Colors.deepPurple,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 10.h),
                          TextFormField(
                            controller: descController,
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
                            },
                          ),
                          SizedBox(height: 10.h),
                          DropdownButtonFormField<String>(
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
                              labelText: ' السائق',
                            ),
                            value: null,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'هذا الحقل مطلوب';
                              }
                              return null;
                            },
                            isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: controller.drivers
                                .map<DropdownMenuItem<String>>((driver) {
                              return DropdownMenuItem<String>(
                                value: driver['id'].toString(), // ID السائق
                                child: Text(driver['fName']), // اسم السائق
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              driverController.text = newValue.toString();
                              // print("Selected Driver ID: $driverController");
                            },
                          ),
                          SizedBox(height: 10.h),
                          DropdownButtonFormField<String>(
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
                              labelText: ' الدليل',
                            ),
                            value: null,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'هذا الحقل مطلوب';
                              }
                              return null;
                            },
                            isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: controller.guides
                                .map<DropdownMenuItem<String>>((g) {
                              return DropdownMenuItem<String>(
                                value: g['id'].toString(), // ID
                                child: Text(g['fName']), // اسم
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              guiedController.text = newValue.toString();
                            },
                          ),
                          SizedBox(height: 10.h),
                          DropdownButtonFormField<String>(
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
                              labelText: ' البرنامج',
                            ),
                            value: null,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'هذا الحقل مطلوب';
                              }
                              return null;
                            },
                            isExpanded: true,
                            icon: Icon(Icons.arrow_drop_down_outlined),
                            items: controller.programmes
                                .map<DropdownMenuItem<String>>((p) {
                              return DropdownMenuItem<String>(
                                value: p['id'].toString(), // ID
                                child: Text(p['type']), // اسم
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              programmeController.text = newValue.toString();
                            },
                          ),
                          SizedBox(height: 10.h),
                          TextFormField(
                            controller: numberController,
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
                                labelText: 'عدد السياح'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'هذا الحقل مطلوب';
                              } else if (value.length < 1) {
                                return ' بجب ان يكون أكبر من 1 محارف';
                              } else if (value.length > 100) {
                                return ' بجب ان يكون أقل من 100 محارف';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10.h),
                          TextFormField(
                            controller: priceController,
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
                                labelText: 'السعر'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'هذا الحقل مطلوب';
                              } else if (value.length > 9999.99) {
                                return ' بجب ان يكون أقل من 9999.99 محارف';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: startdateController,
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
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
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
                                style: TextStyle(
                                    fontSize: 19, color: Colors.blueAccent),
                              ))),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Map<String, dynamic> AddedTour = {
                                  'description': descController.text,
                                  'guide_id': guiedController.text,
                                  'driver_id': driverController.text,
                                  'programme_id': programmeController.text,
                                  'number': numberController.text,
                                  'price': priceController.text,
                                  // 'status': statusController.text,
                                  'startDate': startdateController.text,
                                  'endDate': enddateController.text,
                                };
                                controller.AddTour(AddedTour);
                                // Get.back();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple),
                            child: Text('إضافة',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      )),
                ))));
  }
}
