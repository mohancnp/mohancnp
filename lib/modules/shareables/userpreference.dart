import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class UserPreference extends StatelessWidget {
  final void Function() onPressedFirst;
  final void Function() onPressedSecond;
  final String firstText;
  final String secondText;
  final String question;

  UserPreference({Key? key,required this.question,required this.onPressedFirst,required this.firstText,required this.secondText, required this.onPressedSecond})
      : super(key: key);
      
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(18.r)),
        child: Material(
            child: Container(
          width: 286.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(18.r)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  height: 115.h,
                  width: 375.w,
                  child: Stack(children: [
                    Positioned(
                        right: -55.w,
                        top: -60.h,
                        child: Image.asset(
                          "assets/images/nathan-dumlao-ikU3J1nr52w-unsplash@3x.png",
                          width: 162.w,
                          fit: BoxFit.cover,
                          
                        ))
                  ])),
              Center(
                  child: SizedBox(
                child: Text(
                  "$question",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.4,
                      fontFamily: montserratsemibold,
                      color: Color(0xff2A3434),
                      fontSize: 17.sp),
                ),
              )),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap:onPressedFirst,
                child: Container(

                  width: 185.w, height: 36.h,
                  decoration: BoxDecoration(
                      color: Palette.coffeeColor,
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffC3916A).withOpacity(0.2),
                          blurRadius: 30.r,
                          offset: Offset(0, 9.h),
                        )
                      ]),
                  child: Center(
                    child: Text(
                      "$firstText",
                      textAlign: TextAlign.center,
                      style: getpoppins(TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          
                          fontSize: 13.5.sp)),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: onPressedSecond,
                child: Container(
                  margin: EdgeInsets.only(

                      top: 16.h),

                  width: 185.w, height: 36.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Palette.coffeeColor,
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffC3916A).withOpacity(0.2),
                            blurRadius: 30.r,
                            offset: Offset(0, 9.h))
                      ]),
                  child: Center(
                    child: Text(
                      "$secondText",
                      textAlign: TextAlign.center,
                      style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Palette.coffeeColor,
                        
                        fontSize: 13.5.sp,
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 115.h,
                  width: 375.w,
                  child: Stack(children: [
                    Positioned(
                        left: -55.w,
                        bottom: -60.h,
                        child: Image.asset(
                          "assets/images/nathan-dumlao-ikU3J1nr52w-unsplash@3x.png",
                          width: 162.w,
                        ))
                  ])),
            ],
          ),
        )));
  }
}
