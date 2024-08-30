import 'package:felpus/extensions/extension.dart';
import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/helpers/validator_helper.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../../../views/components/custom_auth_appbar.dart';
import '../../../views/components/custom_button.dart';
import '../../../controllers/login_controller.dart';
import '../forgot/forgot_view.dart';
import '../signup/signup_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAuthAppBar(),
        body: GetBuilder<LoginController>(
          builder: (loginController) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    sh20,
                    Column(
                      children: [
                        Text(
                          "Welcome Back!",
                          style: h3.copyWith(
                            fontSize: 30,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Let’s",
                              style: h3.copyWith(fontSize: 30),
                              textAlign: TextAlign.center,
                            ),
                            sw10,
                            Text(
                              "Sign In.",
                              style: h3.copyWith(
                                  fontSize: 30, color: AppColors.mainColor),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      ],
                    ),
                    70.height,
                    CustomTextFormField(
                      validator: ValidatorHelper.emailValidator,
                      controller: loginController.emailController,
                      title: "Email",
                      hintText: "Enter your email",
                    ),
                    24.height,
                    CustomTextFormField(
                      validator: ValidatorHelper.passwordValidator,
                      controller: loginController.passwordController,
                      title: "Password",
                      hintText: "Enter your password",
                      isPassword: true,
                    ),
                    sh5,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                  //  title: Text('Remember Me',style: h4,),
                                  checkColor: AppColors.white,
                                  activeColor: AppColors.mainColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                  value: loginController.isChecked.value,
                                  onChanged: (bool? value) {
                                    if (value != null) {
                                      loginController.toggleRememberMe(value);
                                    }
                                  },
                                ),
                              ),
                              Text(
                                "Remember me",
                                style: h4,
                              )
                            ],
                          ),
                          GestureDetector(
                              onTap: () => Get.to(() => ForgotView()),
                              child: Text(
                                "Forgot Password",
                                style: h3.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ))
                        ],
                      ),
                    ),
                    sh30,
                    loginController.isLoading
                        ? const CustomLoader()
                        : CustomButton(
                            onTap: () {
                              print(PrefsHelper.token);
                              if (_formKey.currentState!.validate()) {
                                loginController.logInRepo();
                              }
                            },
                            title: "Sign In",
                            width: Get.width,
                            color: AppColors.mainColor),
                    sh100,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: h4,
                        ),
                        sw5,
                        InkWell(
                            onTap: () => Get.to(() => SignupView()),
                            child: Text(
                              "Sign Up",
                              style: h3,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
