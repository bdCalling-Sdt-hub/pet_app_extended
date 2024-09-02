import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_color/app_colors.dart';
import '../../../../utils/app_text_style/styles.dart';
import '../../../../utils/size_box/custom_sizebox.dart';

class FaqView extends GetView {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            'FAQ'.tr,
            style: h2.copyWith(fontSize: 20, color: AppColors.mainColor),
          ),
          centerTitle: true,
          leading: InkWell(
              onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "We’re here to help you with anything and everything on Felpus."
                      .tr,
                  style: h3.copyWith(
                    fontSize: 23,
                  ),
                  textAlign: TextAlign.center,
                ),
                sh5,
                Text(
                  "Welcome to the FAQ page dedicated to our app, designed to aid in reuniting lost pets or finding a new furry friend through adoption. Below, you'll discover answers to common questions about our app's features."
                      .tr,
                  style: h4.copyWith(fontSize: 14),
                ),
                sh10,
                Text(
                  "Lost Pets".tr,
                  style: h2.copyWith(fontSize: 18),
                ),
                sh10,
                FAQItem(
                  question: 'How do I report a lost pet through the app?'.tr,
                  answer:
                      'To report a lost pet, open the app, go to the "Report Lost Pet" section, and fill in the required details.'
                          .tr,
                ),
                FAQItem(
                  question:
                      'What information should I include when reporting a lost pet?'
                          .tr,
                  answer:
                      'Include the pet’s name, breed, color, last seen location, and your contact information.'
                          .tr,
                ),
                FAQItem(
                  question: 'How can I search for lost pets in my area?'.tr,
                  answer:
                      'Go to the "Search Lost Pets" section in the app, and enter your location to find lost pets near you.'
                          .tr,
                ),
                FAQItem(
                  question:
                      'What should I do if I\'ve found a lost pet using the app?'
                          .tr,
                  answer:
                      'If you find a lost pet, contact the owner through the app and arrange to return the pet safely.'
                          .tr,
                ),
                sh10,
                Text(
                  "Found Pets".tr,
                  style: h2.copyWith(fontSize: 18),
                ),
                sh10,
                FAQItem(
                  question: 'How do I report a lost pet through the app?'.tr,
                  answer:
                      'To report a lost pet, open the app, go to the "Report Lost Pet" section, and fill in the required details.'
                          .tr,
                ),
                FAQItem(
                  question:
                      'What information should I include when reporting a lost pet?'
                          .tr,
                  answer:
                      'Include the pet’s name, breed, color, last seen location, and your contact information.'
                          .tr,
                ),
                FAQItem(
                  question: 'How can I search for lost pets in my area?'.tr,
                  answer:
                      'Go to the "Search Lost Pets" section in the app, and enter your location to find lost pets near you.'
                          .tr,
                ),
                FAQItem(
                  question:
                      'What should I do if I\'ve found a lost pet using the app?'
                          .tr,
                  answer:
                      'If you find a lost pet, contact the owner through the app and arrange to return the pet safely.'
                          .tr,
                ),
                sh10,
                Text(
                  "Adoption".tr,
                  style: h2.copyWith(fontSize: 18),
                ),
                sh10,
                FAQItem(
                  question: 'How do I report a lost pet through the app?'.tr,
                  answer:
                      'To report a lost pet, open the app, go to the "Report Lost Pet" section, and fill in the required details.'
                          .tr,
                ),
                FAQItem(
                  question:
                      'What information should I include when reporting a lost pet?'
                          .tr,
                  answer:
                      'Include the pet’s name, breed, color, last seen location, and your contact information.'
                          .tr,
                ),
                FAQItem(
                  question: 'How can I search for lost pets in my area?'.tr,
                  answer:
                      'Go to the "Search Lost Pets" section in the app, and enter your location to find lost pets near you.'
                          .tr,
                ),
                FAQItem(
                  question:
                      'What should I do if I\'ve found a lost pet using the app?'
                          .tr,
                  answer:
                      'If you find a lost pet, contact the owner through the app and arrange to return the pet safely.'
                          .tr,
                ),
                sw5,
                Text(
                  "If you can't find the answer to your question here, please don't hesitate to contact our support team for further assistance. We're here to help you every step of the way in your journey with pets."
                      .tr,
                  style: h4.copyWith(fontSize: 15),
                ),
                sh10,
                Text(
                  "Contact Information".tr,
                  style: h2,
                ),
                Text(
                  "Phone : +012 345 678".tr,
                  style: h4.copyWith(fontSize: 15),
                ),
                Text(
                  "Email  : example@gmail.com".tr,
                  style: h4.copyWith(fontSize: 15),
                ),
                Text(
                  "Live Chat Support : www.felpusapp.com".tr,
                  style: h4.copyWith(fontSize: 15),
                ),
                sh10,
              ],
            ),
          ),
        ));
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;

  const FAQItem({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(question.tr, style: h2.copyWith(color: AppColors.grayLight)),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Text(answer.tr, style: h3.copyWith(color: AppColors.grayLight)),
        ),
        sh10
      ],
    );
  }
}
