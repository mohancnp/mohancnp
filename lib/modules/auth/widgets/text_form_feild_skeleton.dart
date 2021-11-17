import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormFeildSkeleton extends StatelessWidget {
  final Widget child;

  const FormFeildSkeleton({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 36.h,
      ),
      padding: EdgeInsets.only(
        left: 24.w,
        right: 3.w,
      ),
      height: 46.h,
      width: 375.w,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.all(Radius.circular(26.r)),
      ),
      child: child,
    );
  }
}
