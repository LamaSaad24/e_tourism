import 'dart:convert';

import 'package:e_torismDemo/app/data/local/my_shared_pref.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class AdminHomeController extends GetxController {
  RxBool isLoading = false.obs;
  List<dynamic> drivers = [];
  List<dynamic> guides = [];
  List<dynamic> programmes = [];
  var base = "http://etourismsvu.mooo.com/api/";

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
      // print('Failed to load drivers');
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
      // print('Failed to load programmes');
    }
    // print(response.body);
  }

  RxList<dynamic> tourists = [].obs;

  Future<RxList> getTouristsList() async {
    isLoading.value = true;
    try {
      var url = "${base}get-tourists";
      var res = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
      });
      var data = jsonDecode(res.body);
      // print(url);
      // print(data);
      // print(data.runtimeType);
      tourists.assignAll(data);
      isLoading.value = false;
    } catch (e) {
      Logger().e(e);
      // print(e);
    }
    return tourists;
  }

  RxList<dynamic> tours = [].obs;

  Future<RxList> getToursList() async {
    isLoading.value = true;
    try {
      var url = "${base}get-tours";
      var res = await http.get(Uri.parse(url));
      var data = jsonDecode(res.body);
      // print(data);
      tours.assignAll(data);
      isLoading.value = false;
    } catch (e) {
      Logger().e(e);
    }
    return tours;
  }

  @override
  void onInit() {
    super.onInit();
    fetchDrivers();
    fetchGuides();
    fetchProgrammes();
    getTouristsList();
    getToursList();
  }
}
