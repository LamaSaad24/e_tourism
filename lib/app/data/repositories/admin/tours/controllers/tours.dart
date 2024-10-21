import 'dart:convert';

import 'package:e_torismDemo/app/data/local/my_shared_pref.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class ToursController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<dynamic> tours = [].obs;
  var base = "http://etourismsvu.mooo.com/api/";

  Future<RxList> getToursList() async {
    isLoading.value = true;
    try {
      var url = "${base}get-tours";
      var res = await get(Uri.parse(url));
      var data = jsonDecode(res.body);
      // print(data);
      tours.assignAll(data);
      isLoading.value = false;
    } catch (e) {
      Logger().e(e);
    }
    return tours;
  }

  void deleteTours(int id) async {
    final response =
        await delete(Uri.parse('${base}delete-tour/$id'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
    });

    print(response.body);
    tours.removeWhere((tour) => tour['id'] == id);
  }

  @override
  void onInit() {
    super.onInit();
    getToursList();
  }
}
