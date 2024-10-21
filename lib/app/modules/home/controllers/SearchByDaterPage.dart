import 'dart:convert';
import 'package:e_torismDemo/app/data/local/my_shared_pref.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class SearchByDaterPageController extends GetxController {
  RxBool isLoading = false.obs;
  var base = "http://etourismsvu.mooo.com/api/";
  List<dynamic> programmes = [];
  String selectedDate = '';
  var msg = ''.obs;

  void getSelected(String date) {
    selectedDate = date;
    print(selectedDate);
    fetchProgrammes();
  }

  Future<void> fetchProgrammes() async {
    isLoading.value = true;
    var url = "${base}available-programme";

    final response = await post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
      },
      body: jsonEncode({'date': selectedDate}),
    );
    print(selectedDate);
    var data = jsonDecode(response.body);

    print(MySharedPref.getFcmToken());
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        programmes.assignAll(data['programmes']);
      } else {
        print('Failed to load available programmes');
      }
    } catch (e) {
      Logger().e(e);
      msg.value = data['message'];
    } finally {
      isLoading.value = false;
      print(msg.value);
    }
  }

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    final selectedDate = args['id'];
    print("selectedDate is ${selectedDate}");
    getSelected(selectedDate);
  }
}
