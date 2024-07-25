import 'package:get/get.dart';

import '../controllers/lost_pets_controller.dart';

class LostPetsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LostPetsController>(
      () => LostPetsController(),
    );
  }
}
