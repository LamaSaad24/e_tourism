import 'dart:convert';
import 'package:e_torismDemo/app/data/local/my_shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  late List<dynamic> users;
  final formKey = GlobalKey<FormState>();
  final editController = TextEditingController();
  final tabIndex = 0.obs;
  RxString selectedTour = ''.obs;
  RxBool isLoading = false.obs;
  RxList<dynamic> searchedTours = RxList<dynamic>();
  RxList<dynamic> tours = [].obs;
  var base = "http://etourismsvu.mooo.com/api/";
  Map<String, dynamic> tour = Map<String, dynamic>();

  var tourId = ''.obs;

  void setTourId(String id) {
    tourId.value = id;
    getTourData();
    // print(id);
  }

  Future<void> getTourData() async {
    isLoading.value = true;
    try {
      var url = "${base}get-tour-details/${tourId}";

      var response = await get(Uri.parse(url));

      var data = jsonDecode(response.body);
      tour.assignAll(data);
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
    {"id": 'colsed', "value": "مغلقة"},
  ];

  Future<void> fetchDrivers() async {
    var url = "${base}get-drivers";
    var response = await get(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
    });

    // print(MySharedPref.getFcmToken());

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // print("drivers is: ${data}");
      drivers.assignAll(data);
    } else {
      print('Failed to load drivers');
    }
  }

  Future<void> fetchGuides() async {
    var url = "${base}get-guides";
    var response = await get(Uri.parse(url), headers: {
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
    // print(response.body);
  }

  Future<void> fetchProgrammes() async {
    var url = "${base}get-programmes";
    var response = await get(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
    });

    // print(MySharedPref.getFcmToken());

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      programmes.assignAll(data);
    } else {
      print('Failed to load programmes');
    }
    // print(response.body);
  }

  Future<RxList> getToursList() async {
    isLoading.value = true;
    try {
      var url = "${base}get-open-tours";
      var res = await get(Uri.parse(url));
      var data = jsonDecode(res.body);
      tours.assignAll(data);
      isLoading.value = false;
    } catch (e) {
      Logger().e(e);
    }
    return tours;
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void setFavouriteTour(String tour_name) {
    selectedTour.value = tour_name;
  }

  String changeTabTitle() {
    if (tabIndex.value == 0) {
      return 'الرئيسية';
    } else if (tabIndex.value == 1) {
      return 'الرحلات';
    } else if (tabIndex.value == 2) {
      return 'رحلاتي';
    }
    // else if (tabIndex.value == 3) {
    //   return 'البرامج المتاحة';
    // }
    return 'بدون عنوان';
  }

  Future<dynamic> searchTours(String keyword) async {
    var url = "${base}search-tours";
    // print(keyword);
    if (keyword.isNotEmpty) {
      final response = await post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'keyword': keyword,
          }));
      var data = jsonDecode(response.body);
      searchedTours.addAll(data['tours']);
      // tours = searchedTours;

      // print(searchedTours);

      return searchedTours;
    } else {
      searchedTours.clear();
    }
  }

  @override
  void onInit() {
    getToursList();
    super.onInit();
  }
}
