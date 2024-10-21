import 'package:e_torismDemo/app/data/local/my_shared_pref.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LogoutController extends GetxController {
  var base = "http://etourismsvu.mooo.com/api/";

  void logout() async {
    final response = await delete(Uri.parse('${base}logout'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
    });
    print(response.body);
    Get.toNamed('/login');
  }

  @override
  void onInit() async {
    super.onInit();
  }
}
