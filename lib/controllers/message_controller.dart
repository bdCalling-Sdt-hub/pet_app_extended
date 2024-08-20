import 'package:get/get.dart';

class MessageController extends GetxController {
  //TODO: Implement MessageController

  static MessageController get instance => Get.put(MessageController());

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  RxBool isStyle = false.obs;
  RxBool isInformation = true.obs;
}
