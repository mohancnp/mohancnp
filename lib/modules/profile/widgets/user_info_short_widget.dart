import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/models/user_model.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';

import 'topup_reward_dialog.dart';

class UserInfoShort extends StatelessWidget {
  const UserInfoShort({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GetX<ProfilePageController>(builder: (controller) {
          User user = controller.newUser;
          print("$baseUrl${user.imageUri}");

          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //     height: 100, width: 100,
                height: screenwidth * 0.1733,
                width: screenwidth * 0.1733,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
                child: user.imageUri == null
                    ? Image.asset(
                        "assets/images/profilep.png",
                        fit: BoxFit.cover,
                      )
                    : ClipRRect(
                        borderRadius:
                            BorderRadius.circular(screenwidth * 0.1733 * 0.5),
                        child: Image.network(
                          "$baseUrl${user.imageUri}",
                          fit: BoxFit.cover,
                          height: screenwidth * 0.1733,
                          width: screenwidth * 0.1733,
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
                  height: screenwidth * 0.1449,
                  margin: EdgeInsets.only(
                      //        left: 12
                      left: screenwidth * 0.0291),
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
                            fontSize: screenwidth * 0.0279)),
                      ),
                      Text(
                        user.name == null ? " " : "${user.name}",
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff404D4D),
                            //         fontSize: 14.5
                            fontSize: screenwidth * 0.03527)),
                      ),
                      Text(
                        user.email == null ? " " : "${user.email}",
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Color(0xff404D4D),
                            //         fontSize: 11.5
                            fontSize: screenwidth * 0.0279)),
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
              height: screenwidth * 0.1559,
              width: screenwidth * 0.1559,
              child: Stack(children: [
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                        //                      height: 60, width: 60,
                        height: screenwidth * 0.1459,
                        width: screenwidth * 0.1459,
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
                                  fontSize: screenwidth * 0.0313)),
                            );
                          }),
                        ))),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      //                                height: 25,width: 25,
                      height: screenwidth * 0.0608,
                      width: screenwidth * 0.0608,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Color(0xff5AB898), width: 2.5)),
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
