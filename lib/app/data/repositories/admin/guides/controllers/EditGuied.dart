import 'dart:convert';
import 'package:e_torismDemo/app/data/local/my_shared_pref.dart';
import 'package:e_torismDemo/app/data/repositories/admin/guides/controllers/guides.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class EditGuiedController extends GetxController {
  RxBool isLoading = false.obs;
  Map<String, dynamic> guide = Map<String, dynamic>();

  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  var guideId = ''.obs;
  var base = "http://etourismsvu.mooo.com/api/";
  var msg = ''.obs;

  void setGuideId(String id) {
    guideId.value = id;
    getGuideData();
    print("id is ${id}");
  }

  Future<void> getGuideData() async {
    isLoading.value = true;
    try {
      var url = "${base}get-guide-detalis/${guideId}";
      // print(url);
      // print(guideId);

      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
        },
      );

      var data = jsonDecode(response.body);
      guide.assignAll(data['guide']);
      if (guide.isNotEmpty) {
        fNameController = TextEditingController(text: guide['fName']);
        lNameController = TextEditingController(text: guide['lName']);
        mobileController = TextEditingController(text: guide['mobile']);
        addressController = TextEditingController(text: guide['address']);
        descriptionController =
            TextEditingController(text: guide['description']);
      }
      // print(response.body);
      guideId.value = '';
    } catch (e) {
      Logger().e(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateGuide(Map<String, dynamic> guideData) async {
    print(guideData);
    final res = await http.put(
      Uri.parse('${base}update-guide/${guideData['id']}'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
      },
      body: jsonEncode(<String, String>{
        'id': guideData['id'].toString(),
        'fName': guideData['fName'].toString(),
        'lName': guideData['lName'].toString(),
        'address': guideData['address'].toString(),
        'mobile': guideData['mobile'].toString(),
        'description': guideData['description'].toString(),
      }),
    );
    final data = jsonDecode(res.body);
    // print(res.body);

    // print(res.statusCode);
    if (res.statusCode == 201) {
      Get.find<GuidesController>().getGuidesList();
      Get.toNamed('/guides');
      msg.value = '';
    } else {
      msg.value = data['message'];
    }
  }

  Future<void> AddGuide(Map<String, dynamic> guideData) async {
    print(guideData);
    final res = await http.post(
      Uri.parse('${base}add-guide'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
      },
      body: jsonEncode(<String, String>{
        'fName': guideData['fName'].toString(),
        'lName': guideData['lName'].toString(),
        'address': guideData['address'].toString(),
        'mobile': guideData['mobile'].toString(),
        'description': guideData['description'].toString(),
      }),
    );
    // print(res.body);
    final data = jsonDecode(res.body);
    // print(res.body);

    // print(res.statusCode);
    if (res.statusCode == 201) {
      Get.find<GuidesController>().getGuidesList();
      Get.toNamed('/guides');
      msg.value = '';
    } else {
      msg.value = data['message'];
    }
  }

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      final args = Get.arguments as Map<String, dynamic>;

      final id = args['id'];
      setGuideId(id);
    }
  }
}
