import 'dart:convert';
import 'package:e_torismDemo/app/data/local/my_shared_pref.dart';
import 'package:e_torismDemo/app/data/repositories/admin/drivers/controllers/drivers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class EditDriverController extends GetxController {
  RxBool isLoading = false.obs;
  Map<String, dynamic> driver = Map<String, dynamic>();

  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController plateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  var msg = ''.obs;
  var driverId = ''.obs;
  var base = "http://etourismsvu.mooo.com/api/";

  void setDriverId(String id) {
    driverId.value = id;
    getDriverData();
    // print(id);
  }

  Future<void> getDriverData() async {
    isLoading.value = true;
    try {
      var url = "${base}get-driver-detalis/${driverId}";
      // print(url);
      // print(driverId);

      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
        },
      );

      var data = jsonDecode(response.body);
      driver.assignAll(data['driver']);
      if (driver.isNotEmpty) {
        fNameController = TextEditingController(text: driver['fName']);
        lNameController = TextEditingController(text: driver['lName']);
        mobileController = TextEditingController(text: driver['phoneNumber']);
        plateController = TextEditingController(text: driver['plateNumber']);
        descriptionController =
            TextEditingController(text: driver['description']);
      }
      // print(response.body);
      driverId.value = '';
    } catch (e) {
      Logger().e(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateDrive(Map<String, dynamic> driverData) async {
    // print(driverData);
    final res = await http.put(
      Uri.parse('${base}update-driver/${driverData['id']}'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
      },
      body: jsonEncode(<String, String>{
        'id': driverData['id'].toString(),
        'fName': driverData['fName'].toString(),
        'lName': driverData['lName'].toString(),
        'plateNumber': driverData['plateNumber'].toString(),
        'phoneNumber': driverData['phoneNumber'].toString(),
        'description': driverData['description'].toString(),
      }),
    );
    final data = jsonDecode(res.body);
    print(res.body);

    // print(res.statusCode);
    if (res.statusCode == 201) {
      Get.find<DriversController>().getDriversList();
      msg.value = '';
      Get.toNamed('/drivers');
    } else {
      msg.value = data['message'];
    }
  }

  Future<void> AddDrive(Map<String, dynamic> driverData) async {
    // print(driverData);
    final res = await http.post(
      Uri.parse('${base}add-driver'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
      },
      body: jsonEncode(<String, String>{
        'fName': driverData['fName'].toString(),
        'lName': driverData['lName'].toString(),
        'plateNumber': driverData['plateNumber'].toString(),
        'phoneNumber': driverData['phoneNumber'].toString(),
        'description': driverData['description'].toString(),
      }),
    );
    final data = jsonDecode(res.body);
    // print(res.statusCode);
    // print(res.body);
    if (res.statusCode == 201) {
      Get.find<DriversController>().getDriversList();
      Get.toNamed('/drivers');
      msg.value = '';
    } else {
      msg.value = data['message'];
    }
  }

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      final args = Get.arguments as Map<String, dynamic>;
      final id = args['id'];
      setDriverId(id);
    }
  }
}
