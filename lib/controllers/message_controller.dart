import 'dart:convert';

import 'package:felpus/helpers/other_helper.dart';
import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/models/ChatMessageModel.dart';
import 'package:felpus/models/chat_data_model.dart';
import 'package:felpus/models/chat_user_model.dart';
import 'package:felpus/services/api_service.dart';
import 'package:felpus/services/socket_service.dart';
import 'package:felpus/utils/App_Urls/app_urls.dart';
import 'package:felpus/utils/App_Utils/app_utils.dart';
import 'package:felpus/utils/app_images/app_images.dart';
import 'package:felpus/views/screens/message/message_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer' as print;

import 'package:get/state_manager.dart';

class MessageController extends GetxController {
  //TODO: Implement MessageController

  static MessageController get instance => Get.put(MessageController());

  final count = 0.obs;
  @override
  void onInit() {
    searchController.addListener(_filterChatUsers);
    print.log("Mr. Chat ID Is Printing ===========  $chatId") ;
    super.onInit();
  }

  void increment() => count.value++;
  RxBool isStyle = false.obs;
  RxBool isInformation = true.obs;
  RxBool isPetSafe = false.obs;


  static String helpType = "";
  static String chatUserId = "";
  static String chatType = "";
  static String petId = "";
  String chatId = "";

  String helpTypeTitle = "";

  List<ChatMessageModel>chatItemsList = [];

  List<ChatDataModel> chatDataList = [];
  ChatInfo chatPersonInfo = ChatInfo.fromJson({});

  TextEditingController searchController = TextEditingController();
  TextEditingController sendMsgController = TextEditingController();

  bool isLoading = false;

  List<ChatUserModel>chatArchivedUsersList = [];
  RxList<ChatUserModel> chatActiveUsersList = <ChatUserModel>[].obs;
  RxList<ChatUserModel> filteredChatUsersList = <ChatUserModel>[].obs;

  final ScrollController scrollController = ScrollController();



  void _filterChatUsers() {
    String query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      filteredChatUsersList.value = chatActiveUsersList;
    } else {
      filteredChatUsersList.value = chatActiveUsersList.where((chatUser) {
        String name = chatUser.type == 'single'
            ? chatUser.partner.fullName.toLowerCase()
            : chatUser.groupName.toLowerCase();
        return name.contains(query);
      }).toList();
    }
  }

  @override
  void onClose() {
    searchController.removeListener(_filterChatUsers);
    searchController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  ///============================ Get Chat Users =============================

  bool isArchivedLoading = false;

    Future getChatUsers({required String status}) async {
      chatActiveUsersList.clear();
      if(status == "active"){
        isLoading = true;
        update();
      }else{
        isArchivedLoading = true;
        update();
      }


      print.log("Get Chat Users response---------------------------->>>>");
      var response = await ApiService.getApi("${AppUrls.chatUsers}?status=$status");

      if (response.statusCode == 200) {

        var responseData = jsonDecode(response.body)['data'];
        if(status == "active"){
          chatActiveUsersList.value = (responseData as List).map((data) => ChatUserModel.fromJson(data)).toList();
        }else{
          chatArchivedUsersList = (responseData as List).map((data) => ChatUserModel.fromJson(data)).toList();
        }

        update();
      } else {
        Utils.snackBarErrorMessage(response.statusCode.toString(), response.message);
      }

      isArchivedLoading = false;
      update();
      isLoading = false;
      update();
    }


  final Map<String, String> helpTypeMapping = {
    'Lost Pets': 'lostPet',
    'Injured Pet': 'injuredPet',
    'Abused Pet': 'abusedPet',
    'Fire': 'fire',
    'Earthquake': 'earthquake',
    'Flood': 'flood',
  };

  final Map<String, String> helpTypeIcons = {
    'lostPet' : AppImages.lostPets,
    'injuredPet' :  AppImages.injuredPet,
    'abusedPet' : AppImages.abusedPet,
    'fire' : AppImages.fire,
    'earthquake' : AppImages.earthquake,
    'flood' : AppImages.flood,
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

  ///=================== Create or Get Message Repo ==========================

  Future createOrGetMessageRepo({bool isNewMsg = false, required String chatId}) async {
    isLoading = true;
    update();

    Map<String, String> header = {
      'Authorization': PrefsHelper.token,
      // 'Accept-Language': PrefsHelper.localizationLanguageCode,
    };

    print.log("===>>> $helpType, $chatType, $chatUserId, $petId");
    Map<String, String> body = {};
    if(isNewMsg){
     body = {
        "helpType": helpType,
        "chatType": chatType,
        "alertId": chatUserId,
        "petId": petId
      };

    }

    var response = isNewMsg ? await ApiService.postApi(AppUrls.newMessage, body, header: header) : await ApiService.getApi("${AppUrls.messages}/$chatId", header: header);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body)["data"]["allMessage"];
      chatDataList = (responseData as List).map((data) => ChatDataModel.fromJson(data)).toList();

      if(chatDataList.isNotEmpty){
        chatId = chatDataList[0].chat;
        print.log("ChatId: ===== $chatId");
      }
      chatItemsList = chatDataList.map((chatData) {
        chatId = chatData.chat;
        return ChatMessageModel(
          // map the fields from chatData to ChatMessageModel fields
          chatId: chatId,
          time: OtherHelper.formatTime(chatData.createdAt),
          helpType: chatData.helpType,
          text: chatData.text,
          pet: chatData.pet,
          sender: chatData.sender,
          // add any other required fields
        );
      }).toList();

      final Map<String, dynamic> data = jsonDecode(response.body)["data"];

      // Ensure that chatInfo is a Map<String, dynamic>
      if (data["chatInfo"] is Map<String, dynamic>) {
        chatPersonInfo = ChatInfo.fromJson(data["chatInfo"]);
      } else {
        // Handle the case where chatInfo is not a map (if needed)
        chatPersonInfo = ChatInfo(); // Default instance or other logic
      }
      update();
      listenMessage();
      print.log("Mr. Chat ID Is Printing ===========  $chatId") ;
      helpTypeTitle = getTitleFromHelpType(helpType);
      Get.to(() => MessageView());

      print.log("New message created for $helpTypeTitle");
    } else {
      Utils.snackBarErrorMessage(response.statusCode.toString(), response.message);
    }
    isLoading = false;
    update();
  }

  ///=================== Send Message Repo ==================================

  Future sendMessageRepo() async {
    isLoading = true;
    update();

    Map<String, String> header = {
      'Authorization': PrefsHelper.token,
      // 'Accept-Language': PrefsHelper.localizationLanguageCode,
    };

    Map<String, String> body = {
      "text": sendMsgController.text.isNotEmpty? sendMsgController.text : "safe",
    };

   if(sendMsgController.text.isNotEmpty){
     chatItemsList.add(
         ChatMessageModel(
           chatId: chatId,
           time: OtherHelper.formatTime(DateTime.now().toLocal().toString()),
           text: sendMsgController.text,
         )
     );
     update();
   }
    var response = await ApiService.postApi("${AppUrls.messages}/$chatId", body, header: header) ;

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body)["data"];

       var singleChatData = ChatDataModel.fromJson(responseData);

      // chatDataList.add(singleChatData);
      update();
      sendMsgController.clear();
      print.log("Message sent successfully");
    } else {
      Utils.snackBarErrorMessage(response.statusCode.toString(), response.message);
    }
    isLoading = false;
    update();
  }

  // addNewMessage() async {
  //   isMessage = true;
  //   update();
  //
  //   chatDataList.insert(
  //       0,
  //       ChatMessage(
  //           text: sendMsgController.text,
  //           time: DateTime.now(),
  //           isSentByMe: true)
  //
  //     // ChatMessageModel(
  //     //     currentTime.format(context).toString(),
  //     //     controller.messageController.text,
  //     //     true),
  //   );
  //
  //   isMessage = false;
  //   update();
  //
  //   var body = {
  //     "chat": chatId,
  //     "message":  sendMsgController.text,
  //     "sender": PrefsHelper.userId
  //   };
  //
  //   sendMsgController.clear();
  //
  //   SocketServices.socket.emitWithAck("add-new-message", body, ack: (data) {
  //     if (kDebugMode) {
  //       print(
  //           "===============================================================> Received acknowledgment: $data");
  //     }
  //   });
  // }

  listenMessage() async {
    SocketServices.socket.on("user-message::$chatId", (data) {
      isLoading = true;
      update();

      var singleChatData = ChatDataModel.fromJson(data);

      print.log("chatItemsList.last.text : ${chatItemsList[chatItemsList.length-1].text}");
      print.log("singleChatData.text : ${singleChatData.text}");

        if(singleChatData.sender.id != PrefsHelper.userId || singleChatData.text == "safe"){
          if(chatItemsList.last.text != singleChatData.text || singleChatData.text == "safe"){
            chatItemsList.add(
                ChatMessageModel(
                  chatId: singleChatData.chat,
                  time: OtherHelper.formatTime(singleChatData.createdAt),
                  text: singleChatData.text,
                  pet: singleChatData.pet,
                  sender: singleChatData.sender,
                )
            );
            update();
          }
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollToBottom();
      });
      isLoading = false;
      update();
    });
  }

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

}
