import 'package:flutter/material.dart';
import 'package:metrocoffee/ui/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnErrorWidget extends StatelessWidget {
  final String message;
  final void Function()? onPressed;
  const OnErrorWidget({Key? key, required this.message, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 100.h),
        Text(message),
        SizedBox(height:20.h),
        CustomReusableBtn(
          buttonText: "Refresh",
          width: 116.w,
          height: 24.h,
          onPressed: onPressed ?? () {},
        )
      ],
    );
  }
}
