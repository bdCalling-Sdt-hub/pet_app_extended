import 'dart:convert';
import 'package:get/get.dart';
import '../../../../models/notification_model.dart';
import '../services/api_service.dart';
import '../utils/App_Urls/app_urls.dart';
import '../utils/App_Utils/app_utils.dart';

class NotificationsController extends GetxController {
  //TODO: Implement NotificationsController

  final count = 0.obs;

  bool isLoading = false;

  List notifications = [];

  Future getFountPetRepo() async {
    isLoading = true;
    update();
    var response = await ApiService.getApi(AppUrls.notification);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      for (var item in data) {
        notifications.add(NotificationModel.fromJson(item));
      }
      update();
    } else {
      Utils.snackBarErrorMessage(
          response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }

  @override
  void onInit() {
    getFountPetRepo();
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
}
