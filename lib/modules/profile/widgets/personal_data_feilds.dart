import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class PersonalDataFeild extends StatelessWidget {
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validation;
  final String hintText;
  final bool enabled;
  const PersonalDataFeild({
    Key? key,
    this.textEditingController,
    this.validation,
    this.textInputType,
    required this.hintText,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 8.w,
        bottom: 16.h,
      ),
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      width: 375.w,
      decoration: BoxDecoration(
        color: const Color(0xffF9F9F9),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: TextFormField(
        keyboardType: textInputType,
        validator: validation,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12.w,
          color: Palette.userDataFeildColor,
        ),
        cursorColor: Palette.userDataFeildColor,
        controller: textEditingController,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 4.w),
          enabled: enabled,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12.w,
            color: Palette.userDataFeildColor.withOpacity(0.78),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
