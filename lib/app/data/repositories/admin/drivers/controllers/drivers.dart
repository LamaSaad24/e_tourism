import 'dart:convert';

import 'package:e_torismDemo/app/data/local/my_shared_pref.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class DriversController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<dynamic> drivers = [].obs;
  var base = "http://etourismsvu.mooo.com/api/";

  Future<void> getDriversList() async {
    isLoading.value = true;
    try {
      var url = "${base}get-drivers";
      var res = await get(Uri.parse(url), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
      });
      var data = jsonDecode(res.body);
      // print(url);
      print(data);
      // print(data.runtimeType);
      drivers.assignAll(data);
      isLoading.value = false;
    } catch (e) {
      Logger().e(e);
    }
    // print(drivers);
  }

  Future<void> deleteDriver(int id) async {
    final response =
        await delete(Uri.parse('${base}delete-driver/$id'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
    });

    // print(response.body);
    drivers.removeWhere((tour) => tour['id'] == id);
  }

  @override
  void onInit() async {
    super.onInit();
    getDriversList();
  }
}
