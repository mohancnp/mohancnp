import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/custom_button.dart';

class RedirectionPage extends StatelessWidget {
  const RedirectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Palette.pagebackgroundcolor,
      child: SizedBox(
        width: 375.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "User not Recognized",
              style: getpoppins(
                TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Palette.textColor),
              ),
            ),
            Text("This content is available  only for authenticated  user.",
                textAlign: TextAlign.center,
                style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: Palette.textColor))),
            SizedBox(height: 50.h),
            CustomReusableBtn(
              buttonText: "Proceed to Login",
              width: 300.w,
              height: 50.h,
              onPressed: () => Get.toNamed(PageName.loginpage),
            )
          ],
        ),
      ),
    );
  }
}
