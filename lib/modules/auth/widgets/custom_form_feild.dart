import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFormFeild extends StatelessWidget {
  const CustomFormFeild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
                //        top: 37
                top: 37.h),
            padding: EdgeInsets.only(
                //         horizontal: 24
                left: 24.w,
                right: 3.w),
            //      height: 46,
            height: 46.h,
            width: 375.w,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: BorderRadius.all(Radius.circular(26)),
            ),
            child: TextFormField(
              // controller: membershipnumbercontroller,
              cursorColor: Colors.black87,
              style: TextStyle(
                  fontFamily: poppinsregular,
                  color: Colors.black87,
                  //       fontSize: 13.5
                  fontSize: 13.sp),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  FeatherIcons.user,
                  color: Color(0xff404d4d),
                  //                 size: 18,
                  size: 18.sp,
                ),
                border: InputBorder.none,
                hintText: 'Membership No.',
                hintStyle: TextStyle(
                    fontFamily: poppinsregular, color: Color(0xff404d4d)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                //        top: 37
                top: 37.h),
            padding: EdgeInsets.only(
                //         horizontal: 24
                left: 24.w,
                right: 3.w),
            //      height: 46,
            height: 46.h,
            width: 375.w,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: BorderRadius.all(Radius.circular(26.r)),
            ),
            child: TextFormField(
              onChanged: (v) {
                // if (passwordcontroller.text != "") {
                //   eye = true;
                //   update();
                // }
                // if (passwordcontroller.text == "") {
                //   eye = false;
                //   update();
                // }
              },
              // obscureText: ,
              // controller: passwordcontroller,
              cursorColor: Colors.black87,
              style: TextStyle(
                  fontFamily: poppinsregular,
                  color: Colors.black87,
                  //       fontSize: 13.5
                  fontSize: 13.sp),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                    onTap: () {
                      // showpassword = !showpassword;
                      // update();
                    },
                    child: Icon(
                      //   passwordcontroller.text == ""
                      //       ? FeatherIcons.lock
                      //       : showpassword
                      FeatherIcons.eyeOff,
                      //  FeatherIcons.eye,
                      color: Color(0xff404d4d),
                      //             size: 18,
                      size: 18.w,
                    )),
                border: InputBorder.none,
                hintText: 'Password',
                hintStyle: TextStyle(
                    fontFamily: poppinsregular, color: Color(0xff404d4d)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
