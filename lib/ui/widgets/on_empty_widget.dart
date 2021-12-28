import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metrocoffee/core/constants/icons/utility_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyDataWidget extends StatelessWidget {
  final String message;
  const EmptyDataWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            UtilityIcons.emptyCart,
            width: 216.w,
            height: 96.h,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.h),
          Text(message),
        ],
      ),
    );
  }
}
