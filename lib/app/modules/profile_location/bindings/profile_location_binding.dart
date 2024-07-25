import 'package:get/get.dart';

import '../controllers/profile_location_controller.dart';


class ProfileLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileLocationController>(
            () => ProfileLocationController()
    );
  }
}
