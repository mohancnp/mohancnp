import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/placeholder_image.dart';
import 'package:metrocoffee/modules/auth/custom/password/forgot_password_page_controller.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/auth_btn.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/custom_textfeild.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/error_display.dart';
import 'package:metrocoffee/ui/src/fonts.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final controller = Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    return Stack(
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
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(0.14),
            leading: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: Get.back,
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
              child: Form(
                key: controller.sendCodeForm,
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
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontFamily: CustomFont.freightDispBold,
                        color: Colors.white,
                        fontSize: 42.sp,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Enter the email address you used in the intial registration process.",
                      style: TextStyle(
                        fontFamily: CustomFont.proximaNovaRegular,
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextFormFeild(
                          controller: controller.emailEditingController,
                          validator: controller.validateEmail,
                          hintText: "Email Address",
                          suffixIcon: Icon(
                            Icons.mail,
                            size: 18.sp,
                          ),
                        ),
                        Obx(
                          () => controller.errorMessage.isNotEmpty
                              ? CustomErrorWidget(
                                  message: controller.errorMessage.value,
                                )
                              : const SizedBox(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: AuthBtn(
                            centerBtnText: "SEND CODE",
                            onpressed: controller.sendOtpInEmail,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(top: 12.h, left: 10.w),
                    //   alignment: Alignment.center,
                    //   child: Text(
                    //     "Remember Password ?",
                    //     style: TextStyle(
                    //         fontFamily: CustomFont.proximaNovaRegular,
                    //         color: Colors.white70,
                    //         fontSize: 14.sp),
                    //   ),
                    // ),
                    // GestureDetector(
                    //   onTap: () => controller.navigateToPageName(
                    //     PageNameName: PageName.loginpage,
                    //   ),
                    //   child: Center(
                    //     child: Text(
                    //       "Login",
                    //       style: TextStyle(
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold,
                    //         fontFamily: CustomFont.proximaNovaRegular,
                    //         decoration: TextDecoration.underline,
                    //         fontSize: 16.sp,
                    //         decorationColor: Colors.white,
                    //         height: 1.7,
                    //         decorationStyle: TextDecorationStyle.solid,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
