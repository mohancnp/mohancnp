import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/icons/utility_icons.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/utility_info_widget.dart';
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
            fontFamily: CustomFont.poppinsMedium,
            color: Palette.darkGery,
            fontSize: 16.w,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: GetBuilder<ProfilePageController>(
          init: ProfilePageController(),
          builder: (controller) {
            return controller.newUser.id == 0
                ? Container(
                    width: 375.w,
                    height: 500.h,
                    alignment: Alignment.center,
                    child: UtilityInfoWidget(
                      title: "Profile Couldn't be retreived",
                      content: "Please log back in, and try again!!",
                      onPressed: () => Get.toNamed(PageName.loginpage),
                      svgImageUri: UtilityIcons.noResults,
                      buttonText: "Login",
                    ),
                  )
                : Container(
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
                            color: const Color(0xffFBFBFB),
                            borderRadius:
                                BorderRadius.all(Radius.circular(9.r)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                offset: Offset(0, 4.r),
                                blurRadius: 10.r,
                              )
                            ],
                          ),
                          child: const UserInfoShort(),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 14.h,
                            bottom: 24.h,
                          ),
                          width: 375.w,
                          height: 1,
                          decoration: BoxDecoration(
                            color: const Color(0xffA5A5A5).withOpacity(0.4),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed(PageName.personaldatapage),
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
                                      Icons.person,
                                      color: Palette.darkGery,
                                      size: 18.sp,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 11.sp,
                                      ),
                                      child: Text(
                                        "Personal Data",
                                        style: TextStyle(
                                          color: Palette.darkGery,
                                          fontSize: 13.5,
                                          fontWeight: FontWeight.w400,
                                        ),
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
                                      Icons.favorite,
                                      color: Palette.pagebackgroundcolor,
                                      size: 18.sp,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 11.w,
                                      ),
                                      child: Text(
                                        "My Favorites",
                                        style: TextStyle(
                                          color: Palette.pagebackgroundcolor,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.power,
                                          color: Palette.darkGery,
                                          size: 16.r,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: 12.w,
                                          ),
                                          child: Text(
                                            "Log Out",
                                            style: TextStyle(
                                              color: Palette.darkGery,
                                              fontSize: 13.5.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      CupertinoIcons.forward,
                                      color: Palette.darkGery,
                                      size: 20.w,
                                    ),
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
