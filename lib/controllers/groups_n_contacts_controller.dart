import 'dart:convert';

import 'package:felpus/helpers/image_picker.dart';
import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/models/group_model.dart';
import 'package:felpus/models/pet_model.dart';
import 'package:felpus/services/api_service.dart';
import 'package:felpus/utils/App_Urls/app_urls.dart';
import 'package:felpus/utils/App_Utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer' as print;

class GroupsNContactsController extends GetxController {
  //TODO: Implement GroupsController

  static GroupsNContactsController get instance => Get.put(GroupsNContactsController());

  final count = 0.obs;

  bool isLoading = false;
  bool isGettingGroups = false;

  List<UserModel> contactsList = [];
  List<GroupModel> groupsList = [];

  List<UserModel> filteredContacts = [];
  List<String>selectedContacts = [];
  final TextEditingController searchController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    getGroupsRepo();
    getContactsRepo();
    filteredContacts = contactsList;
  }

  void filterContacts(String query) {
    if (query.isEmpty) {
      filteredContacts = contactsList;
    } else {
      filteredContacts = contactsList.where((contact) {
        return contact.fullName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    update(); // Update the UI
  }

  TextEditingController groupNameController = TextEditingController();
  String imagePath = '';

  ///<<<================= Create Group Repo ========================>>>
  Future<void> createGroupRepo() async {
    isLoading = true;
    update();

    Map<String, String> header = {
      'Authorization': PrefsHelper.token,
    };

    Map<String, String> body = {
      "groupName": groupNameController.text,
      "participants" : jsonEncode(selectedContacts)
    };

    imagePath = ImagePickerController.instance.selectedImagePath.value;
    var response = await ApiService.multipartRequest(
        url: AppUrls.createGroup,
        body: body,
        method: "POST",
        imageName: "photo",
        imagePath: imagePath,
        header: header
    );

    print.log("Create Lost Pet Response: ${response.message}, ${response.body}");

    if (response.statusCode == 200) {
      Get.back();
      Utils.snackBarSuccessMessage("Success:", response.message);
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }


  ///<<<=============== Get Contacts Repo ======================>>>
  Future getContactsRepo() async {
    contactsList.clear();
    isLoading = true;
    update();

    var response = await ApiService.getApi(AppUrls.users);

    if (response.statusCode == 200) {

      print.log("Get contacts response---------------------------->>>>");

      var data = jsonDecode(response.body)['data'];

      for (var item in data) {
        contactsList.add(UserModel.fromJson(item));
      }
      update();
    } else {
       Utils.snackBarErrorMessage(
          response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }

  ///<<<=============== Get Groups Repo ======================>>>
  Future getGroupsRepo() async {
    groupsList.clear();
    isGettingGroups = true;
    update();

    Map<String, String> header = {
      'Authorization': PrefsHelper.token,
    };

    var response = await ApiService.getApi(AppUrls.myGroups, header: header);

    if (response.statusCode == 200) {
      print.log("Get groups response---------------------------->>>>");
      var data = jsonDecode(response.body)['data'];

      for (var item in data) {
        groupsList.add(GroupModel.fromJson(item));
      }
      update();

    } else {
      Utils.snackBarErrorMessage(response.statusCode.toString(), response.message);
    }

    isGettingGroups = false;
    update();
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
