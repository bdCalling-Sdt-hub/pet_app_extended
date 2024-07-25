import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:felpus/app/modules/resources/views/resources_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../common/app_color/app_colors.dart';
import '../../../common/app_images/app_images.dart';
import '../../../common/app_text_style/styles.dart';
import '../controllers/message_controller.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.grayLight.withOpacity(0.2),
                shape: BoxShape.circle,
                border: Border.all(
                    color: AppColors.grayLight.withOpacity(0.1), width: 2),
              ),
              child: ClipOval(
                child: Image.asset(
                  AppImages.boy,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            sw10,
            Text(
              'Samim',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Center(
                        child: Text("06:35 PM", style: h2.copyWith(color: AppColors.grayLight)),
                      ),
                      sh5,
                      Align(
                        alignment: Alignment.centerRight ,
                        child: Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [AppColors.gradient2, AppColors.gradient1],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.search,scale: 3,),
                              Text("Lost Pets",style: h2,)
                            ],
                          ),
                        ),
                      ),
                      sh10,
                      Align(
                        alignment: Alignment.centerRight ,
                        child: Container(
                          height: 190.h,
                          width: 158.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.mainColor
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    AppImages.catImage,
                                    scale: 4,
                                  ),
                                ),
                                Text(
                                  "Oliver",
                                  style: h2.copyWith(fontWeight: FontWeight.w700,color: AppColors.white),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Female,",
                                      style: h4.copyWith(fontSize: 13,color: AppColors.white),
                                    ),
                                    Text(
                                      "1.5 Years.",
                                      style: h4.copyWith(fontSize: 13,color: AppColors.white),
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
                                          "Puerta del Sol, 28013 Madrid, Spain.",
                                          style: h5.copyWith(fontSize: 12,color: AppColors.white),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      sh10,
                      ChatMessage(
                          text: "I arrived home after work and my pets aren't here. Has anyone seen them?",
                          time: "06:35 PM",
                          isSentByMe: true),
                      ChatMessage(
                          text: "Hey, Santiago! I saw someone at your door an hour ago.",
                          time: "06:55 PM",
                          isSentByMe: false),
                      ChatMessage(
                          text: "I arrived home after work and my pets aren't here. Has anyone seen them?",
                          time: "06:35 PM",
                          isSentByMe: true),
                      ChatMessage(
                          text: "Hey, Santiago! I saw someone at your door an hour ago.",
                          time: "06:55 PM",
                          isSentByMe: false), ChatMessage(
                          text: "I arrived home after work and my pets aren't here. Has anyone seen them?",
                          time: "06:35 PM",
                          isSentByMe: true),
                      ChatMessage(
                          text: "Hey, Santiago! I saw someone at your door an hour ago.",
                          time: "06:55 PM",
                          isSentByMe: false), ChatMessage(
                          text: "I arrived home after work and my pets aren't here. Has anyone seen them?",
                          time: "06:35 PM",
                          isSentByMe: true),
                      ChatMessage(
                          text: "Hey, Santiago! I saw someone at your door an hour ago.",
                          time: "06:55 PM",
                          isSentByMe: false),
                    ],
                  ),
                  SizedBox(height: 160), // Add some space at the bottom
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white, // Background color for the bottom container
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
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
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: h3.copyWith(color: AppColors.grayLight),
                                hintText: "Write your message...",
                              ),
                            ),
                          ),
                        ),
                      ),
                      sw10,
                      Image.asset(AppImages.send, scale: 4),
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
                            Image.asset(AppImages.more, scale: 4),
                            Text("More Resources", style: h3.copyWith(fontSize: 13)),
                          ],
                        ),
                      ),
                      sw20,
                      Column(
                        children: [
                          Image.asset(AppImages.check, scale: 4),
                          sh5,
                          Text("Pets Are Safe?", style: h3.copyWith(fontSize: 13)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final String time;
  final bool isSentByMe;

  const ChatMessage({super.key, required this.text, required this.time, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
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
