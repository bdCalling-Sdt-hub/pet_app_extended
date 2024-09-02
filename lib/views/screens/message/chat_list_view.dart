import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/custom_textfelid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/message_controller.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import 'Widgets/chat_list_item.dart';
import 'message_view.dart';

class ChatListView extends StatelessWidget {
  ChatListView({super.key});

  MessageController controller = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios, size: 20,)),
        centerTitle: true,
        title: Text(
          "Messages".tr,
          style: h1,
        ),
      ),
      body: GetBuilder<MessageController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Obx(() {
            return Column(
              children: [
                CustomTextField(title: "", hintText: "Search your message".tr, width: Get.width, sufIcon: Icon(Icons.search),),
                sh10,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [

                      ///<<<=================== Card Information Button ===========>>>

                      GestureDetector(
                        onTap: () {
                          controller.isStyle.value = false;
                          controller.isInformation.value = true;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: controller.isInformation.value
                                ? AppColors.mainColor
                                : AppColors.pink,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text("Conversation".tr, style: h2.copyWith(fontSize: 20, color: controller.isInformation.value? AppColors.white : AppColors.black),),
                        ),
                      ),
                      const Spacer(),

                      ///<<<===================== Card Style Button ================>>>

                      GestureDetector(
                        onTap: () {
                          controller.isStyle.value = true;
                          controller.isInformation.value = false;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: controller.isStyle.value
                                ? AppColors.mainColor
                                : AppColors.pink,
                          ),
                          child: Text("Archived".tr, style: h2.copyWith(fontSize: 20, color: controller.isStyle.value? AppColors.white : AppColors.black),),
                        ),
                      ),
                    ],
                  ),
                ),

                controller.isInformation.value
                    ? controller.isLoading? const CustomLoader() : Expanded(
                  child: ListView.builder(
                    // controller: _scrollController,
                    itemCount: controller.chatUsersList.length,
                    itemBuilder: (context, index) {
                      var chatUserDetails = controller.chatUsersList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => const MessageView());
                        },
                        child: ChatListItem(
                          image: chatUserDetails.type == "single"? chatUserDetails.partner.photo : chatUserDetails.photo,
                          name: chatUserDetails.type == "single"? chatUserDetails.partner.fullName : chatUserDetails.groupName,
                          message: chatUserDetails.lastMessage,
                          time: "10 :15".tr,
                          numberOfMessages: 5,
                        ),
                      );
                    },
                  ),
                )
                    : Expanded(
                  child: ListView.builder(
                    // controller: _scrollController,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                        },
                        child: ChatListItem(
                          image: "https://shorturl.at/2iMPa",
                          name: "Henry".tr,
                          message: "You: I got my pet".tr,
                          time: "10 :15".tr,
                          numberOfMessages: 5,
                          isArchived: true,
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },),
        );
      },),
    );
  }
}
