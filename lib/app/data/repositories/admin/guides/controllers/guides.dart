import 'dart:convert';

import 'package:e_torismDemo/app/data/local/my_shared_pref.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class GuidesController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<dynamic> guides = [].obs;
  var base = "http://etourismsvu.mooo.com/api/";

  Future<RxList> getGuidesList() async {
    isLoading.value = true;
    try {
      var url = "${base}get-guides";
      var res = await get(Uri.parse(url), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
      });
      var data = jsonDecode(res.body);
      // print(url);
      // print(data);
      // print(data.runtimeType);
      guides.assignAll(data);
      isLoading.value = false;
    } catch (e) {
      Logger().e(e);
    }
    return guides;
  }

  void deleteGuide(int id) async {
    final response =
        await delete(Uri.parse('${base}delete-guide/$id'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
    });

    print(response.body);
    guides.removeWhere((tour) => tour['id'] == id);
  }

  @override
  void onInit() {
    super.onInit();
    getGuidesList();
  }
}
