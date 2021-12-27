import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/placeholder.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/auth_btn.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/custom_textfeild.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/error_display.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'reset_password_controller.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({Key? key}) : super(key: key);

  final controller = Get.put(ResetPasswordPageController());
  @override
  Widget build(BuildContext context) {
    return Material(
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
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Form(
              key: controller.resetPassKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: Get.back,
                    icon: Icon(
                      CupertinoIcons.back,
                      color: Colors.white,
                      size: 28.w,
                    ),
                  ),
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
                  SizedBox(height: 50.h),
                  Text(
                    "Reset Password",
                    style: TextStyle(
                      fontFamily: CustomFont.freightDispBold,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 40.sp,
                    ),
                  ),
                  Text(
                    "Your new password should be different from the previous password",
                    style: TextStyle(
                      fontFamily: CustomFont.proximaNovaRegular,
                      color: Colors.white,
                      fontSize: 12.sp,
                    ),
                  ),
                  GetBuilder<ResetPasswordPageController>(
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
                  }),
                  Obx(
                    () => controller.passwordErrorMessage.isNotEmpty
                        ? CustomErrorWidget(
                            message: controller.passwordErrorMessage.value,
                          )
                        : const SizedBox(),
                  ),
                  GetBuilder<ResetPasswordPageController>(
                      builder: (controller) {
                    return CustomTextFormFeild(
                      controller: controller.passwordConfirmEditingController,
                      hintText: "Confirm Password",
                      validator: controller.validateConfirmPassword,
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
                  }),
                  Obx(
                    () => controller.confirmErrorMessage.isNotEmpty
                        ? CustomErrorWidget(
                            message: controller.confirmErrorMessage.value,
                          )
                        : const SizedBox(),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: AuthBtn(
                      centerBtnText: "CHANGE PASSWORD",
                      onpressed: controller.changePassword,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
