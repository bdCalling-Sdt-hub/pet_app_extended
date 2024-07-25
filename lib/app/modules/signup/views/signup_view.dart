import 'package:felpus/app/modules/complete_profile/views/complete_profile_view.dart';
import 'package:flutter/material.dart';

import 'package:felpus/app/common/app_color/app_colors.dart';
import 'package:felpus/app/common/app_text_style/styles.dart';
import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:felpus/app/common/widgets/custom_auth_appbar.dart';
import 'package:felpus/app/common/widgets/custom_button.dart';
import 'package:felpus/app/common/widgets/custom_textfelid.dart';
import 'package:felpus/app/modules/forgot/views/verify_view.dart';
import 'package:felpus/app/modules/login/views/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends StatelessWidget {
   SignupView({super.key});

  final SignupController signupController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAuthAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("Welcome Here!",style:  h3.copyWith(fontSize: 30,),textAlign: TextAlign.center,),
              Text("Create An Account.",style:  h3.copyWith(fontSize: 30,color: AppColors.mainColor),textAlign: TextAlign.center,),
              sh5,
              Text("Fill up your information.",style: h4,textAlign: TextAlign.center,),
              sh50,
              CustomTextField(title: "Email", width: Get.width,hintText: "Enter your email",),
              CustomTextField(title: "Password", width: Get.width,hintText: "Password",sufIcon: const Icon(CupertinoIcons.eye_slash),),
              CustomTextField(title: "Confirm Password", width: Get.width,hintText: "Password",sufIcon: const Icon(CupertinoIcons.eye_slash),),
              sh5,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Obx(() => Checkbox(
                          //  title: Text('Remember Me',style: h4,),
                          checkColor: AppColors.white,
                          activeColor: AppColors.grayLight,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)
                          ),
                          value: signupController.isChecked.value,
                          onChanged: (bool? value) {
                            if (value != null) {
                              signupController.toggleRememberMe(value);
                            }
                          },
                        ),),
                        Text("Agree with",style: h3,)
                      ],
                    ),
                    sw5,
                    Text("Terms and Services.",style: h4,)
                  ],
                ),
              ),
              sh30,
              CustomButton(ontap: () => Get.to(() => VerifyView(), arguments: {"purpose" : "sign up"}),title: "Sign Up", width: Get.width, color: AppColors.mainColor),
              sh10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: h4,),
                  sw5,
                  InkWell(
                      onTap: () => Get.to(() => LoginView()),
                      child: Text("Sign In",style: h3,)),

                ],
              ),
              sh30
            ],
          ),
        )
    );
  }
}
