import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/custom_textfelid.dart';
import 'package:felpus/views/components/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/message_controller.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import 'Widgets/chat_list_item.dart';
import 'message_view.dart';

class ChatListView extends StatelessWidget {
  ChatListView({super.key});

  final MessageController controller = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios, size: 20),
        ),
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
                CustomTextField(
                  controller: controller.searchController,
                  title: "",
                  hintText: "Search".tr,
                  width: Get.width,
                  sufIcon: const Icon(Icons.search),

                ),
                SizedBox(height: 10),

                // Display filtered chat users under the search bar

                /// ======================== Search List ======================
                controller.filteredChatUsersList.isNotEmpty && controller.searchController.text.isNotEmpty
                    ? Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.filteredChatUsersList.length,
                    itemBuilder: (context, index) {
                      var chatUserDetails =
                      controller.filteredChatUsersList[index];
                      return GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          controller.createOrGetMessageRepo(
                              chatId: chatUserDetails.id);
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              chatUserDetails.type == "single"
                                  ? chatUserDetails.partner.photo
                                  : chatUserDetails.photo,
                            ),
                          ),
                          title: Text(
                            chatUserDetails.type == "single"
                                ? chatUserDetails.partner.fullName
                                : chatUserDetails.groupName,
                          ),
                          subtitle: Text(chatUserDetails.lastMessage),
                        ),
                      );
                    },
                  ),
                )
                    : Expanded(
                      child: Column(
                                        children: [ Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
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
                              child: Text(
                                "Conversation".tr,
                                style: h2.copyWith(
                                    fontSize: 20,
                                    color: controller.isInformation.value
                                        ? AppColors.white
                                        : AppColors.black),
                              ),
                            ),
                          ),
                          const Spacer(),
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
                              child: Text(
                                "Archived".tr,
                                style: h2.copyWith(
                                    fontSize: 20,
                                    color: controller.isStyle.value
                                        ? AppColors.white
                                        : AppColors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                                        ),
                      controller.isInformation.value
                          ? controller.isLoading
                          ? SizedBox(
                        height: 300.h,
                        child: CustomLoader(),
                      )
                          : controller.chatActiveUsersList.isEmpty? const SizedBox(
                        height: 100,
                          child: NoData()
                      ) : Expanded(
                        child: ListView.builder(
                          itemCount:
                          controller.chatActiveUsersList.length,
                          itemBuilder: (context, index) {
                            var chatUserDetails =
                            controller.chatActiveUsersList[index];
                            return GestureDetector(
                              onTap: () {
                                controller.chatId = chatUserDetails.id;
                                controller.createOrGetMessageRepo(
                                    chatId: chatUserDetails.id);
                                // Get.to(() => const MessageView());
                              },
                              child: ChatListItem(
                                image: chatUserDetails.type == "single"
                                    ? chatUserDetails.partner.photo
                                    : chatUserDetails.photo,
                                name: chatUserDetails.type == "single"
                                    ? chatUserDetails.partner.fullName
                                    : chatUserDetails.groupName,
                                message: chatUserDetails.lastMessage,
                                time: "10 :15".tr,
                                numberOfMessages: 5,
                              ),
                            );
                          },
                        ),
                      )
                          : controller.chatArchivedUsersList.isEmpty? const SizedBox(
                          height: 100,
                          child: NoData()
                      ) : Expanded(
                        child: ListView.builder(
                          itemCount: controller.chatArchivedUsersList.length,
                          itemBuilder: (context, index) {
                            var chatUserDetails =
                            controller.chatArchivedUsersList[index];
                            return GestureDetector(
                              onTap: () {
                                controller.chatId = chatUserDetails.id;
                                controller.createOrGetMessageRepo(
                                    chatId: chatUserDetails.id);
                              },
                              child: ChatListItem(
                                image: chatUserDetails.type == "single"
                                    ? chatUserDetails.partner.photo
                                    : chatUserDetails.photo,
                                name: chatUserDetails.type == "single"
                                    ? chatUserDetails.partner.fullName
                                    : chatUserDetails.groupName,
                                message: chatUserDetails.lastMessage,
                                time: "10 :15".tr,
                                numberOfMessages: 5,
                                isArchived: true,
                              ),
                            );
                          },
                        ),
                      ),],
                                      ),
                    ),

              ],
            );
          }),
        );
      }),
    );
  }
}

