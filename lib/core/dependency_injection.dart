
import 'package:get/get.dart';

import '../controllers/auth/forgot_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/menu_controller.dart';
import '../controllers/notifications_controller.dart';
import '../controllers/pet_details_controller.dart';


class DependencyInjection extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    // Get.lazyPut(() => PlayerHomeController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => NotificationsController(), fenix: true);
    Get.lazyPut(() => PetDetailsController(), fenix: true);
    Get.lazyPut(() => MenuDataController(), fenix: true);
    Get.lazyPut(() => ForgotController(), fenix: true);
  }
}