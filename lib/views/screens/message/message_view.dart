import 'package:felpus/extensions/extension.dart';
import 'package:felpus/helpers/other_helper.dart';
import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/models/chat_data_model.dart';
import 'package:felpus/utils/App_Utils/app_utils.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../controllers/message_controller.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../resources/resources_view.dart';

class MessageView extends GetView<MessageController> {
  MessageView({super.key});

  String chatId = "";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CustomImage(
                    imageSrc: controller.chatPersonInfo.photo,
                    imageType: ImageType.network,
                    height: 40,
                    width: 40,
                  ),
                ),
                sw10,
                Text(
                  controller.chatPersonInfo.name,
                  style: h2.copyWith(fontSize: 20, color: AppColors.black),
                ),
              ],
            ),
            centerTitle: true,
            leading: InkWell(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios)),
          ),
          body: Stack(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: ListView.builder(
                          itemCount: controller.chatDataList.length,
                          itemBuilder: (context, index) {
                            var chatDataItems = controller.chatDataList[index];

                            chatId = chatDataItems.chat;
                            print(chatDataItems.helpType);
                            return chatItems(chatDataItems, controller);
                          },
                        ),
                      ),
                    ),
                    100.height
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.white,
                  // Background color for the bottom container
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: AppColors.light),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 6),
                                child: TextField(
                                  controller: controller.sendMsgController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle:
                                        h3.copyWith(color: AppColors.grayLight),
                                    hintText: "Write your message...",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          sw10,
                          controller.isLoading
                              ? const CustomLoader()
                              : InkWell(
                                  onTap: () {
                                    if (controller
                                        .sendMsgController.text.isEmpty) {
                                      Utils.toastMessage(
                                          message: "Write something first!");
                                    } else {
                                      controller.sendMessageRepo(
                                          chatId: chatId);
                                    }
                                  },
                                  child: Image.asset(AppImages.send, scale: 4)),
                        ],
                      ),
                      sh15,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => Get.to(() => ResourcesView()),
                            child: Column(
                              children: [
                                Image.asset(AppImages.more, scale: 15),
                                Text("More Resources",
                                    style: h3.copyWith(fontSize: 13)),
                              ],
                            ),
                          ),
                          sw20,
                          GestureDetector(
                            onTap: () {},
                            child: Column(
                              children: [
                                Image.asset(AppImages.check, scale: 4),
                                sh5,
                                Text("Pets Are Safe?".tr,
                                    style: h3.copyWith(fontSize: 13)),
                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Column chatItems(ChatDataModel chatDataItems, MessageController controller) {
    return Column(
                            children: [
                              if (chatDataItems.text == "")
                                timeStamp(
                                    sendReceiveTime: OtherHelper.formatTime(
                                        chatDataItems.createdAt)),
                              if (chatDataItems.text == "") 10.height,
                              if (chatDataItems.text == "")
                                helpTypeCard(
                                    alignment:
                                        chatDataItems.sender == PrefsHelper.userId
                                            ? Alignment.centerRight
                                            : Alignment.centerLeft,
                                    helpTypeTitle:
                                        controller.getTitleFromHelpType(
                                            chatDataItems.helpType),
                                    helpTypeIcon:
                                        "${controller.helpTypeIcons[chatDataItems.helpType]}"),
                              if (chatDataItems.text == "") 10.height,
                              if (chatDataItems.text == "")
                                Align(
                                  alignment:
                                      chatDataItems.sender == PrefsHelper.userId
                                          ? Alignment.centerRight
                                          : Alignment.centerLeft,
                                  child: petCardContainer(
                                      petImageUrl: chatDataItems.pet.photo,
                                      petBreed: chatDataItems.pet.breed,
                                      petName: chatDataItems.pet.petName,
                                      petGender: chatDataItems.pet.sex,
                                      petAge: chatDataItems.pet.age,
                                      petAddress: chatDataItems.pet.address),
                                ),
                              if (chatDataItems.text != "")
                                ChatMessage(
                                    text: chatDataItems.text,
                                    time: OtherHelper.formatTime(
                                        chatDataItems.createdAt),
                                    isSentByMe:
                                        chatDataItems.sender == PrefsHelper.userId
                                            ? true
                                            : false),
                              if (chatDataItems.text == "") 10.height,
                              if(controller.isPetSafe.value)
                                helpTypeCard(
                                  alignment: chatDataItems.sender == PrefsHelper.userId
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  helpTypeIcon: AppImages.petSaveIcon,
                                  helpTypeTitle: "Pets Are Safe".tr,
                                  textColor: AppColors.white,
                                  cardColor: AppColors.green),
                              if(controller.isPetSafe.value)
                                10.height,
                              if(controller.isPetSafe.value)
                                Align(
                                  alignment:
                                  chatDataItems.sender == PrefsHelper.userId
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: petCardContainer(
                                      petImageUrl: chatDataItems.pet.photo,
                                      petBreed: chatDataItems.pet.breed,
                                      petName: chatDataItems.pet.petName,
                                      petGender: chatDataItems.pet.sex,
                                      petAge: chatDataItems.pet.age,
                                      petAddress: chatDataItems.pet.address),
                                ),
                              if(controller.isPetSafe.value)
                                16.height,
                              if(controller.isPetSafe.value)
                                CustomText(
                                  textAlign: TextAlign.center,
                                    text: "Conversation ends here for this pet, thank you".tr, fontWeight: FontWeight.w600,),
                              10.height,
                            ],
                          );
  }

  Container petCardContainer(
      {required String petImageUrl,
      required String petBreed,
      required String petName,
      required String petGender,
      required String petAge,
      required String petAddress}) {
    return Container(
      width: 158.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.mainColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CustomImage(
                imageSrc: petImageUrl,
                imageType: ImageType.network,
                height: 110.h,
                width: 158.w,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$petBreed, ",
                  maxLines: 2,
                  style: h2.copyWith(
                      fontWeight: FontWeight.w700, color: AppColors.white),
                ),
                Expanded(
                  child: Text(
                    petName,
                    maxLines: 2,
                    style: h2.copyWith(
                        fontWeight: FontWeight.w700, color: AppColors.white),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "$petGender, ",
                  style: h4.copyWith(fontSize: 13, color: AppColors.white),
                ),
                Text(
                  "$petAge Years.",
                  style: h4.copyWith(fontSize: 13, color: AppColors.white),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  CupertinoIcons.location_solid,
                  color: AppColors.white,
                ),
                SizedBox(
                    width: 115.w,
                    child: Text(
                      petAddress,
                      style: h5.copyWith(fontSize: 12, color: AppColors.white),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Align helpTypeCard(
      {required AlignmentGeometry alignment,
      required String helpTypeTitle,
      required String helpTypeIcon,
        Color textColor = AppColors.black,
      Color cardColor = AppColors.olive}) {
    return Align(
      alignment: alignment,
      child: Container(
        height: 110,
        width: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: cardColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(
              imageSrc: helpTypeIcon,
              imageType: ImageType.png,
              height: 30,
              width: 30,
            ),
            8.height,
            Text(
              helpTypeTitle,
              style: h2.copyWith(fontWeight: FontWeight.w700, color: textColor),
            )
          ],
        ),
      ),
    );
  }

  Center timeStamp({required String sendReceiveTime}) {
    return Center(
      child:
          Text(sendReceiveTime, style: h2.copyWith(color: AppColors.grayLight)),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final String time;
  final bool isSentByMe;

  const ChatMessage(
      {super.key,
      required this.text,
      required this.time,
      required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(time, style: h2.copyWith(color: AppColors.grayLight)),
          ),
          sh5,
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: isSentByMe ? AppColors.chatColor2 : AppColors.chatColor1,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SizedBox(
                width: Get.width / 1.8,
                child: Text(
                  text,
                  style: h3.copyWith(
                    fontSize: 14,
                    color: isSentByMe ? AppColors.white : AppColors.black,
                  ),
                )),
          ),
          sh5,
        ],
      ),
    );
  }
}
