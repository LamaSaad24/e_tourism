import 'dart:convert';

import 'package:e_torismDemo/app/data/local/my_shared_pref.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class TouristsController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<dynamic> tourists = [].obs;
  var base = "http://etourismsvu.mooo.com/api/";

  Future<RxList> getTouristsList() async {
    isLoading.value = true;
    try {
      var url = "${base}get-tourists";
      var res = await get(Uri.parse(url), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
      });
      var data = jsonDecode(res.body);
      // print(url);
      // print(data);
      // print(data.runtimeType);
      tourists.addAll(data);
      isLoading.value = false;
    } catch (e) {
      Logger().e(e);
    }
    return tourists;
  }

  void deleteTourist(int id) async {
    final response =
        await delete(Uri.parse('${base}delete-tourist/$id'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
    });

    // print(response.body);
    tourists.removeWhere((tour) => tour['id'] == id);
  }

  @override
  void onInit() {
    getTouristsList();
    super.onInit();
  }
}
