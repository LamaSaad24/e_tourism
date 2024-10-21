import 'dart:convert';
import 'package:e_torismDemo/app/data/local/my_shared_pref.dart';
import 'package:e_torismDemo/app/data/repositories/admin/tours/controllers/tours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class DetailsTourController extends GetxController {
  TextEditingController descController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController guiedController = TextEditingController();
  TextEditingController driverController = TextEditingController();
  TextEditingController programmeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController startdateController = TextEditingController();
  TextEditingController enddateController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  RxBool isLoading = false.obs;
  Map<String, dynamic> tour = Map<String, dynamic>();
  var msg = ''.obs;
  var tourId = ''.obs;
  var base = "http://etourismsvu.mooo.com/api/";

  void setTourId(String id) {
    tourId.value = id;
    getTourData();
    print("id is ${id}");
  }

  Future<void> getTourData() async {
    isLoading.value = true;
    try {
      var url = "${base}get-tour-detalis/${tourId}";

      var response = await http.get(Uri.parse(url));

      var data = jsonDecode(response.body);
      tour.assignAll(data['tour']);
      if (tour.isNotEmpty) {
        descController =
            TextEditingController(text: tour['description'].toString());
        statusController =
            TextEditingController(text: tour['status'].toString());
        guiedController =
            TextEditingController(text: tour['guide_id'].toString());
        driverController =
            TextEditingController(text: tour['driver_id'].toString());
        programmeController =
            TextEditingController(text: tour['programme_id'].toString());
        priceController = TextEditingController(text: tour['price'].toString());
        numberController =
            TextEditingController(text: tour['number'].toString());
        startdateController =
            TextEditingController(text: tour['startDate'].toString());
        enddateController =
            TextEditingController(text: tour['endDate'].toString());
      }
      tourId.value = '';
    } catch (e) {
      Logger().e(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  List<dynamic> drivers = [];
  List<dynamic> guides = [];
  List<dynamic> programmes = [];
  List<dynamic> status = [
    {"id": 'pending', "value": "بالانتظار"},
    {"id": 'open', "value": "مفتوحة"},
    {"id": 'closed', "value": "مغلقة"}
  ];

  Future<void> fetchDrivers() async {
    var url = "${base}get-drivers";
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
    });

    // print(MySharedPref.getFcmToken());

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      drivers.assignAll(data);
    } else {
      print('Failed to load drivers');
    }
  }

  Future<void> fetchGuides() async {
    var url = "${base}get-guides";
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
    });

    // print(MySharedPref.getFcmToken());

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      guides.assignAll(data);
    } else {
      print('Failed to load ');
    }
    // print("guieds id ${guides}");
  }

  Future<void> fetchProgrammes() async {
    var url = "${base}get-programmes";
    var response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
    });

    // print(MySharedPref.getFcmToken());

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      programmes.assignAll(data);
      // print("programmes is: ${programmes}");
    } else {
      print('Failed to load programmes');
    }
    // print(response.body);
  }

  Future<void> updateTour(Map<String, dynamic> tourData) async {
    // print(tourData);
    final res = await http.put(
      Uri.parse('${base}update-tour/${tourData['id']}'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
      },
      body: jsonEncode(<String, String>{
        'id': tourData['id'].toString(),
        'description': tourData['description'].toString(),
        'guide_id': tourData['guide_id'].toString(),
        'driver_id': tourData['driver_id'].toString(),
        'programme_id': tourData['programme_id'].toString(),
        'number': tourData['number'].toString(),
        'price': tourData['price'].toString(),
        'status': tourData['status'].toString(),
        'startDate': tourData['startDate'].toString(),
        'endDate': tourData['endDate'].toString()
      }),
    );
    print(res.body);

    final data = jsonDecode(res.body);
    // print(res.body);

    print(res.statusCode);
    if (res.statusCode == 200) {
      Get.find<ToursController>().getToursList();
      Get.toNamed('/tours');
      msg.value = '';
    } else {
      msg.value = data['message'];
    }
  }

  Future<void> AddTour(Map<String, dynamic> tourData) async {
    // print( tourData);
    final res = await http.post(
      Uri.parse('${base}add-tour'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
      },
      body: jsonEncode(<String, String>{
        'description': tourData['description'].toString(),
        'guide_id': tourData['guide_id'].toString(),
        'driver_id': tourData['driver_id'].toString(),
        'programme_id': tourData['programme_id'].toString(),
        'price': tourData['price'].toString(),
        'number': tourData['number'].toString(),
        'startDate': tourData['startDate'].toString(),
        'endDate': tourData['endDate'].toString(),
      }),
    );
    // print(res.body);
    final data = jsonDecode(res.body);
    // print(res.body);

    // print(res.statusCode);
    if (res.statusCode == 201) {
      Get.find<ToursController>().getToursList();
      fetchDrivers();
      fetchGuides();
      fetchProgrammes();
      Get.toNamed('/tours');
      msg.value = '';
    } else {
      msg.value = data['message'];
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchDrivers();
    fetchGuides();
    fetchProgrammes();

    if (Get.arguments != null) {
      final args = Get.arguments as Map<String, dynamic>;
      final id = args['id'];
      setTourId(id);
    }
  }
}
