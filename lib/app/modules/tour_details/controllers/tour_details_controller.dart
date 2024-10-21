import 'dart:convert';

import 'package:e_torismDemo/app/data/local/my_shared_pref.dart';
import 'package:e_torismDemo/app/modules/home/controllers/shopping_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

class TourDetailsController extends GetxController {
  RxInt photoIndex = 0.obs;
  RxInt tourIndex = 0.obs;
  RxBool isFavourite = false.obs;
  RxBool isLoading = false.obs;

  var msg = ''.obs;

  RxList<dynamic> tours = [].obs;
  var base = "http://etourismsvu.mooo.com/api/";
  Map<String, dynamic> tour = Map<String, dynamic>();
  var tourId = ''.obs;

  void setTourId(String id) {
    tourId.value = id;
    getTourData();
    print("id" + id);
  }

  Future<void> getTourData() async {
    print(tourId);
    isLoading.value = true;
    try {
      var url = "${base}get-tour-detalis/${tourId}";

      var response = await get(Uri.parse(url));

      var data = jsonDecode(response.body);
      // print("this is here");
      // print(data['tour']);
      tour.assignAll(data['tour']);

      // print(tour);
    } catch (e) {
      Logger().e(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> applyTour() async {
    var url = "${base}apply-for-tour/${tourId}";
    var response = await post(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
    });

    // print(MySharedPref.getFcmToken());

    var data = jsonDecode(response.body);
    print(data);
    print(data['message']);
    msg.value = data['message'];
    print("msg is ${msg.value}");
    Get.find<ShoppingController>().fetchToursItems();
  }

  List<dynamic> drivers = [];
  List<dynamic> guides = [];
  List<dynamic> programmes = [];
  List<dynamic> status = [
    {"id": 'pending', "value": "بالانتظار"},
    {"id": 'open', "value": "مفتوحة"},
    {"id": 'colsed', "value": "مغلقة"},
  ];

  Future<void> fetchDrivers() async {
    var url = "${base}get-drivers";
    var response = await get(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
    });

    // print(MySharedPref.getFcmToken());

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // print("drivers is: ${data}");
      drivers.assignAll(data);
    } else {
      print('Failed to load drivers');
    }
  }

  Future<void> fetchGuides() async {
    var url = "${base}get-guides";
    var response = await get(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
    });

    // print(MySharedPref.getFcmToken());

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      guides.assignAll(data);
    } else {
      print('Failed to load ');
    }
    // print(response.body);
  }

  Future<void> fetchProgrammes() async {
    var url = "${base}get-programmes";
    var response = await get(Uri.parse(url), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer ${MySharedPref.getFcmToken().toString()}",
    });

    // print(MySharedPref.getFcmToken());

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      programmes.assignAll(data);
    } else {
      print('Failed to load programmes');
    }
    // print(response.body);
  }

  Future<dynamic> searchTours(String keyword) async {
    if (keyword.isNotEmpty) {
      // final QuerySnapshot query = await FirebaseFirestore.instance
      //     .collection('tours')
      //     .where('tour_name', isGreaterThanOrEqualTo: keyword)
      //     .where('tour_name', isLessThanOrEqualTo: keyword + '\uf8ff')
      //     .get();

      // searchedTours.value =
      // query.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
      // return searchedTours;
    } else {
      // searchedTours.clear();
    }
  }

  Future<RxList> getToursList() async {
    isLoading.value = true;
    try {
      var url = "${base}get-tours";
      var res = await get(Uri.parse(url));
      var data = jsonDecode(res.body);
      // print(data);
      tours.addAll(data);
      isLoading.value = false;
    } catch (e) {
      Logger().e(e);
    }
    return tours;
  }

  void changePage(int index) {
    photoIndex.value = index;
  }

  void selectFavouriteIndex(int index) {
    tourIndex.value = index;
    isFavourite.value = !isFavourite.value;
  }

  int getSelectedIndex() {
    return tourIndex.value;
  }

  fetchtour() async {
    // isLoading.value = true;
    // DocumentSnapshot? document = await gettourByName(selectedtour);
    // if (document != null) {
    //   tour = document.data();
    //   isLoading.value = false;
    // } else {
    //   Logger().e('Document not found');
    // }
  }

  void addtourToCart() async {
    // isLoading.value = true;
    // var userId = FirebaseAuth.instance.currentUser!.uid;
    // final cartRef =
    // FirebaseFirestore.instance.collection('user_carts').doc(userId);
    // if (tour != null) {
    //   cartRef.set(
    //     {
    //       'cartItems': FieldValue.arrayUnion([
    //         {
    //           'tour_name': tour['tour_name'],
    //           'tour_description': tour['tour_description'],
    //           'tour_price': tour['tour_price'],
    //           'tour_image': tour['tour_image'],
    //           'category_name': tour['category_name'],
    //           'is_favourite': false,
    //         }
    //       ])
    //     },
    //     SetOptions(
    //       merge: true,
    //     ),
    //   );
    //   isLoading.value = false;
    //   CustomSnackBar.showCustomSnackBar(
    //     title: 'تمت الاضافة بنجاح',
    //     message: 'تم اضافة هذا المنتج الى سلة الطلبات 😍',
    //   );
    //   Get.find<ShoppingController>().fetchCartItems();
    // } else {
    //   CustomSnackBar.showCustomErrorSnackBar(
    //     title: 'حدث خطأ ما',
    //     message: 'لم تنجح عملية الاضافة ، يرجى اعادة المحاولة 🙁',
    //   );
    // }
  }

  @override
  void onInit() async {
    // fetchDrivers();
    // fetchGuides();
    fetchProgrammes();
    if (Get.arguments != null) {
      final args = Get.arguments as Map<String, dynamic>;
      final id = args['id'];
      setTourId(id);
    }
    super.onInit();
  }
}
