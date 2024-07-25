import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:felpus/app/common/widgets/custom_textfelid.dart';
import 'package:felpus/app/modules/dashboard/views/dashboard_view.dart';
import 'package:felpus/app/modules/forgot/views/forgot_view.dart';
import 'package:felpus/app/modules/signup/views/signup_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/app_color/app_colors.dart';
import '../../../common/app_text_style/styles.dart';
import '../../../common/widgets/custom_auth_appbar.dart';
import '../../../common/widgets/custom_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAuthAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sh20,
            Column(
              children: [
                Text("Welcome Back!",style:  h3.copyWith(fontSize: 30,),textAlign: TextAlign.center,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Let’s",style:  h3.copyWith(fontSize: 30),textAlign: TextAlign.center,),
                    sw10,
                    Text("Sign In.",style:  h3.copyWith(fontSize: 30,color: AppColors.mainColor),textAlign: TextAlign.center,),

                  ],
                )
              ],
            ),
            sh10,
            Text("Lorem ipsum dolor sit amet, consectetur\n adipiscing elit, sed.",style: h4,textAlign: TextAlign.center,),
            sh50,
            CustomTextField(title: "Email", width: Get.width,hintText: "Enter your email",),
            CustomTextField(title: "Password", width: Get.width,hintText: "Password",sufIcon: Icon(CupertinoIcons.eye_slash),),
            sh5,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(() => Checkbox(
                        //  title: Text('Remember Me',style: h4,),
                        checkColor: AppColors.white,
                        activeColor: AppColors.mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)
                        ),
                        value: loginController.isChecked.value,
                        onChanged: (bool? value) {
                          if (value != null) {
                            loginController.toggleRememberMe(value);
                          }
                        },
                      ),),
                      Text("Remember me",style: h4,)
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => const ForgotView()),
                      child: Text("Forgot Password",style: h3.copyWith(decoration: TextDecoration.underline,),))
                ],
              ),
            ),
            sh30,
            CustomButton(ontap: () => Get.to(() => DashboardView()),title: "Sign In", width: Get.width, color: AppColors.mainColor),
            sh100,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ",style: h4,),
                sw5,
                InkWell(
                    onTap: () => Get.to(() => SignupView()),
                    child: Text("Sign Up",style: h3,)),

              ],
            )
          ],
        ),
      )
    );
  }


}
