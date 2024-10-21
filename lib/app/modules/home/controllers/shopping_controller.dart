import 'dart:convert';

import 'package:e_torismDemo/app/data/local/my_shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class ShoppingController extends GetxController {
  late TabController tabController;
  RxInt selectedIndex = 0.obs;
  RxList<dynamic> tourItems = [].obs;

  var base = "http://etourismsvu.mooo.com/api/";

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  Future<void> fetchToursItems() async {
    var user = MySharedPref.getUser();
    var u = jsonDecode(user!);

    print(u);

    var url = "${base}my-tours/${u['tourist_id']}";

    try {
      var res = await get(Uri.parse(url), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
      });
      var data = jsonDecode(res.body);
      print(data);
      if (data['tours'] != null) tourItems.assignAll(data['tours']);
      print(tourItems);

      print(tourItems.isEmpty);
    } catch (e) {
      Logger().e('Error fetching cart items: $e');
    }
  }

  Future<void> fetchCartItems() async {
    // String userId = FirebaseAuth.instance.currentUser!.uid;
    // try {
    //   // final cartData = await FirebaseFirestore.instance
    //   //     .collection('user_carts')
    //   //     .doc(userId)
    //   //     .get();

    //   // final cartItemsData = cartData.data()?['cartItems'] ?? [];
    //   // cartItems.value = cartItemsData.map((itemData) => CartItem.fromMap(itemData)).toList();
    // } catch (e) {
    //   Logger().e('Error fetching cart items: $e');
    // }
  }

  // void removeCartItem(String product_name) {
  //   final indexToRemove =
  //       cartItems.indexWhere((item) => item.product_name == product_name);
  //
  //   if (indexToRemove != -1) {
  //     cartItems.removeAt(indexToRemove);
  //     updateFirestoreCart();
  //     CustomSnackBar.showCustomSnackBar(
  //       title: 'نجحت العملية',
  //       message: 'تمت ازالة المنتج من سلة الطلبات',
  //     );
  //   }
  // }
  //
  // void updateFirestoreCart() async {
  //   String userId = FirebaseAuth.instance.currentUser!.uid;
  //   final cartRef =
  //       FirebaseFirestore.instance.collection('user_carts').doc(userId);
  //   try {
  //     await cartRef.set({
  //       'cartItems': cartItems.map((item) => item.toMap()).toList(),
  //     });
  //   } catch (e) {
  //     Logger().e('Error updating cart in Firestore: $e');
  //   }
  // }

  @override
  void onInit() {
    fetchToursItems();
    super.onInit();
  }
}
