import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/login_singup_back_image.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/modules/auth/custom/email/email_auth_controller.dart';
import 'package:metrocoffee/modules/auth/custom/membership/membership_login_controller.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/sign_in_btn.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/text_form_feild_skeleton.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/welcome_text.dart';
import 'package:metrocoffee/resource/app_config.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class EmailLoginPage extends StatelessWidget {
  EmailLoginPage({Key? key}) : super(key: key);
  final controller = Get.find<EmailAuthController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: Image.asset(
            loginBackgroundImage,
            width: 375.w,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black.withOpacity(0.14),
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                  size: 28.w,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                height: 812.h,
                width: 375.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.14),
                      Colors.black.withOpacity(0.8)
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
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
                    SizedBox(height: 40.h),
                    const WelcomeTextWidget(),
                    SizedBox(height: 10.h),
                    GetBuilder<EmailAuthController>(
                        init: EmailAuthController(),
                        builder: (mc) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FormFeildSkeleton(
                                child: Center(
                                  child: TextFormField(
                                    controller: mc.loginEmailEditingController,
                                    cursorColor: Colors.black87,
                                    style: TextStyle(
                                      fontFamily: poppinsregular,
                                      color: Colors.black87,
                                      fontSize: 13.sp,
                                      height: 1.8,
                                    ),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      suffixIcon: Icon(
                                        FeatherIcons.user,
                                        color: Color(0xff404d4d),
                                        size: 18.sp,
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                        fontFamily: poppinsregular,
                                        color: Palette.darkGery,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              FormFeildSkeleton(
                                child: Center(
                                  child: TextFormField(
                                    controller:
                                        mc.loginPasswordEditingController,
                                    cursorColor: Colors.black87,
                                    style: TextStyle(
                                      fontFamily: poppinsregular,
                                      color: Colors.black87,
                                      height: 1.8,
                                      fontSize: 13.sp,
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                    textInputAction: TextInputAction.next,
                                    obscureText: mc.eye ? false : true,
                                    decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          mc.eye = !mc.eye;
                                        },
                                        child: Icon(
                                          mc.eye
                                              ? FeatherIcons.eye
                                              : FeatherIcons.eyeOff,
                                          color: Color(0xff404d4d),
                                          size: 18.sp,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        fontFamily: poppinsregular,
                                        color: Color(0xff404d4d),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                    GestureDetector(
                      onTap: () => Get.toNamed(PageName.forgotPasswordPage),
                      child: Container(
                        margin: EdgeInsets.only(top: 13.h, left: 10.w),
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                              fontFamily: proximanovaregular,
                              color: Colors.white70,
                              fontSize: 14.sp),
                        ),
                      ),
                    ),
                    GetBuilder<MemberShipLoginController>(builder: (mc) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: SizedBox(
                            height: 20.h,
                            child: Text(
                              "${mc.errorMessage}",
                              style: TextStyle(
                                fontFamily: proximanovaregular,
                                color: Colors.redAccent,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
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
                        routeName: PageName.signupPage,
                      ),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: proximanovaregular,
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
            )),
      ],
    );
  }
}
