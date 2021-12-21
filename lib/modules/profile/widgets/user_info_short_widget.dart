import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/models/older/user_model.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/config.dart';
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
        GetX<ProfilePageController>(
          builder: (controller) {
            User user = controller.newUser;
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
                      width: 2.5,
                    ),
                  ),
                  child: user.imageUri == null
                      ? Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            controller.getImagePlacholder(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Palette.textColor,
                            ),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(32.r),
                          child: Image.network(
                            "${AppConfig.baseUrl}/${user.imageUri}",
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
                            errorBuilder: (a, b, c) =>
                                const Center(child: Text("Error")),
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
                          fontSize: 11.5.sp,
                           
                        ),
                      ),
                      Text(
                        user.name == null ? " " : "${user.name}",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Palette.darkGery,
                           
                          fontSize: 14.5.sp,
                        ),
                      ),
                      Text(
                        user.email == null ? " " : "${user.email}",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Palette.darkGery,
                          fontSize: 11.5.sp,
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
                          width: 2.5,
                        )),
                    child: Obx(
                      () {
                        final profileController =
                            Get.find<ProfilePageController>();
                        return Center(
                          child: Text(
                            profileController.newUser.points == null
                                ? "0"
                                : "${profileController.newUser.points}",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Palette.darkGery,
                              fontSize: 12.sp,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 25.r,
                    width: 25.r,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: const Color(0xff5AB898), width: 2.5.w),
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
