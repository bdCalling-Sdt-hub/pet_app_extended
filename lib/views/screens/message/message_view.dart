import 'package:felpus/extensions/extension.dart';
import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/utils/App_Utils/app_utils.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:felpus/views/components/no_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:developer' as print;

import 'package:get/get.dart';
import '../../../controllers/message_controller.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../resources/resources_view.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  MessageController messageController = Get.find<MessageController>();


  @override
  void initState() {
    super.initState();

    // Scroll to the bottom of the list after the page is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (messageController.scrollController.hasClients) {
        messageController.scrollController.jumpTo(messageController.scrollController.position.maxScrollExtent);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
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
                Expanded(  // Use Expanded to make the text fit in the remaining space
                  child: CustomText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    text: controller.chatPersonInfo.name,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            centerTitle: true,
            leading: InkWell(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios)),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: controller.chatItemsList.isNotEmpty
                      ? ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.chatItemsList.length,
                    itemBuilder: (context, index) {
                      var chatDataItems = controller.chatItemsList[index];
                      controller.chatId = chatDataItems.chatId;
                      if(chatDataItems.sender.id == PrefsHelper.userId){
                        MessageController.helpType = chatDataItems.helpType;
                        print.log("MessageController.helpType : ${MessageController.helpType}");
                      }
                      return chatItems(
                        controller: controller,
                        text: chatDataItems.text,
                        helpType: chatDataItems.helpType,
                        time: chatDataItems.time,
                        petPhoto: chatDataItems.pet.photo,
                        petName: chatDataItems.pet.petName,
                        petBreed: chatDataItems.pet.breed,
                        petAddress: chatDataItems.pet.address,
                        petAge: chatDataItems.pet.age,
                        petGender: chatDataItems.pet.sex,
                        senderId: chatDataItems.sender.id == ""
                            ? PrefsHelper.userId
                            : chatDataItems.sender.id,
                        senderImage: chatDataItems.sender.photo,
                      );
                    },
                  )
                      : const NoData(),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 14.0, vertical: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: AppColors.light),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0),
                              child: TextFormField(
                                controller: controller.sendMsgController,
                                maxLines: 4,
                                minLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle:
                                  h3.copyWith(color: AppColors.grayLight),
                                  hintText: "Write your message...".tr,
                                ),
                              ),
                            ),
                          ),
                        ),
                        sw10,
                        Expanded(
                          flex: 1,
                          child: InkWell(
                              onTap: () {
                                if (controller.sendMsgController.text.isEmpty) {
                                  Utils.toastMessage(
                                      message: "Write something first!".tr);
                                } else {
                                  controller.sendMessageRepo().then((value) => controller.scrollToBottom());
                                }
                              },
                              child: Image.asset(AppImages.send, scale: 3)),
                        ),
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
                              Text("More Resources".tr,
                                  style: h3.copyWith(fontSize: 13)),
                            ],
                          ),
                        ),
                        sw20,
                        InkWell(
                          onTap: () {
                            controller.sendMessageRepo().then((value) => controller.scrollToBottom());
                          },
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
              ),// Adjust the space for the bottom bar
            ],
          ),
        );
      },
    );
  }

  Column chatItems(
      {required MessageController controller,
        String time = "",
        String helpType = "",
        String petPhoto = "",
        String petBreed = "",
        String petName = "",
        String petGender = "",
        String petAge = "",
        String petAddress = "",
        String text = "",
        String senderId = "",
        String senderImage = ""}) {
    return Column(
      children: [
        if (text == "") timeStamp(sendReceiveTime: time),
        if (text == "")
          helpTypeCard(
              alignment: senderId == PrefsHelper.userId
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              helpTypeTitle: controller.getTitleFromHelpType(helpType),
              helpTypeIcon: "${controller.helpTypeIcons[helpType]}",
              isSentByMe: senderId == PrefsHelper.userId ? true : false,
              senderImage: senderImage),
        if (text == "")
          Align(
            alignment: senderId == PrefsHelper.userId
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: petCardContainer(
                petImageUrl: petPhoto,
                petBreed: petBreed,
                petName: petName,
                petGender: petGender,
                petAge: petAge,
                isSentByMe: senderId == PrefsHelper.userId ? true : false,
                petAddress: petAddress),
          ),
        if (text != "")
          ChatMessage(
            text: text,
            time: time,
            isSentByMe: senderId == PrefsHelper.userId ? true : false,
            senderImage: senderImage,
          ),
        if (text == "safe")
          helpTypeCard(
              alignment: senderId == PrefsHelper.userId
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              helpTypeIcon: AppImages.petSaveIcon,
              helpTypeTitle: "Pets Are Safe".tr,
              textColor: AppColors.white,
              cardColor: AppColors.green,
              isSentByMe: senderId == PrefsHelper.userId ? true : false,
              senderImage: senderImage),
        if (text == "safe")
          Align(
            alignment: senderId == PrefsHelper.userId
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: petCardContainer(
                petImageUrl: petPhoto,
                petBreed: petBreed,
                petName: petName,
                petGender: petGender,
                petAge: petAge,
                isSentByMe: senderId == PrefsHelper.userId ? true : false,
                petAddress: petAddress),
          ),
        if (text == "safe") 16.height,
        if (text == "safe")
          CustomText(
            textAlign: TextAlign.center,
            text: "Conversation ends here for this pet, Thank you".tr,
            fontWeight: FontWeight.w600,
          ),
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
        bool isSentByMe = false,
        required String petAddress}) {
    return Container(
      margin: EdgeInsets.only(top: 10.h, bottom: 10.h, left: isSentByMe? 0.w : 42.w),
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
            Wrap(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$petBreed, ",
                  maxLines: 2,
                  style: h2.copyWith(
                      fontWeight: FontWeight.w700, color: AppColors.white),
                ),
                Text(
                  petName,
                  maxLines: 2,
                  style: h2.copyWith(
                      fontWeight: FontWeight.w700, color: AppColors.white),
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
                Expanded(
                  child: SizedBox(
                      width: 115.w,
                      child: Text(
                        petAddress,
                        style: h5.copyWith(fontSize: 12, color: AppColors.white),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      )),
                ),
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
        Color cardColor = AppColors.olive,
        bool isSentByMe = false,
        String senderImage = ""}) {
    return Align(
      alignment: alignment,
      child: Row(
        mainAxisAlignment: isSentByMe? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          isSentByMe
              ? const SizedBox.shrink()
              : ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CustomImage(
                imageSrc: senderImage,
                imageType: ImageType.network,
                height: 36.h,
                width: 36.w,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
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
                  style: h2.copyWith(
                      fontWeight: FontWeight.w700, color: textColor),
                )
              ],
            ),
          ),
        ],
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
  final String senderImage;

  const ChatMessage(
      {super.key,
      required this.text,
      required this.time,
      this.senderImage = '',
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
          Row(
            mainAxisAlignment: isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              isSentByMe
                  ? const SizedBox.shrink()
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(100.r),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CustomImage(
                          imageSrc: senderImage,
                          imageType: ImageType.network,
                          height: 36.h,
                          width: 36.w,
                        ),
                      ),
                    ),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color:
                      isSentByMe ? AppColors.chatColor2 : AppColors.chatColor1,
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
            ],
          ),
          sh5,
        ],
      ),
    );
  }
}
