import 'dart:convert';

import 'package:felpus/models/chat_user_model.dart';
import 'package:felpus/services/api_service.dart';
import 'package:felpus/utils/App_Urls/app_urls.dart';
import 'package:felpus/utils/App_Utils/app_utils.dart';
import 'package:get/get.dart';
import 'dart:developer' as print;

class MessageController extends GetxController {
  //TODO: Implement MessageController

  static MessageController get instance => Get.put(MessageController());

  bool isLoading = false;
  List<ChatUserModel>chatUsersList = [];


    Future getChatUsers() async {
      chatUsersList.clear();
      isLoading = true;
      update();


      print.log("Get Chat Users response---------------------------->>>>");
      var response = await ApiService.getApi(AppUrls.chatUsers);

      if (response.statusCode == 200) {

        var responseData = jsonDecode(response.body)['data'];

        chatUsersList = (responseData as List).map((data) => ChatUserModel.fromJson(data)).toList();
        update();
      } else {
        Utils.snackBarErrorMessage(response.statusCode.toString(), response.message);
      }

      isLoading = false;
      update();
    }



  final count = 0.obs;
  @override
  void onInit() {
    getChatUsers();
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
