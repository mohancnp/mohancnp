import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/input_feild_wrapper.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class CustomTextFormFeild extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? hasError;
  final Widget suffixIcon;
  final void Function()? onSuffixIconTap;
  final bool obscureText;
  final String? Function(String? value)? validator;

  const CustomTextFormFeild({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.suffixIcon,
    this.onSuffixIconTap,
    this.obscureText = false,
    this.hasError,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormFieldWrapper(
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black87,
        obscureText: obscureText,
        validator: validator,
        style: TextStyle(
          fontFamily: CustomFont.poppinsRegular,
          color: Colors.black87,
          fontSize: 13.sp,
          height: 1.8,
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: onSuffixIconTap,
            child: suffixIcon,
          ),
          contentPadding: EdgeInsets.all(4.0),
          hintText: '$hintText',
          border: InputBorder.none,
          errorStyle: TextStyle(height: 0),
          hintStyle: TextStyle(
            fontFamily: CustomFont.poppinsRegular,
            color: Palette.darkGery,
          ),
        ),
      ),
    );
  }
}
