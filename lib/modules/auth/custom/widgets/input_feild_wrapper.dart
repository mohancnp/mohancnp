import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormFieldWrapper extends StatelessWidget {
  final Widget child;
  final bool hasError;
  const FormFieldWrapper({Key? key, required this.child, this.hasError = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 20.h,
          ),
          padding: EdgeInsets.only(
            left: 24.w,
            right: 3.w,
          ),
          height: 50.h,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.85),
            borderRadius: BorderRadius.all(
              Radius.circular(
                26.r,
              ),
            ),
          ),
          child: child,
        ),
        // !hasError
        //     ? Center(
        //         child: Row(
        //           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           // mainAxisSize: MainAxisSize.max,

        //           children: [
        //             Text(
        //               "some text here",
        //               style: TextStyle(color: Colors.white),
        //             ),
        //             Icon(
        //               Icons.error,
        //               color: Colors.red,
        //               size: 16.sp,
        //             ),
        //           ],
        //         ),
        //       )
        //     : SizedBox(),
      ],
    );
  }
}
