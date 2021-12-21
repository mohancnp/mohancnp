import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/placeholder_image.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/modules/auth/custom/email/login/login_controller.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/auth_btn.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/custom_textfeild.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/error_display.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/welcome_text.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class EmailLoginPage extends StatelessWidget {
  EmailLoginPage({Key? key}) : super(key: key);
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Form(
                key: controller.loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 56.h),
                    IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: Get.back,
                      icon: Icon(
                        CupertinoIcons.back,
                        color: Colors.white,
                        size: 28.w,
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.4),
                      ),
                      padding: EdgeInsets.all(4.w),
                      child: Image.asset(
                        AppConfig.metroCoffeeLogoAssetPath,
                        width: 58.w,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    const WelcomeText(),
                    SizedBox(height: 10.h),
                    GetBuilder<LoginController>(
                      init: LoginController(),
                      builder: (controller) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextFormFeild(
                              controller: controller.emailEditingController,
                              validator: controller.validateEmail,
                              hintText: "Email Address",
                              suffixIcon: Icon(
                                FeatherIcons.mail,
                                size: 18.sp,
                              ),
                            ),
                            Obx(
                              () => controller.emailErrorMessage.isNotEmpty
                                  ? CustomErrorWidget(
                                      message:
                                          controller.emailErrorMessage.value,
                                    )
                                  : SizedBox(),
                            ),
                            CustomTextFormFeild(
                              controller: controller.passwordEditingController,
                              hintText: "Password",
                              validator: controller.validatePassword,
                              suffixIcon: Icon(
                                controller.eye
                                    ? FeatherIcons.eye
                                    : FeatherIcons.eyeOff,
                                color: Palette.darkGery,
                                size: 18.sp,
                              ),
                              obscureText: controller.eye ? false : true,
                              onSuffixIconTap: () {
                                controller.eye = !controller.eye;
                              },
                            ),
                            Obx(
                              () => controller.passwordErrorMessage.isNotEmpty
                                  ? CustomErrorWidget(
                                      message:
                                          controller.passwordErrorMessage.value,
                                    )
                                  : SizedBox(),
                            ),
                          ],
                        );
                      },
                    ),
                    GestureDetector(
                      onTap: () => controller.navigateToRoute(
                        pageName: PageName.forgotPasswordPage,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(
                            top: 12.h, bottom: 12.h, left: 10.w),
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                            fontFamily: CustomFont.proximaNovaRegular,
                            color: Colors.white70,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: AuthBtn(
                        centerBtnText: "Sign In",
                        onpressed: controller.performEmailLogin,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.navigateToRoute(
                        pageName: PageName.signupPage,
                      ),
                      child: Center(
                        child: Text(
                          "Sign Up",
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
