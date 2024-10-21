import 'dart:convert';

import 'package:e_torismDemo/app/data/local/my_shared_pref.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_torismDemo/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer()
    ..onTap = navigateToRegisterScreen;

  var url = "http://etourismsvu.mooo.com/api/login";

  var msg = ''.obs;

  Future<void> signIn(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': email,
          'password': password,
        }),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // print('Login successful: $data');
        final String token = data['token'];
        final String user = jsonEncode(data['user']);

        await MySharedPref.setFcmToken(token);
        await MySharedPref.saveUser(user);

        // print(MySharedPref.getFcmToken());
        // print(MySharedPref.getUser());

        // print(data['user']['role']);

        if (data['role'] == "admin") {
          Get.toNamed(AppPages.HOME_DASH);
        } else {
          Get.toNamed(AppPages.HOME);
        }
      } else {
        print('Failed to login: ${response.statusCode} ${response.body}');
        msg.value = data['message'];
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  void navigateToRegisterScreen() {
    Get.toNamed(AppPages.REGISTER);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
