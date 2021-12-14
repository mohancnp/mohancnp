import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/login_singup_back_image.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/sign_in_btn.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/text_form_feild_skeleton.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final passwordEditingController = TextEditingController();
  final passwordConfirmEditingController = TextEditingController();

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 28.w,
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(height: 20.h),
                Text(
                  "Reset Password",
                  style: TextStyle(
                    fontFamily: freightbold,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 40.sp,
                  ),
                ),
                Text(
                  "Your new password should be different from the previous password",
                  style: TextStyle(
                    fontFamily: proximanovaregular,
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
                FormFeildSkeleton(
                  child: Center(
                    child: TextFormField(
                      controller: passwordEditingController,
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
                        hintText: 'New Password',
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
                      controller: passwordConfirmEditingController,
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
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(
                          fontFamily: poppinsregular,
                          color: Palette.darkGery,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Center(
                  child: AuthBtn(
                    centerBtnText: "CHANGE PASSWORD",
                    onpressed: () => null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
