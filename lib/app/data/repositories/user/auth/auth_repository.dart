import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:e_torismDemo/app/components/custom_snackbar.dart';
import 'package:e_torismDemo/app/routes/app_pages.dart';
import 'package:e_torismDemo/config/translations/strings_enum.dart';

class AuthRepository {
  late TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer()
    ..onTap = navigateToRegisterScreen;

  String role = 'user';
  RxBool isLoading = false.obs;
  late String verifyId;

  void navigateToRegisterScreen() {
    Get.toNamed(AppPages.REGISTER);
  }

  void navigateToHomeScreen() {
    Get.offNamed(AppPages.HOME);
    CustomSnackBar.showCustomSnackBar(
      title: 'اهلا بك مجددا',
      message: 'تمت عملية تسجيل الدخول بنجاح',
    );
  }

  //**************************** Register Controller *************************//

  bool checkPassword(String password, String confirmPassword) {
    if (password == confirmPassword) {
      return true;
    }
    CustomSnackBar.showCustomErrorSnackBar(
      title: Strings.passwordDidNotMatch.tr,
      message: Strings.checkConfirmationPass.tr,
    );
    return false;
  }
}
