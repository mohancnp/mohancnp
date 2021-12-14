import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/sign_in_btn.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/text_form_feild_skeleton.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/welcome_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Scaffold(
      body: Column(
        children: [
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
          const WelcomeTextWidget(),
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
                  hintText: 'Email',
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
    );
  }
}
