import 'package:felpus/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../modules/notifications/controllers/notifications_controller.dart';
import '../modules/pet_details/controllers/pet_details_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => NotificationsController(), fenix: true);
    Get.lazyPut(() => PetDetailsController(), fenix: true);
  }
}
