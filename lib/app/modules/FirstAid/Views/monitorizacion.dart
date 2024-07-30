

import 'package:felpus/app/common/Extension/extension.dart';
import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Monitorizacion extends StatelessWidget {
  const Monitorizacion ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "MONITORIZACIÓN DE SIGNOS VITALES", fontSize: 20,),
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios, size: 22),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: "Materials:", isTextDecoration: true, fontSize: 24, ),
            dotRow(text: "Reloj con segundero o cronómetro"),
            dotRow(text: "Termómetro digital (rectal o de oído)"),
            CustomText(text: "Comprueba el ritmo cardíaco:", isTextDecoration: true, fontSize: 22,)

          ],
        ),
      ),
    );
  }

  Row dotRow({required String text}) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              8.width,
              Image.asset(AppImages.dotPoint, height: 10, width: 10,),
              8.width,
              Expanded(child: CustomText(text: text, isTextDecoration: false )),
            ],
          );
  }
}
