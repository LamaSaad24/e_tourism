import 'dart:convert';

import 'package:e_torismDemo/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class RegisterController extends GetxController {
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  late TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer()
    ..onTap = navigateToRegisterScreen;

  var url = "http://etourismsvu.mooo.com/api/register";

  Future<void> register(String fname, String lname, String email,
      String password, String confirmp, String mobile) async {
    try {
      final response = await post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'fName': fname,
          'lName': lname,
          'phoneNumber': mobile,
          'email': email,
          'password': password,
          'password_confirmation': confirmp
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('register successful: $data');

        Get.toNamed(AppPages.LOGIN);
      } else {
        print('Failed to register: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }
  //
  // void navigateToRegisterScreen() {
  //   Get.toNamed(AppPages.REGISTER);
  // }

  // late final AuthRepository _authRepository = Get.find<AuthRepository>();
  //
  // void registerWithUsernameAndPassword(
  //   String fname,
  //     String lname,
  //     String email,
  //   String password,
  //   String confirmPassword,
  //   String mobile,
  // ) {
  //   _authRepository.registerWithUsernameAndPassword(
  //     fname,
  //     lname,
  //     email,
  //     password,
  //     confirmPassword,
  //     mobile,
  //   );
  // }

  void navigateToRegisterScreen() {
    Get.back();
  }
}
