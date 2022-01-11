import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/gender.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/modules/profile/personal_data_page_controller.dart';
import 'package:metrocoffee/modules/profile/widgets/personal_data_feilds.dart';
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
          PersonalDataFeild(
            textEditingController: controller.firstNamecontroller,
            textInputType: TextInputType.name,
            hintText: 'Robert',
            validation: controller.validateName,
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
          PersonalDataFeild(
            textEditingController: controller.lastNamecontroller,
            textInputType: TextInputType.name,
            hintText: 'Fox',
            validation: controller.validateName,
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
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: TextField(
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.w,
                  color: Palette.userDataFeildColor,
                ),
                cursorColor: Palette.userDataFeildColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  enabled: false,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.w,
                    color: Palette.userDataFeildColor.withOpacity(0.78),
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
          PersonalDataFeild(
            hintText: 'john.doe@4gmail.com',
            textEditingController: controller.emailcontroller,
            enabled: false,
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
          PersonalDataFeild(
            textEditingController: controller.phoneController,
            textInputType: TextInputType.phone,
            hintText: '9876452953',
            validation: controller.phoneValidator,
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
          const PersonalDataFeild(
            hintText: 'Gold Member',
            enabled: false,
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
                    controller.setgender(Gender.male);
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
                          controller.gender == Gender.male
                              ? CupertinoIcons.largecircle_fill_circle
                              : CupertinoIcons.circle,
                          color: controller.gender == Gender.male
                              ? Palette.userDataFeildColor
                              : Colors.grey,
                          size: 18.w,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8.w),
                          child: Text(
                            'Male',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.w,
                              color: Palette.userDataFeildColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.setgender(Gender.female);
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
                          controller.gender == Gender.female
                              ? CupertinoIcons.largecircle_fill_circle
                              : CupertinoIcons.circle,
                          color: controller.gender == Gender.female
                              ? Palette.userDataFeildColor
                              : Colors.grey,
                          size: 18.w,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 8.w,
                          ),
                          child: Text(
                            'Female',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.w,
                              color: Palette.userDataFeildColor,
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
