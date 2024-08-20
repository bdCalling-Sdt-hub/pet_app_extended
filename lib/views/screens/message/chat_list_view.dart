
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
          "Messages",
          style: h1,
        ),
      ),
      body: GetBuilder<MessageController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Obx(() {
            return Column(
              children: [
                CustomTextField(title: "", hintText: "Search your message", width: Get.width, sufIcon: Icon(Icons.search),),
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
                          child: Text("Conversation", style: h2.copyWith(fontSize: 20, color: controller.isInformation.value? AppColors.white : AppColors.black),),
                        ),
                      ),
                      const Spacer(),

                      ///<<<===================== Card Style Button =============>>>

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
                          child: Text("Archived", style: h2.copyWith(fontSize: 20, color: controller.isStyle.value? AppColors.white : AppColors.black),),
                        ),
                      ),
                    ],
                  ),
                ),

                controller.isInformation.value
                    ? Expanded(
                  child: ListView.builder(
                    // controller: _scrollController,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => const MessageView());
                        },
                        child: ChatListItem(
                          image: "https://shorturl.at/2iMPa",
                          name: "Henry",
                          message: "They are at my place.",
                          time: "10 :15",
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
                          name: "Henry",
                          message: "You: I got my pet",
                          time: "10 :15",
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
