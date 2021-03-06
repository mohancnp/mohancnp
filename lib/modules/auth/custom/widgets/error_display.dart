import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final Color? textColor;
  const CustomErrorWidget({Key? key, required this.message, this.textColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(4.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(color: textColor ?? Colors.white),
            ),
            Icon(
              Icons.error,
              color: Colors.red,
              size: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
