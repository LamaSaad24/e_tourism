import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:e_torismDemo/app/modules/login/views/widgets/auth_background.dart';
import 'package:e_torismDemo/app/modules/register/controllers/register_controller.dart';
import 'package:e_torismDemo/config/translations/strings_enum.dart';

class RegisterView extends GetView<RegisterController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            AuthBackground(title: Strings.register.tr),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: TextFormField(
                controller: controller.fnameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "الاسم الأول",
                  hintText: "test",
                  hintStyle: TextStyle(color: Colors.black26),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black26,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 1.5,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  } else if (value.length < 5) {
                    return ' بجب ان يحتوي أكثر من 5 محارف';
                  } else if (value.length > 50) {
                    return ' بجب ان يكون أقل من 50 محارف';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: TextFormField(
                controller: controller.lnameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "الاسم الأخير",
                  hintText: "test",
                  hintStyle: TextStyle(color: Colors.black26),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black26,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 1.5,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  } else if (value.length < 5) {
                    return ' بجب ان يحتوي أكثر من 5 محارف';
                  } else if (value.length > 50) {
                    return ' بجب ان يكون أقل من 50 محارف';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: Strings.email.tr,
                  hintText: "example@gmail.com",
                  hintStyle: TextStyle(color: Colors.black26),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black26,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 1.5,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال البريد الإلكتروني';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'البريد الإلكتروني غير صالح';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: TextFormField(
                controller: controller.mobileController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: " رقم الهاتف",
                  hintText: "0995214735",
                  hintStyle: TextStyle(color: Colors.black26),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black26,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 1.5,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  } else if (value.length < 10) {
                    return ' بجب ان يحتوي أكثر من 10 محارف';
                  } else if (value.length > 15) {
                    return ' بجب ان يكون أقل من 15 محارف';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: TextFormField(
                controller: controller.passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "  كلمة السر",
                  hintText: "123456",
                  hintStyle: TextStyle(color: Colors.black26),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black26,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 1.5,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  } else if (value.length < 6) {
                    return ' بجب ان يحتوي أكثر من 6 محارف';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: TextFormField(
                controller: controller.confirmPasswordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "  تأكيد كلمة السر",
                  hintText: "123456",
                  hintStyle: TextStyle(color: Colors.black26),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black26,
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 1.5,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  } else if (value.length < 6) {
                    return ' بجب ان يحتوي أكثر من 6 محارف';
                  } else if (controller.passwordController.text !=
                      controller.confirmPasswordController.text) {
                    return 'كلمة السر وتأكيد غير متطابقين';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(340.h, 50.w),
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.register(
                    controller.fnameController.text,
                    controller.lnameController.text,
                    controller.emailController.text,
                    controller.passwordController.text,
                    controller.confirmPasswordController.text,
                    controller.mobileController.text,
                  );
                }
              },
              child: Text(Strings.register.tr,
                  style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: Strings.haveAccount.tr,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                    recognizer: controller.tapGestureRecognizer,
                    text: Strings.login.tr,
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
