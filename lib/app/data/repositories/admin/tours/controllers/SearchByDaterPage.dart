import 'dart:convert';
import 'package:e_torismDemo/app/data/local/my_shared_pref.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class ReportDaterPageController extends GetxController {
  RxBool isLoading = false.obs;
  var base = "http://etourismsvu.mooo.com/api/";
  List<dynamic> programmes = [];
  String start = '';
  String end = '';

  void getSelected(s, e) {
    start = s;
    end = e;
    fetchProgrammes();
  }

  Future<void> fetchProgrammes() async {
    isLoading.value = true;
    var url = "${base}count-tour-drivers";

    final response = await post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
      },
      body: jsonEncode({'startDate': start, 'endDate': end}),
    );

    // print(url);
    print(response.body);

    // print(MySharedPref.getFcmToken());
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        programmes.assignAll(data['drivers']);
      } else {
        print('Failed to load available drivers');
      }
    } catch (e) {
      Logger().e(e);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    final args = Get.arguments as Map<String, dynamic>;
    final start = args['start'];
    final end = args['end'];
    print(start);
    print(end);
    getSelected(start, end);
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    programmes.assignAll([]);
    super.dispose();
  }
}
