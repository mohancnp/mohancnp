import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/login_singup_back_image.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/modules/auth/custom/email/email_auth_controller.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/sign_in_btn.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/text_form_feild_skeleton.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/welcome_text.dart';
import 'package:metrocoffee/resource/app_config.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';

class EmailSignUpPage extends StatelessWidget {
  EmailSignUpPage({Key? key}) : super(key: key);

  final emailAuthController = Get.find<EmailAuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SizedBox(
          width: 375.w,
          height: 812.h,
          child: Stack(
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
                      Colors.black.withOpacity(0.14),
                      Colors.black.withOpacity(0.8)
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 30.h,
                bottom: 0.h,
                child: SizedBox(
                  width: 375.w,
                  // height: 812.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () => Get.back(),
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
                        SizedBox(height: 40.h),
                        const WelcomeTextWidget(),
                        FormFeildSkeleton(
                          child: Center(
                            child: TextFormField(
                              controller: emailAuthController
                                  .firstNameEditingController,
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
                                  color: Palette.darkGery,
                                  size: 18.sp,
                                ),
                                border: InputBorder.none,
                                hintText: 'First Name',
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
                              controller: emailAuthController
                                  .lastNameEditingController,
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
                                  color: Palette.darkGery,
                                  size: 18.sp,
                                ),
                                border: InputBorder.none,
                                hintText: 'Last Name',
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
                                  emailAuthController.emailEditingController,
                              cursorColor: Colors.black87,
                              style: TextStyle(
                                fontFamily: poppinsregular,
                                color: Colors.black87,
                                fontSize: 13.sp,
                                height: 1.8,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  FeatherIcons.mail,
                                  color: Palette.darkGery,
                                  size: 18.sp,
                                ),
                                border: InputBorder.none,
                                hintText: 'Email Address',
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
                              controller: emailAuthController
                                  .passwordEditingController,
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
                                  FeatherIcons.eye,
                                  color: Palette.darkGery,
                                  size: 18.sp,
                                ),
                                border: InputBorder.none,
                                hintText: 'Password',
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
                              controller: emailAuthController
                                  .rePasswordEditingController,
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
                                  FeatherIcons.eye,
                                  color: Palette.darkGery,
                                  size: 18.sp,
                                ),
                                border: InputBorder.none,
                                hintText: 'Re-Password',
                                hintStyle: TextStyle(
                                  fontFamily: poppinsregular,
                                  color: Palette.darkGery,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 28.h,
                        ),
                        Center(
                          child: AuthBtn(
                            centerBtnText: "REGISTER",
                            onpressed: () =>
                                emailAuthController.navigateToRoute(
                              routeName: PageName.paymentspage,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child: Text(
                            "Already have an account? ",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Center(
                            child: Text(
                              "Login",
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
