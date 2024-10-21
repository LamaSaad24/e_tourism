import 'package:e_torismDemo/app/data/repositories/admin/drivers/bindings/EditDriver.dart';
import 'package:e_torismDemo/app/data/repositories/admin/drivers/bindings/drivers.dart';
import 'package:e_torismDemo/app/data/repositories/admin/drivers/views/drivers.view.dart';
import 'package:e_torismDemo/app/data/repositories/admin/drivers/views/widgets/AddDriverView.dart';
import 'package:e_torismDemo/app/data/repositories/admin/drivers/views/widgets/EditDriverView.dart';
import 'package:e_torismDemo/app/data/repositories/admin/guides/bindings/EditGuide.dart';
import 'package:e_torismDemo/app/data/repositories/admin/guides/bindings/guides.dart';
import 'package:e_torismDemo/app/data/repositories/admin/guides/views/guides.view.dart';
import 'package:e_torismDemo/app/data/repositories/admin/guides/views/widgets/AddGuideView.dart';
import 'package:e_torismDemo/app/data/repositories/admin/guides/views/widgets/EditGuideView.dart';
import 'package:e_torismDemo/app/data/repositories/admin/home/bindings/admin_home.bindings.dart';
import 'package:e_torismDemo/app/data/repositories/admin/home/views/admin_home.view.dart';
import 'package:e_torismDemo/app/data/repositories/admin/programmes/bindings/EditProgramme.dart';
import 'package:e_torismDemo/app/data/repositories/admin/programmes/bindings/programmes.dart';
import 'package:e_torismDemo/app/data/repositories/admin/programmes/views/programmes.dart';
import 'package:e_torismDemo/app/data/repositories/admin/programmes/views/widgets/AddProgrammeView.dart';
import 'package:e_torismDemo/app/data/repositories/admin/programmes/views/widgets/EditProgrammeView.dart';
import 'package:e_torismDemo/app/data/repositories/admin/tourists/bindings/EditTourists.dart';
import 'package:e_torismDemo/app/data/repositories/admin/tourists/bindings/tourists.dart';
import 'package:e_torismDemo/app/data/repositories/admin/tourists/views/tourists.dart';
import 'package:e_torismDemo/app/data/repositories/admin/tourists/views/widgets/AddTouristsView.dart';
import 'package:e_torismDemo/app/data/repositories/admin/tourists/views/widgets/EditTouristView.dart';
import 'package:e_torismDemo/app/data/repositories/admin/tours/bindings/DetailsTour.dart';
import 'package:e_torismDemo/app/data/repositories/admin/tours/bindings/ReportDaterPage.dart';
import 'package:e_torismDemo/app/data/repositories/admin/tours/bindings/tours.dart';
import 'package:e_torismDemo/app/data/repositories/admin/tours/views/tours.dart';
import 'package:e_torismDemo/app/data/repositories/admin/tours/views/widgets/AddTourView.dart';
import 'package:e_torismDemo/app/data/repositories/admin/tours/views/widgets/DetailsTourView.dart';
import 'package:e_torismDemo/app/data/repositories/admin/tours/views/widgets/EditTourView.dart';
import 'package:e_torismDemo/app/data/repositories/admin/tours/views/widgets/ReportDaterPage.dart';
import 'package:e_torismDemo/app/modules/home/bindings/search_binding.dart';
import 'package:e_torismDemo/app/modules/home/views/widgets/SearchByDaterPage.dart';
import 'package:e_torismDemo/app/modules/logout/binding/logout.dart';
import 'package:e_torismDemo/app/modules/logout/view/logout.dart';
import 'package:e_torismDemo/app/modules/tour_details/bindings/tour_details_binding.dart';
import 'package:e_torismDemo/app/modules/tour_details/views/tour_details_view.dart';
import 'package:get/get.dart';
import 'package:e_torismDemo/app/modules/home/views/main_view.dart';
import 'package:e_torismDemo/app/modules/login/bindings/login_binding.dart';
import 'package:e_torismDemo/app/modules/login/views/login_view.dart';
import 'package:e_torismDemo/app/modules/register/bindings/register_binding.dart';
import 'package:e_torismDemo/app/modules/register/views/register_view.dart';
import '../modules/home/bindings/home_binding.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.INITIAL;
  // dashboard
  static const INITIAL = Routes.LOGIN;
  static const HOME_DASH = Routes.HOME_DASH;
  static const guides = Routes.Guides;
  static const edit_guides = Routes.EditGuides;
  static const add_guide = Routes.AddGuide;

  static const drivers = Routes.Drivers;
  static const edit_drivers = Routes.EditDrivers;

  static const programmes = Routes.Programmes;
  static const edit_programmes = Routes.EditProgrammes;
  static const add_programme = Routes.AddProgramme;

  static const tours = Routes.Tours;
  static const DETAILS_TOUR = Routes.DETAILS_TOUR;
  static const edit_tours = Routes.EditTours;
  static const add_tour = Routes.AddTour;

  static const tourists = Routes.Tourists;
  static const edit_tourists = Routes.EditTourists;
  static const add_tourist = Routes.AddTourist;

  static const AVAILABLE_PROGRAMME = Routes.AVAILABLE_PROGRAMME;

  static const REPORT = Routes.REPORT;

  //users
  static const HOME = Routes.HOME;
  static const LOGIN = Routes.LOGIN;
  static const REGISTER = Routes.REGISTER;
  static const REGISTER_CODE = Routes.REGISTER_CODE;
  static const PRODUCT_DETAILS = Routes.PRODUCT_DETAILS;
  static const TOUR_DETAILS = Routes.TOUR_DETAILS;
  static const PAYMENT = Routes.PAYMENT;
  static const PAYMENT_CONFIRMATION = Routes.PAYMENT_CONFIRMATION;
  static const NOTIFICATION = Routes.NOTIFICATION;
  static const USER_PROFILE = Routes.USER_PROFILE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    //dashboard
    GetPage(
      name: _Paths.HOME_DASH,
      page: () => AdminHomeView(),
      binding: AdminHomeBindings(),
    ),
    GetPage(
      name: _Paths.Guides,
      page: () => GuidesView(),
      binding: GuidesBindings(),
    ),
    GetPage(
      name: _Paths.EditGuides,
      page: () => EditGuideView(),
      binding: EditGuideBindings(),
    ),
    GetPage(
      name: _Paths.AddGuide,
      page: () => AddGuideView(),
      binding: EditGuideBindings(),
    ),
    GetPage(
      name: _Paths.Drivers,
      page: () => DriversView(),
      binding: DriversBindings(),
    ),
    GetPage(
      name: _Paths.EditDrivers,
      page: () => EditDriverView(),
      binding: EditDriverBindings(),
    ),
    GetPage(
      name: _Paths.AddDriver,
      page: () => AddDriverView(),
      binding: EditDriverBindings(),
    ),
    GetPage(
      name: _Paths.Programmes,
      page: () => ProgrammesView(),
      binding: ProgrammesBindings(),
    ),
    GetPage(
      name: _Paths.EditProgrammes,
      page: () => EditProgrammeView(),
      binding: EditProgrammeBindings(),
    ),
    GetPage(
      name: _Paths.AddProgramme,
      page: () => AddProgrammeView(),
      binding: EditProgrammeBindings(),
    ),
    GetPage(
      name: _Paths.Tours,
      page: () => ToursView(),
      binding: ToursBindings(),
    ),
    GetPage(
        name: _Paths.DETAILS_TOUR,
        page: () => DetailsTourView(),
        binding: DetailsTourBindings()),
    GetPage(
        name: _Paths.EditTours,
        page: () => EditTourView(),
        binding: DetailsTourBindings()),
    GetPage(
      name: _Paths.AddTour,
      page: () => AddTourView(),
      binding: DetailsTourBindings(),
    ),
    GetPage(
      name: _Paths.Tourists,
      page: () => TouristsView(),
      binding: TouristsBindings(),
    ),
    GetPage(
      name: _Paths.EditTourists,
      page: () => EditTouristsView(),
      binding: EditTouristsBindings(),
    ),
    GetPage(
      name: _Paths.AddTourist,
      page: () => AddTouristsView(),
      binding: EditTouristsBindings(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => ReportDaterPage(),
      binding: ReportDaterPageBindings(),
    ),
    //users
    GetPage(
      name: _Paths.AVAILABLE_PROGRAMME,
      page: () => SearchByDaterPage(),
      binding: SearchBindings(),
    ),
    GetPage(
      name: _Paths.TOUR_DETAILS,
      page: () => TourDetailsView(),
      binding: TourDetailsBinding(),
    ),
    //
    //
    GetPage(
      name: _Paths.LOGOUT,
      page: () => LogoutView(),
      binding: LogoutBinding(),
    ),
  ];
}
