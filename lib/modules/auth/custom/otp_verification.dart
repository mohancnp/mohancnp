import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/login_singup_back_image.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/auth_btn.dart';
import 'package:metrocoffee/ui/src/palette.dart';

import 'otp_verification_controller.dart';

class OtpVerificationPage extends StatelessWidget {
  OtpVerificationPage({Key? key}) : super(key: key);

  final controller = Get.put(OtpVerificationController());
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
              onPressed: () => Get.back(),
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
                    "Enter Code",
                    style: TextStyle(
                      fontFamily: freightbold,
                      color: Colors.white,
                      fontSize: 42.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Enter the password reset code provided in the email to change password.",
                    style: TextStyle(
                      fontFamily: proximanovaregular,
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10.h),
                  OtpTextField(
                    numberOfFields: 4,
                    fieldWidth: 64.w,
                    textStyle: TextStyle(color: Colors.white),
                    borderColor: Palette.darkGery,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    focusedBorderColor: Palette.deepOrange,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.verificationCode = verificationCode;
                    }, // end onSubmit
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: List.generate(
                  //     controller.textEditingControllerList.length,
                  //     (index) => OtpCodeBox(
                  //       index: index,
                  //     ),
                  //   ),
                  // ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: SizedBox(
                        height: 20.h,
                        child: Text(
                          "${controller.errorMessage}",
                          style: TextStyle(
                            fontFamily: proximanovaregular,
                            color: Colors.redAccent,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: AuthBtn(
                      centerBtnText: "VERIFY",
                      onpressed: controller.verifyOTPandNavigate,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 13.h, left: 10.w),
                  //   alignment: Alignment.center,
                  //   child: Text(
                  //     "Remember Password?",
                  //     style: TextStyle(
                  //         fontFamily: proximanovaregular,
                  //         color: Colors.white70,
                  //         fontSize: 14.sp),
                  //   ),
                  // ),
                  // GestureDetector(
                  //   onTap: () => controller.navigateToRoute(
                  //     routeName: PageName.loginpage,
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       "Login",
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.bold,
                  //         fontFamily: proximanovaregular,
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
      ],
    );
  }
}
