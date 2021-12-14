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

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailEditingController = TextEditingController();

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
                  "Forgot Password?",
                  style: TextStyle(
                    fontFamily: freightbold,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 40.sp,
                  ),
                ),
                Text(
                  "Enter the email address you used in the intial registration process.",
                  style: TextStyle(
                    fontFamily: proximanovaregular,
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
                FormFeildSkeleton(
                  child: Center(
                    child: TextFormField(
                      controller: emailEditingController,
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
                        hintText: 'Email Address',
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
                    centerBtnText: "SEND INSTRUCTION",
                    onpressed: () => null,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text(
                    "Remember Password? ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => null,
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
        ],
      ),
    );
  }
}
