import 'dart:convert';

import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/models/chat_data_model.dart';
import 'package:felpus/models/chat_user_model.dart';
import 'package:felpus/services/api_service.dart';
import 'package:felpus/utils/App_Urls/app_urls.dart';
import 'package:felpus/utils/App_Utils/app_utils.dart';
import 'package:felpus/views/screens/message/message_view.dart';
import 'package:get/get.dart';
import 'dart:developer' as print;

class MessageController extends GetxController {
  //TODO: Implement MessageController

  static MessageController get instance => Get.put(MessageController());


  static String helpType = "";
  static String chatId = "";
  static String chatType = "";
  static String petId = "";
  String helpTypeTitle = "";

  List<ChatDataModel> chatDataList = [];
  bool isLoading = false;
  List<ChatUserModel>chatUsersList = [];


  ///===================== Get Chat Users ==============================

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

    ///=================== Create Message Repo ==========================

  final Map<String, String> helpTypeMapping = {
    'Lost Pets': 'lostPet',
    'Injured Pet': 'injuredPet',
    'Abused Pet': 'abusedPet',
    'Fire': 'fire',
    'Earthquake': 'earthquake',
    'Flood': 'flood',
  };

  void assignHelpType(String title) {
    MessageController.helpType = helpTypeMapping[title] ?? "";
  }

  void handleItemSelected(Map<String, String> item) {
    // Extract the title from the selected item
    String title = item['title']!;

    // Assign the correct helpType based on the title
    assignHelpType(title);

    // Now MessageController.helpType will be correctly assigned
    print.log(MessageController.helpType); // This will print the corresponding helpType
  }


// Function to get the title based on helpType
  String getTitleFromHelpType(String helpType) {
    // Reverse the map to get helpType as keys and title as values
    final Map<String, String> titleMapping = helpTypeMapping.map((key, value) => MapEntry(value, key));
    return titleMapping[helpType] ?? "Unknown";
  }

  Future createMessageRepo() async {
    isLoading = true;
    update();

    Map<String, String> header = {
      'Authorization': PrefsHelper.token,
      // 'Accept-Language': PrefsHelper.localizationLanguageCode,
    };

    Map<String, String> body = {
      "helpType": helpType,
      "chatType": chatType,
      "alertId": chatId,
      "petId": petId
    };

    var response = await ApiService.postApi(AppUrls.newMessage, body, header: header);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body)["data"];
      chatDataList = (responseData as List).map((data) => ChatDataModel.fromJson(data)).toList();
      update();

      helpTypeTitle = getTitleFromHelpType(helpType);
      Get.to(() => const MessageView());

      print.log("New message created for $helpTypeTitle");
    } else {
      Utils.snackBarErrorMessage(response.statusCode.toString(), response.message);
    }
    isLoading = false;
    update();
  }


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void increment() => count.value++;
  RxBool isStyle = false.obs;
  RxBool isInformation = true.obs;
}
