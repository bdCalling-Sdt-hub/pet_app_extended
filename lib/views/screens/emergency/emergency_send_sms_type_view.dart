import 'package:felpus/controllers/groups_n_contacts_controller.dart';
import 'package:felpus/controllers/message_controller.dart';
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../message/select_pets_view.dart';

class EmergencySendSmsTypeView extends StatefulWidget {
  const EmergencySendSmsTypeView({super.key});

  @override
  State<EmergencySendSmsTypeView> createState() =>
      _EmergencySendSmsTypeViewState();
}

class _EmergencySendSmsTypeViewState extends State<EmergencySendSmsTypeView> {
  var selectedGroup = -1;
  var selectedContact = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
        ),
        body: GetBuilder<GroupsNContactsController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sh20,
                Center(
                    child: Text("Whom do you\n want to alert?".tr,
                        style: h1.copyWith(fontSize: 32),
                        textAlign: TextAlign.center)),
                sh30,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "My Groups".tr,
                    style:
                        h2.copyWith(fontSize: 20, color: AppColors.mainColor),
                  ),
                ),
                sh10,
                controller.isGettingGroups
                    ? const CustomLoader()
                    : controller.groupsList.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 32.0),
                            child: CustomText(text: "No groups found".tr),
                          )
                        : Flexible(
                            flex: 5,
                            child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: controller.groupsList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 8.w,
                                        mainAxisSpacing: 18.h,
                                        mainAxisExtent: 100.h),
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var groupsItems = controller.groupsList[index];
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedGroup = index;
                                              selectedContact = -1;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: selectedGroup == index
                                                    ? AppColors.mainColor
                                                    : AppColors.lowGray),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 10),
                                              child: Center(
                                                child: CustomText(
                                                  maxLines: 2,
                                                  text: groupsItems.groupName, color: selectedGroup ==
                                                    index
                                                    ? AppColors.white
                                                    : AppColors.black,)
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      sh5,
                                      selectedGroup == index
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    MessageController.chatUserId = groupsItems.id;
                                                    MessageController.chatType = "group";
                                                    Get.to(() => const SelectPetsView());
                                                  },
                                                  child: const CircleAvatar(
                                                    backgroundColor:
                                                        AppColors.green,
                                                    radius: 10,
                                                    child: Center(
                                                        child: Icon(Icons.check,
                                                            color:
                                                                AppColors.white,
                                                            size: 12)),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedGroup = -1;
                                                    });
                                                    debugPrint("Close");
                                                  },
                                                  child: const CircleAvatar(
                                                    backgroundColor:
                                                        AppColors.mainColor,
                                                    radius: 10,
                                                    child: Center(
                                                        child: Icon(Icons.close,
                                                            color:
                                                                AppColors.white,
                                                            size: 12)),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : const SizedBox(),
                                    ],
                                  );
                                }),
                          ),
                16.height,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "My Contacts".tr,
                    style:
                        h2.copyWith(fontSize: 20, color: AppColors.mainColor),
                  ),
                ),
                sh10,
                controller.isLoading
                    ? const CustomLoader()
                    : controller.contactsList.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32.0),
                            child: CustomText(text: "No contacts found".tr),
                          )
                        : Flexible(
                            flex: 10,
                            child: GridView.builder(
                                shrinkWrap: true,
                                itemCount: controller.contactsList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 8.w,
                                        mainAxisSpacing: 8.h,
                                        mainAxisExtent: 70.h),
                                itemBuilder: (context, index) {
                                  var contactItems =
                                      controller.contactsList[index];
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedContact = index;
                                              selectedGroup = -1;
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: selectedContact == index
                                                    ? AppColors.mainColor
                                                    : AppColors.lowGray),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 10),
                                              child: Center(
                                                child: CustomText(
                                                  maxLines: 2,
                                                  text: contactItems.fullName == ""
                                                    ? "No name".tr
                                                    : contactItems.fullName, color: selectedContact ==
                                                    index
                                                    ? AppColors.white
                                                    : AppColors.black,
                                                  fontSize: 14,
                                                )
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      sh5,
                                      selectedContact == index
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    MessageController.chatUserId = contactItems.id;
                                                    MessageController.chatType = "single";
                                                    Get.to(() => const SelectPetsView());
                                                  },
                                                  child: const CircleAvatar(
                                                    backgroundColor:
                                                        AppColors.green,
                                                    radius: 10,
                                                    child: Center(
                                                        child: Icon(Icons.check,
                                                            color:
                                                                AppColors.white,
                                                            size: 12)),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedContact = -1;
                                                    });
                                                    debugPrint('close');
                                                  },
                                                  child: const CircleAvatar(
                                                    backgroundColor:
                                                        AppColors.mainColor,
                                                    radius: 10,
                                                    child: Center(
                                                        child: Icon(Icons.close,
                                                            color:
                                                                AppColors.white,
                                                            size: 12)),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : const SizedBox(),
                                    ],
                                  );
                                }),
                          ),
              ],
            ),
          );
        }));
  }
}
