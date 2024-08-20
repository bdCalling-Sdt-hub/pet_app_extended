
import 'package:felpus/views/screens/adoption/adoption_view.dart';
import 'package:felpus/views/screens/adoption/all_adoption_pets_view.dart';
import 'package:felpus/views/screens/adoption/create_adoption_view.dart';
import 'package:get/get.dart';

class AppRoutes{
  static const String splashScreen = "/splash_screen.dart";

  static const String adoptionView = "/adoption_view.dart";
  static const String allAdoptionPetsView = "/all_adoption_pets_view.dart";
  static const String createAdoptionView = "/create_adoption_view.dart";

  static List<GetPage> routes = [
    GetPage(name: adoptionView, page: () => const AdoptionView()),
    GetPage(name: allAdoptionPetsView, page: () => const AllAdoptionPetsView()),
    GetPage(name: createAdoptionView, page: () => const CreateAdoptionView()),
    // GetPage(name: splashScreen, page: () => SplashScreen()),
  ];
}