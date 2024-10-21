part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const REGISTER_CODE = _Paths.REGISTER_CODE;
  static const PRODUCT_DETAILS = _Paths.PRODUCT_DETAILS;
  static const PAYMENT = _Paths.PAYMENT;
  static const PAYMENT_CONFIRMATION = _Paths.PAYMENT_CONFIRMATION;
  static const NOTIFICATION = _Paths.NOTIFICATION;
  static const USER_PROFILE = _Paths.USER_PROFILE;

  static const ADMIN_ADD_PRODUCTS = _Paths.ADMIN_ADD_PRODUCTS;
  //user
  static const INITIAL = _Paths.INITIAL;
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const LOGOUT = _Paths.LOGOUT;
  static const REGISTER = _Paths.REGISTER;
  static const TOUR_DETAILS = _Paths.TOUR_DETAILS;
  static const AVAILABLE_PROGRAMME = _Paths.AVAILABLE_PROGRAMME;
  // Dashboard
  static const REPORT = _Paths.REPORT;
  static const HOME_DASH = _Paths.HOME_DASH;
  static const Guides = _Paths.Guides;
  static const EditGuides = _Paths.EditGuides;
  static const AddGuide = _Paths.AddGuide;

  static const Drivers = _Paths.Drivers;
  static const EditDrivers = _Paths.EditDrivers;
  static const AddDriver = _Paths.AddDriver;

  static const Programmes = _Paths.Programmes;
  static const EditProgrammes = _Paths.EditProgrammes;
  static const AddProgramme = _Paths.AddProgramme;

  static const Tours = _Paths.Tours;
  static const DETAILS_TOUR = _Paths.DETAILS_TOUR;
  static const EditTours = _Paths.EditTours;
  static const AddTour = _Paths.AddTour;

  static const Tourists = _Paths.Tourists;
  static const EditTourists = _Paths.EditTourists;
  static const AddTourist = _Paths.AddTourist;
}

abstract class _Paths {
  _Paths._();
  static const INITIAL = '/initial';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const LOGOUT = '/logout';
  static const REGISTER = '/register';
  static const REGISTER_CODE = '/register_code';
  static const PRODUCT_DETAILS = '/product_details';
  static const PAYMENT = '/payment';
  static const PAYMENT_CONFIRMATION = '/payment_confirmation';
  static const NOTIFICATION = '/notification';
  static const USER_PROFILE = '/user_profile';
  static const ADMIN_ADD_PRODUCTS = '/admin_add_product';
  //user
  static const TOUR_DETAILS = '/tour_details';
  static const AVAILABLE_PROGRAMME = '/available_programme';
  //dashboard
  static const REPORT = '/report';
  
  static const HOME_DASH = '/home_dash';
  static const Guides = '/guides';
  static const EditGuides = '/editGuide';
  static const AddGuide = "/addGuide";

  static const Drivers = '/drivers';
  static const EditDrivers = '/editDrivers';
  static const AddDriver = "/addDriver";

  static const Programmes = '/programmes';
  static const EditProgrammes = '/editProgrammes';
  static const AddProgramme = "/addProgramme";

  static const Tours = '/tours';
  static const DETAILS_TOUR = '/detailsTours';
  static const EditTours = '/editTours';
  static const AddTour = "/addTour";

  static const Tourists = '/tourists';
  static const EditTourists = '/editTourists';
  static const AddTourist = "/addTourist";
}
