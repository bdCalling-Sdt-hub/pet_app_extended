
import 'package:felpus/views/screens/adoption/adoption_view.dart';
import 'package:felpus/views/screens/adoption/all_adoption_pets_view.dart';
import 'package:felpus/views/screens/adoption/create_adoption_view.dart';
import 'package:felpus/views/screens/complete_profile/complete_profile_view.dart';
import 'package:felpus/views/screens/emergency/emergency_send_sms_type_view.dart';
import 'package:felpus/views/screens/emergency/emergency_view.dart';
import 'package:felpus/views/screens/menu/views/your_pet_view.dart';
import 'package:felpus/views/screens/reset_password/reset_password_view.dart';
import 'package:felpus/views/screens/splash/splash_view.dart';
import 'package:get/get.dart';

import '../views/screens/complete_profile/edit_profile_view.dart';
import '../views/screens/dashboard/dashboard_view.dart';

class AppRoutes{
  static const String splashView = "/splash_view.dart";

  static const String adoptionView = "/adoption_view.dart";
  static const String allAdoptionPetsView = "/all_adoption_pets_view.dart";
  static const String createAdoptionView = "/create_adoption_view.dart";
  static const String completeProfileView = "/complete_profile_view.dart";
  static const String editProfileView = "/edit_profile_view.dart";
  static const String dashboardView = "/dashboard_view.dart";
  static const String emergencySendSmsTypeView = "/emergency_send_sms_type_view.dart";
  static const String emergencyView = "/emergency_view.dart";
  static const String resetPasswordView = "/reset_password_view.dart";
  static const String yourPetView = "/your_pet_view.dart";

  static List<GetPage> routes = [
    GetPage(name: splashView, page: () => const SplashView()),

    GetPage(name: adoptionView, page: () => const AdoptionView()),
    GetPage(name: allAdoptionPetsView, page: () => AllAdoptionPetsView()),
    GetPage(name: createAdoptionView, page: () => const CreateAdoptionView()),
    GetPage(name: completeProfileView, page: () => CompleteProfileView()),
    GetPage(name: editProfileView, page: () => EditProfileView()),
    GetPage(name: dashboardView, page: () => DashboardView()),
    GetPage(name: emergencySendSmsTypeView, page: () => const EmergencySendSmsTypeView()),
    GetPage(name: emergencyView, page: () => EmergencyView()),
    GetPage(name: resetPasswordView, page: () => ResetPasswordView()),
    GetPage(name: yourPetView, page: () => YourPetView()),

  ];
}