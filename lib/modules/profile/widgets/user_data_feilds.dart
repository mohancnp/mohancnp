import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/modules/profile/personal_data_page_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDataFeildWidget extends StatelessWidget {
  UserDataFeildWidget({Key? key}) : super(key: key);

  final controller = Get.find<PersonalDataPageController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 4.w,
                ),
                child: Text(
                  "Your First Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.w,
                    color: Palette.darkGery.withOpacity(0.95),
                  ),
                ),
              )
            ],
          ),
          Container(
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
              keyboardType: TextInputType.name,
              validator: controller.validateName,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.w,
                color: const Color(
                  0xff1A1C1C,
                ),
              ),
              cursorColor: const Color(0xff1A1C1C),
              controller: controller.firstNamecontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.w,
                  color: const Color(0xff1A1C1C).withOpacity(0.78),
                ),
                hintText: "Robert Fox",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 4.w,
                ),
                child: Text(
                  "Your Last Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.w,
                    color: Palette.darkGery.withOpacity(0.95),
                  ),
                ),
              )
            ],
          ),
          Container(
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
              keyboardType: TextInputType.name,
              validator: controller.validateName,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.w,
                color: const Color(
                  0xff1A1C1C,
                ),
              ),
              cursorColor: const Color(0xff1A1C1C),
              controller: controller.lastNamecontroller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.w,
                  color: const Color(0xff1A1C1C).withOpacity(0.78),
                ),
                hintText: "Robert Fox",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 4.w),
                child: Text(
                  "Current password",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.w,
                    color: Palette.darkGery.withOpacity(0.95),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(PageName.changepasswordpage),
                child: Container(
                  margin: EdgeInsets.only(left: 4.w),
                  child: Text(
                    "Change Password",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      fontSize: 12.w,
                      color: Palette.coffeeColor,
                    ),
                  ),
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () => Get.toNamed(PageName.changepasswordpage),
            child: Container(
              margin: EdgeInsets.only(
                top: 8.h,
                bottom: 18.h,
              ),
              padding: EdgeInsets.only(left: 12.w),
              width: 375.w,
              decoration: BoxDecoration(
                color: const Color(0xffF9F9F9),
                borderRadius: const BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: TextField(
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.w,
                  color: const Color(0xff1A1C1C),
                ),
                cursorColor: const Color(0xff1A1C1C),
                obscureText: controller.obscurecurrentpassword,
                controller: controller.currentpasswordcontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabled: false,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.setcurrentpasswordview();
                    },
                    child: Icon(
                      controller.obscurecurrentpassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: const Color(0xff1A1C1C).withOpacity(0.85),
                      size: 16.w,
                    ),
                  ),
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.w,
                    color: const Color(0xff1A1C1C).withOpacity(0.78),
                  ),
                  hintText: "Type a strong password",
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 4.w),
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.w,
                    color: Palette.darkGery.withOpacity(0.95),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 8.h,
              bottom: 18.h,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            width: 375.w,
            decoration: BoxDecoration(
              color: const Color(0xffF9F9F9),
              borderRadius: const BorderRadius.all(Radius.circular(9)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: TextFormField(
              validator: controller.validateEmail,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.w,
                color: const Color(0xff1A1C1C),
              ),
              cursorColor: const Color(0xff1A1C1C),
              controller: controller.emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.w,
                  color: const Color(0xff1A1C1C).withOpacity(0.78),
                ),
                hintText: "robertfox@gmail.com",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 4.w),
                child: Text(
                  "Your Job",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.w,
                    color: Palette.darkGery.withOpacity(0.95),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 8.h,
              bottom: 18.h,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            width: 375.w,
            decoration: BoxDecoration(
                color: const Color(0xffF9F9F9),
                borderRadius: const BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 3))
                ]),
            child: TextField(
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.w,
                color: const Color(0xff1A1C1C),
              ),
              cursorColor: const Color(0xff1A1C1C),
              controller: controller.jobcontroller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.w,
                  color: const Color(0xff1A1C1C).withOpacity(0.78),
                ),
                hintText: "Graphic Designer",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 4.w),
                child: Text(
                  "Phone Number",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.w,
                    color: Palette.darkGery.withOpacity(0.95),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 8.h,
              bottom: 18.h,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            width: 375.w,
            decoration: BoxDecoration(
              color: const Color(0xffF9F9F9),
              borderRadius: const BorderRadius.all(Radius.circular(9)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: TextFormField(
              validator: controller.phoneValidator,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.w,
                color: const Color(0xff1A1C1C),
              ),
              cursorColor: const Color(0xff1A1C1C),
              controller: controller.phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.w,
                  color: const Color(0xff1A1C1C).withOpacity(0.78),
                ),
                hintText: "980989435",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 4.w),
                child: Text(
                  "Membership",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.w,
                    color: Palette.darkGery.withOpacity(0.95),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 8.h,
              bottom: 18.h,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            width: 375.w,
            decoration: BoxDecoration(
              color: const Color(0xffF9F9F9),
              borderRadius: const BorderRadius.all(Radius.circular(9)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: TextField(
              enabled: false,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.w,
                color: const Color(0xff1A1C1C),
              ),
              cursorColor: const Color(0xff1A1C1C),
              controller: controller.membershipcontroller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.w,
                  color: const Color(0xff1A1C1C).withOpacity(0.78),
                ),
                hintText: "Gold Member",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 4.w),
                child: Text(
                  "Gender",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.w,
                    color: Palette.darkGery.withOpacity(0.95),
                  ),
                ),
              )
            ],
          ),
          Container(
            width: 375.w,
            margin: EdgeInsets.only(top: 8.h, bottom: 18.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.setgender('male');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    width: 140.w,
                    height: 34.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffF9F9F9),
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          controller.gender == 'male'
                              ? CupertinoIcons.largecircle_fill_circle
                              : CupertinoIcons.circle,
                          color: controller.gender == 'male'
                              ? const Color(0xff1A1C1C)
                              : Colors.grey,
                          size: 18.w,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.w),
                          child: Text(
                            "Male",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.w,
                              color: const Color(0xff1A1C1C),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.setgender('female');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    width: 140.w,
                    height: 34.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffF9F9F9),
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10.r,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          controller.gender == 'female'
                              ? CupertinoIcons.largecircle_fill_circle
                              : CupertinoIcons.circle,
                          color: controller.gender == 'female'
                              ? const Color(0xff1A1C1C)
                              : Colors.grey,
                          size: 18.w,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 8.w,
                          ),
                          child: Text(
                            "Female",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.w,
                              color: const Color(0xff1A1C1C),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
