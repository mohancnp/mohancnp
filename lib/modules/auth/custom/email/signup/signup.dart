import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/placeholder_image.dart';
import 'package:metrocoffee/modules/auth/custom/email/signup/signup_controller.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/auth_btn.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/custom_textfeild.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/error_display.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/welcome_text.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class EmailSignUpPage extends StatelessWidget {
  EmailSignUpPage({Key? key}) : super(key: key);

  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Image.asset(
            loginBackgroundImage,
            width: 375.w,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: controller.signUpFormKey,
              child: Container(
                height: 900.h,
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 56.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: Get.back,
                          icon: Icon(
                            CupertinoIcons.back,
                            color: Colors.white,
                            size: 28.w,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.4),
                          ),
                          padding: EdgeInsets.all(5.w),
                          child: Image.asset(
                            AppConfig.metroCoffeeLogoAssetPath,
                            width: 58.w,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    const WelcomeText(),
                    CustomTextFormFeild(
                      controller: controller.firstNameEditingController,
                      validator: controller.validateFirstName,
                      hintText: "First Name",
                      suffixIcon: Icon(
                        Icons.person,
                        color: Palette.darkGery,
                        size: 18.sp,
                      ),
                    ),
                    Obx(
                      () => controller.firstNameErrorMessage.isNotEmpty
                          ? CustomErrorWidget(
                              message: controller.firstNameErrorMessage.value,
                            )
                          : const SizedBox(),
                    ),
                    // SizedBox(height: 20.h),
                    CustomTextFormFeild(
                      controller: controller.lastNameEditingController,
                      validator: controller.validateSecondName,
                      hintText: "Last Name",
                      suffixIcon: Icon(
                        Icons.person,
                        color: Palette.darkGery,
                        size: 18.sp,
                      ),
                    ),
                    Obx(
                      () => controller.lastNameErrorMessage.isNotEmpty
                          ? CustomErrorWidget(
                              message: controller.lastNameErrorMessage.value,
                            )
                          : const SizedBox(),
                    ),
                    CustomTextFormFeild(
                      controller: controller.emailEditingController,
                      hintText: "Email Address",
                      validator: controller.validateEmail,
                      suffixIcon: Icon(
                        Icons.mail,
                        color: Palette.darkGery,
                        size: 18.sp,
                      ),
                    ),
                    Obx(
                      () => controller.emailErrorMessage.isNotEmpty
                          ? CustomErrorWidget(
                              message: controller.emailErrorMessage.value,
                            )
                          : const SizedBox(),
                    ),
                    GetBuilder<SignUpController>(
                      builder: (controller) {
                        return CustomTextFormFeild(
                          controller: controller.passwordEditingController,
                          hintText: "Password",
                          validator: controller.validatePassword,
                          suffixIcon: Icon(
                            controller.eye
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Palette.darkGery,
                            size: 18.sp,
                          ),
                          obscureText: controller.eye ? false : true,
                          onSuffixIconTap: () {
                            controller.eye = !controller.eye;
                          },
                        );
                      },
                    ),
                    Obx(
                      () => controller.passwordErrorMessage.isNotEmpty
                          ? CustomErrorWidget(
                              message: controller.passwordErrorMessage.value,
                            )
                          : const SizedBox(),
                    ),
                    GetBuilder<SignUpController>(
                      builder: (controller) {
                        return CustomTextFormFeild(
                          controller: controller.rePasswordEditingController,
                          hintText: "Re-Password",
                          validator: controller.validateRePassword,
                          suffixIcon: Icon(
                            controller.eye
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Palette.darkGery,
                            size: 18.sp,
                          ),
                          obscureText: controller.eye ? false : true,
                          onSuffixIconTap: () {
                            controller.eye = !controller.eye;
                          },
                        );
                      },
                    ),
                    Obx(
                      () => controller.rePasswordErrorMessage.isNotEmpty
                          ? CustomErrorWidget(
                              message: controller.rePasswordErrorMessage.value,
                            )
                          : const SizedBox(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: AuthBtn(
                        centerBtnText: "REGISTER",
                        onpressed: controller.resigterUser,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Center(
                      child: Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: Get.back,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: CustomFont.proximaNovaRegular,
                            decoration: TextDecoration.underline,
                            fontSize: 16.sp,
                            decorationColor: Colors.white,
                            height: 1.7,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
