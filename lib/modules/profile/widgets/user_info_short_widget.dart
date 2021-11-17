import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/models/user_model.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'topup_reward_dialog.dart';

class UserInfoShort extends StatelessWidget {
  const UserInfoShort({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GetX<ProfilePageController>(builder: (controller) {
          User user = controller.newUser;
          var firstLetter = "N";
          var secondLetter = "/A";
          if (user.imageUri == null && user.name != null) {
            firstLetter = user.name!.substring(0, 1).toUpperCase();
            secondLetter =
                user.name!.split(" ")[1].substring(0, 1).toUpperCase();
          }

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
                    color: Color(0xff5AB898),
                    width: 2.5,
                  ),
                ),
                child: user.imageUri == null
                    ? Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "$firstLetter $secondLetter ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.textColor,
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(32.r),
                        child: Image.network(
                          "$baseUrl${user.imageUri}",
                          fit: BoxFit.cover,
                          height: 64.r,
                          width: 64.r,
                          loadingBuilder: (context, widget, imageProgress) {
                            if (imageProgress == null) {
                              return widget;
                            } else {
                              return Center(
                                child: Text("Loading"),
                              );
                            }
                          },
                          errorBuilder: (a, b, c) =>
                              Center(child: Text("Error")),
                        ),
                      ),
              ),
              Container(
                  //  height: 76,
                  height: 76.h,
                  margin: EdgeInsets.only(
                      //        left: 12
                      left: 12.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: getpoppins(TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color(0xff404D4D),
                          //       fontSize: 11.5
                          fontSize: 11.5.sp,
                        )),
                      ),
                      Text(
                        user.name == null ? " " : "${user.name}",
                        style: getpoppins(
                          TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff404D4D),
                              //         fontSize: 14.5
                              fontSize: 14.5.sp),
                        ),
                      ),
                      Text(
                        user.email == null ? " " : "${user.email}",
                        style: getpoppins(
                          TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Color(0xff404D4D),
                              //         fontSize: 11.5
                              fontSize: 11.5.sp),
                        ),
                      )
                    ],
                  ))
            ],
          );
        }),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (_) {
                  return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      child: SimpleDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                          children: [TopUpRewardDialog()]));
                });
          },
          child: Container(
              height: 60.r,
              width: 60.r,
              child: Stack(children: [
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                        //                      height: 60, width: 60,
                        height: 60.r,
                        width: 60.r,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xff5AB898),
                              width: 2.5,
                            )),
                        child: Center(
                          child: Obx(() {
                            final profileController =
                                Get.find<ProfilePageController>();

                            return Text(
                              profileController.newUser.points == null
                                  ? "0"
                                  : "${profileController.newUser.points}",
                              style: getpoppins(TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xff404D4D),
                                //         fontSize: 17
                                fontSize: 17.sp,
                              )),
                            );
                          }),
                        ))),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      //                                height: 25,width: 25,
                      height: 25.r,
                      width: 25.r,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Color(0xff5AB898), width: 2.5.w)),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/images/badge.svg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
              ])),
        )
      ],
    );
  }
}