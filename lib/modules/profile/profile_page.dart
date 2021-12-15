import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'widgets/user_info_short_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final profileController = Get.find<ProfilePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "PROFILE",
          style: TextStyle(
            fontFamily: poppinsmedium,
            color: Palette.darkGery,
            fontSize: 16.w,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: GetBuilder<ProfilePageController>(
          init: ProfilePageController(),
          initState: (v) {
            if (profileController.newUser.name == null)
              profileController.getProfile();
          },
          builder: (controller) {
            return Container(
              width: 375.w,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 12.h,
                    ),
                    margin: EdgeInsets.only(
                      bottom: 20.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xffFBFBFB),
                      borderRadius: BorderRadius.all(Radius.circular(9.r)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          offset: Offset(0, 3.r),
                          blurRadius: 10.r,
                        )
                      ],
                    ),
                    child: UserInfoShort(),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 14.h,
                      bottom: 24.h,
                    ),
                    width: 375.w,
                    height: 1,
                    decoration: BoxDecoration(
                      color: Color(0xffA5A5A5).withOpacity(0.4),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //TODO: ADD navigation to personal data page
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 14.h,
                        horizontal: 12.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10.r,
                            offset: Offset(0, 3.r),
                          )
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                FeatherIcons.user,
                                color: Palette.darkGery,
                                size: 18.sp,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 11.sp,
                                ),
                                child: Text(
                                  "Personal Data",
                                  style: getpoppins(TextStyle(
                                    color: Palette.darkGery,
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w400,
                                  )),
                                ),
                              )
                            ],
                          ),
                          Icon(
                            CupertinoIcons.forward,
                            color: Palette.darkGery,
                            size: 20.w,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //TODO: Add implementation for navigation to favorites list page
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 20.h,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 14.h,
                        horizontal: 12.w,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10.r,
                                offset: Offset(0, 3.r))
                          ],
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.r))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                FeatherIcons.heart,
                                color: Color(0xff404D4D),
                                size: 18.sp,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  left: 11.w,
                                ),
                                child: Text(
                                  "My Favorites",
                                  style: getpoppins(
                                    TextStyle(
                                      color: Color(0xff404D4D),
                                      fontSize: 13.5.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Icon(
                            CupertinoIcons.forward,
                            color: Palette.darkGery,
                            size: 20.sp,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 14.h),
                    child: SizedBox(
                      child: GestureDetector(
                        onTap: profileController.logout,
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 20.h,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 14.h,
                            horizontal: 12.w,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10.r,
                                offset: Offset(0, 3.r),
                              )
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    FeatherIcons.logOut,
                                    color: Palette.darkGery,
                                    size: 18.r,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 11.w,
                                    ),
                                    child: Text(
                                      "Log Out",
                                      style: getpoppins(TextStyle(
                                        color: Palette.darkGery,
                                        fontSize: 13.5.sp,
                                        fontWeight: FontWeight.w400,
                                      )),
                                    ),
                                  )
                                ],
                              ),
                              Icon(
                                CupertinoIcons.forward,
                                color: Palette.darkGery,
                                size: 20.w,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
