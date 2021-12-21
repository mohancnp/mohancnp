import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/placeholder_image.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/modules/auth/custom/membership/membership_login_controller.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/auth_btn.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/custom_textfeild.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/error_display.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/welcome_text.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class MembershipLoginPage extends StatelessWidget {
  MembershipLoginPage({Key? key}) : super(key: key);
  final _controller = Get.put(MemberShipLoginController());

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
              key: _controller.loginFormKey,
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
                    padding: EdgeInsets.all(5.w),
                    child: Image.asset(
                      AppConfig.metroCoffeeLogoAssetPath,
                      width: 58.w,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  const WelcomeText(),
                  SizedBox(height: 8.h),
                  GetBuilder<MemberShipLoginController>(
                    init: MemberShipLoginController(),
                    builder: (mc) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextFormFeild(
                            controller: _controller.membershipNumberController,
                            validator: _controller.validateMemberShip,
                            hintText: "Membership no.",
                            suffixIcon: Icon(FeatherIcons.user, size: 18.sp),
                          ),
                          Obx(
                            () => _controller.memberShipErrorMessage.isNotEmpty
                                ? CustomErrorWidget(
                                    message: _controller
                                        .memberShipErrorMessage.value,
                                  )
                                : SizedBox(),
                          ),
                          CustomTextFormFeild(
                            controller: _controller.passwordController,
                            hintText: "Password",
                            validator: _controller.validatePassword,
                            suffixIcon: Icon(
                              _controller.visiblilty
                                  ? FeatherIcons.eye
                                  : FeatherIcons.eyeOff,
                              color: Palette.darkGery,
                              size: 18.sp,
                            ),
                            obscureText: _controller.visiblilty ? false : true,
                            onSuffixIconTap: () {
                              _controller.visiblilty = !_controller.visiblilty;
                            },
                          ),
                          Obx(
                            () => _controller.passwordErrorMessage.isNotEmpty
                                ? CustomErrorWidget(
                                    message:
                                        _controller.passwordErrorMessage.value,
                                  )
                                : SizedBox(),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () => Get.toNamed(PageName.forgotPasswordPage),
                    child: Container(
                      margin: EdgeInsets.only(top: 13.h, left: 10.w),
                      child: Text(
                        "Forgot Password ?",
                        style: TextStyle(
                            fontFamily: CustomFont.proximaNovaRegular,
                            color: Colors.white70,
                            fontSize: 14.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: AuthBtn(
                      centerBtnText: "Sign In",
                      onpressed: _controller.performMembershipLogin,
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
                    onTap: () => _controller.navigateToPageName(
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
    ));
  }
}
