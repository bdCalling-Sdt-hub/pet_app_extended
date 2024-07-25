import 'package:get/get.dart';

import '../controllers/more_resources_controller.dart';

class MoreResourcesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoreResourcesController>(
      () => MoreResourcesController(),
    );
  }
}
