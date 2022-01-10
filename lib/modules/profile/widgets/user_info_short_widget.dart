import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/models/user_profile.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';

import 'topup_reward_dialog.dart';

class UserInfoShort extends StatelessWidget {
  UserInfoShort({
    Key? key,
  }) : super(key: key);
  final controller = Get.find<ProfilePageController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GetX<ProfilePageController>(
          init: ProfilePageController(),
          builder: (controller) {
            UserProfile user = controller.newUser;
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 64.r,
                  width: 64.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(32.r)),
                    border: Border.all(
                      color: const Color(0xff5AB898),
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32.r),
                    child: Image.network(
                      "${AppConfig.baseUrl}/${user.image}",
                      fit: BoxFit.cover,
                      height: 64.r,
                      width: 64.r,
                      loadingBuilder: (context, widget, imageProgress) {
                        if (imageProgress == null) {
                          return widget;
                        } else {
                          return const Center(
                            child: Text("Loading"),
                          );
                        }
                      },
                      errorBuilder: (a, b, c) => Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          controller.getImagePlacholder(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.textColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 76.h,
                  margin: EdgeInsets.only(left: 12.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Palette.darkGery,
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        "${user.firstName} ${user.lastName} ",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Palette.darkGery,
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        user.email,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Palette.darkGery,
                          fontSize: 12.sp,
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) {
                return const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  child: SimpleDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    children: [
                      TopUpRewardDialog(),
                    ],
                  ),
                );
              },
            );
          },
          child: SizedBox(
            height: 60.r,
            width: 60.r,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    height: 60.r,
                    width: 60.r,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xff5AB898),
                          width: 2,
                        )),
                    child: Center(
                      child: Text(
                        "000",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Palette.darkGery,
                            fontSize: 12.sp,
                            fontFamily: CustomFont.poppinsRegular),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 24.r,
                    width: 24.r,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: const Color(0xff5AB898), width: 2.w),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/images/badge.svg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
