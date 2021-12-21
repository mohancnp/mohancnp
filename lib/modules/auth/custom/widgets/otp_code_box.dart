import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/auth/custom/otp_verification_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpCodeBox extends StatelessWidget {
  final int index;
  const OtpCodeBox({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpVerificationController>(
      builder: (controller) {
        return Container(
          height: 64.w,
          width: 64.w,
          decoration: BoxDecoration(
            color: Palette.otpContainer,
            border: Border.all(
              width: 2.w,
              color: controller.textEditingControllerList[index].text.isEmpty
                  ? Palette.otpContainerBorder
                  : Palette.deepOrange,
            ),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: TextFormField(
            keyboardType: TextInputType.text,
            maxLines: 1,
            maxLength: 1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24.sp),
            decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              counterText: "",
            ),
            controller: controller.textEditingControllerList[index],
            onChanged: (data) {
              // print("unchanged called");
              controller.update();
            },
            focusNode: controller.customFocusNodeList[index],
            onFieldSubmitted: (data) {
              if (index < 3) {
                controller.customFocusNodeList[index + 1].requestFocus();
              }
            },
          ),
        );
      },
    );
  }
}
