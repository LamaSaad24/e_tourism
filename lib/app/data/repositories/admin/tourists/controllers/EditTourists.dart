import 'dart:convert';
import 'package:e_torismDemo/app/data/local/my_shared_pref.dart';
import 'package:e_torismDemo/app/data/repositories/admin/tourists/controllers/tourists.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class EditTouristsController extends GetxController {
  RxBool isLoading = false.obs;
  Map<String, dynamic> tourist = Map<String, dynamic>();

  var touristId = ''.obs;
  var base = "http://etourismsvu.mooo.com/api/";

  void setTouristId(String id) {
    touristId.value = id;
    getTouristData();
    // print(id);
  }

  Future<void> getTouristData() async {
    isLoading.value = true;
    try {
      var url = "${base}get-tourist/${touristId}";
      // print(url);
      // print(touristId);

      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
        },
      );

      var data = jsonDecode(response.body);
      tourist.assignAll(data);
      // print(response.body);
    } catch (e) {
      Logger().e(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void updateTourist(Map<String, dynamic> touristData) async {
    // print(touristData);
    final res = await http.put(
      Uri.parse('${base}update-tourist/${touristData['id']}'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
      },
      body: jsonEncode(<String, String>{
        'id': touristData['id'].toString(),
        'fName': touristData['fName'],
        'lName': touristData['lName'],
        'address': touristData['address'],
        'mobile': touristData['mobile'],
        'description': touristData['description'],
      }),
    );
    // print(res.body);
    Get.find<TouristsController>().getTouristsList();
  }

  void AddTourist(Map<String, dynamic> touristData) async {
    // print(touristData);
    final res = await http.post(
      Uri.parse('${base}add-tourist'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
      },
      body: jsonEncode(<String, String>{
        'fName': touristData['fName'].toString(),
        'lName': touristData['lName'].toString(),
        'address': touristData['address'].toString(),
        'mobile': touristData['mobile'].toString(),
        'description': touristData['description'].toString(),
      }),
    );
    // print(res.body);
    Get.find<TouristsController>().getTouristsList();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
