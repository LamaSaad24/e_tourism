import 'package:e_torismDemo/app/modules/logout/controller/logout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutView extends GetView<LogoutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تسجيل الخروج"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.logout(); // استدعاء عملية تسجيل الخروج
          },
          child:
              Text("تأكيد تسجيل الخروج", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
