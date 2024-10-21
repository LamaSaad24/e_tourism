import 'dart:convert';
import 'package:e_torismDemo/app/data/local/my_shared_pref.dart';
import 'package:e_torismDemo/app/data/repositories/admin/programmes/controllers/programmes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class EditProgrammeController extends GetxController {
  RxBool isLoading = false.obs;
  Map<String, dynamic> programme = Map<String, dynamic>();

  TextEditingController typeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController startdateController = TextEditingController();
  TextEditingController enddateController = TextEditingController();
  var msg = ''.obs;
  var programmeId = ''.obs;
  var base = "http://etourismsvu.mooo.com/api/";

  void setProgrammeId(String id) {
    programmeId.value = id;
    getProgrammeData();
  }

  Future<void> getProgrammeData() async {
    isLoading.value = true;
    try {
      var url = "${base}get-programme-detalis/${programmeId}";
      // print(url);
      // print(programmeId);

      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
        },
      );

      var data = jsonDecode(response.body);
      programme.assignAll(data['programme']);
      if (programme.isNotEmpty) {
        typeController = TextEditingController(text: programme['type']);
        nameController = TextEditingController(text: programme['name']);
        descriptionController =
            TextEditingController(text: programme['description']);
        startdateController =
            TextEditingController(text: programme['startDate'].toString());
        enddateController =
            TextEditingController(text: programme['endDate'].toString());
      }
      programmeId.value = '';
      // print(response.body);
    } catch (e) {
      Logger().e(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateProgramme(Map<String, dynamic> programmeData) async {
    // print(programmeData);
    final res = await http.put(
      Uri.parse('${base}update-programme/${programmeData['id']}'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
      },
      body: jsonEncode(<String, String>{
        'id': programmeData['id'].toString(),
        'name': programmeData['name'].toString(),
        'type': programmeData['type'].toString(),
        'description': programmeData['description'].toString(),
        'startDate': programmeData['startDate'].toString(),
        'endDate': programmeData['endDate'].toString(),
      }),
    );

    final data = jsonDecode(res.body);
    // print(res.body);

    // print(res.statusCode);
    if (res.statusCode == 201) {
      Get.find<ProgrammesController>().getProgrammesList();
      Get.toNamed('/programmes');
      msg.value = '';
    } else {
      msg.value = data['message'];
    }
  }

  Future<void> AddProgramme(Map<String, dynamic> programmeData) async {
    // print(programmeData);
    final res = await http.post(
      Uri.parse('${base}add-programme'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
      },
      body: jsonEncode(<String, String>{
        'name': programmeData['name'].toString(),
        'type': programmeData['type'].toString(),
        'description': programmeData['description'].toString(),
        'startDate': programmeData['startDate'].toString(),
        'endDate': programmeData['endDate'].toString(),
      }),
    );
    // print(res.body);
    final data = jsonDecode(res.body);
    // print(res.body);

    // print(res.statusCode);
    if (res.statusCode == 201) {
      Get.find<ProgrammesController>().getProgrammesList();
      Get.toNamed('/programmes');
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
      setProgrammeId(id);
    }
  }
}
