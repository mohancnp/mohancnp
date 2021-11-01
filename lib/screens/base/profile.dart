import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/profile/profile_controller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/screens/widgets/dialogs/topup_reward_dialog.dart';
import 'package:metrocoffee/services/rest/config.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
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
              color: Color(0xff404D4D),
              //         fontSize: 16
              fontSize: screenwidth * 0.0389),
        ),
      ),
      body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            width: screenwidth,
            padding: EdgeInsets.symmetric(horizontal: screenwidth * 0.05839),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      //        horizontal: 8,vertical: 12
                      horizontal: screenwidth * 0.0194,
                      vertical: screenwidth * 0.0291),
                  margin: EdgeInsets.only(
                      //     bottom: 20
                      bottom: screenwidth * 0.0486),
                  decoration: BoxDecoration(
                      color: Color(0xffFBFBFB),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            offset: Offset(0, 3),
                            blurRadius: 10)
                      ]),
                  child: GetBuilder(
                      init: ProfileController(),
                      initState: (k) {
                        controller.getUserData();
                      },
                      builder: (ProfileController profileController) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  //     height: 100, width: 100,
                                  height: screenwidth * 0.1733,
                                  width: screenwidth * 0.1733,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9)),
                                  ),
                                  child: profileController
                                              .newClient?.imageUri ==
                                          null
                                      ? Image.asset(
                                          "assets/images/profilep.png",
                                          fit: BoxFit.cover,
                                        )
                                      : ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              screenwidth * 0.1733 * 0.5),
                                          child: Image.network(
                                            "$baseUrl${profileController.newClient!.imageUri}",
                                            fit: BoxFit.cover,
                                            height: screenwidth * 0.1733,
                                            width: screenwidth * 0.1733,
                                            loadingBuilder:
                                                (context, widget, a) {
                                              return widget;
                                            },
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          profileController.newClient?.name ??
                                              "loading...",
                                          style: getpoppins(TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff404D4D),
                                              //         fontSize: 14.5
                                              fontSize: screenwidth * 0.03527)),
                                        ),
                                        Text(
                                          profileController.newClient?.email ??
                                              "loading...",
                                          style: getpoppins(TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xff404D4D),
                                              //         fontSize: 11.5
                                              fontSize: screenwidth * 0.0279)),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18)),
                                          child: SimpleDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(18)),
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
                                              child: Text(
                                                "${profileController.newClient?.points}",
                                                style: getpoppins(TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff404D4D),
                                                    //         fontSize: 17
                                                    fontSize:
                                                        screenwidth * 0.0313)),
                                              ),
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
                                              border: Border.all(
                                                  color: Color(0xff5AB898),
                                                  width: 2.5)),
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
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(
//                top:14,bottom: 24
                      top: screenwidth * 0.0340,
                      bottom: screenwidth * 0.0583),
                  width: screenwidth,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Color(0xffA5A5A5).withOpacity(0.4),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/PersonalDataPage", (route) => true);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
//                  vertical: 14, horizontal: 12
                        vertical: screenwidth * 0.0340,
                        horizontal: screenwidth * 0.0291),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: Offset(0, 3))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(
                            FeatherIcons.user,
                            color: Color(0xff404D4D),
                            //       size: 18,
                            size: screenwidth * 0.04379,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                //        left: 11
                                left: screenwidth * 0.02676),
                            child: Text(
                              "Personal Data",
                              style: getpoppins(TextStyle(
                                  color: Color(0xff404D4D),
                                  //   fontSize: 13.5,
                                  fontSize: screenwidth * 0.0328,
                                  fontWeight: FontWeight.w400)),
                            ),
                          )
                        ]),
                        Icon(
                          CupertinoIcons.forward,
                          color: Color(0xff404D4D),
                          //     size: 20,
                          size: screenwidth * 0.0486,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/MyOrders", (route) => true);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: screenwidth * 0.0535,
                    ),
                    padding: EdgeInsets.symmetric(
//                  vertical: 14, horizontal: 12
                        vertical: screenwidth * 0.0340,
                        horizontal: screenwidth * 0.0291),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: Offset(0, 3))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(
                            FeatherIcons.shoppingCart,
                            color: Color(0xff404D4D),
                            //       size: 18,
                            size: screenwidth * 0.04379,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                //        left: 11
                                left: screenwidth * 0.02676),
                            child: Text(
                              "My Order",
                              style: getpoppins(TextStyle(
                                  color: Color(0xff404D4D),
                                  //   fontSize: 13.5,
                                  fontSize: screenwidth * 0.0328,
                                  fontWeight: FontWeight.w400)),
                            ),
                          )
                        ]),
                        Icon(
                          CupertinoIcons.forward,
                          color: Color(0xff404D4D),
                          //     size: 20,
                          size: screenwidth * 0.0486,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/FavoriteProducts", (route) => true);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: screenwidth * 0.0535,
                    ),
                    padding: EdgeInsets.symmetric(
//                  vertical: 14, horizontal: 12
                        vertical: screenwidth * 0.0340,
                        horizontal: screenwidth * 0.0291),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: Offset(0, 3))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(
                            FeatherIcons.heart,
                            color: Color(0xff404D4D),
                            //       size: 18,
                            size: screenwidth * 0.04379,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                //        left: 11
                                left: screenwidth * 0.02676),
                            child: Text(
                              "My Favorites",
                              style: getpoppins(TextStyle(
                                  color: Color(0xff404D4D),
                                  //   fontSize: 13.5,
                                  fontSize: screenwidth * 0.0328,
                                  fontWeight: FontWeight.w400)),
                            ),
                          )
                        ]),
                        Icon(
                          CupertinoIcons.forward,
                          color: Color(0xff404D4D),
                          //     size: 20,
                          size: screenwidth * 0.0486,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: screenwidth * 0.0535,
                  ),
                  padding: EdgeInsets.symmetric(
//                  vertical: 14, horizontal: 12
                      vertical: screenwidth * 0.0340,
                      horizontal: screenwidth * 0.0291),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: Offset(0, 3))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(
                          Icons.supervised_user_circle_sharp,
                          color: Color(0xff404D4D),
                          //       size: 18,
                          size: screenwidth * 0.04379,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              //        left: 11
                              left: screenwidth * 0.02676),
                          child: Text(
                            "Referral Code",
                            style: getpoppins(TextStyle(
                                color: Color(0xff404D4D),
                                //   fontSize: 13.5,
                                fontSize: screenwidth * 0.0328,
                                fontWeight: FontWeight.w400)),
                          ),
                        )
                      ]),
                      Icon(
                        CupertinoIcons.forward,
                        color: Color(0xff404D4D),
                        //     size: 20,
                        size: screenwidth * 0.0486,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: screenwidth * 0.0535,
                  ),
                  padding: EdgeInsets.symmetric(
//                  vertical: 14, horizontal: 12
                      vertical: screenwidth * 0.0340,
                      horizontal: screenwidth * 0.0291),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: Offset(0, 3))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(
                          FeatherIcons.settings,
                          color: Color(0xff404D4D),
                          //       size: 18,
                          size: screenwidth * 0.04379,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              //        left: 11
                              left: screenwidth * 0.02676),
                          child: Text(
                            "Settings",
                            style: getpoppins(TextStyle(
                                color: Color(0xff404D4D),
                                //   fontSize: 13.5,
                                fontSize: screenwidth * 0.0328,
                                fontWeight: FontWeight.w400)),
                          ),
                        )
                      ]),
                      Icon(
                        CupertinoIcons.forward,
                        color: Color(0xff404D4D),
                        //     size: 20,
                        size: screenwidth * 0.0486,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: GestureDetector(
                    onTap: () async {
                      controller.logout().then((removed) {
                        if (removed) {
                          Get.offNamedUntil(
                              "/Login", ModalRoute.withName('/Login'));
                          // Get.until((route) => Get.currentRoute == '/Base');
                          // Get.reset();
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: screenwidth * 0.0535,
                      ),
                      padding: EdgeInsets.symmetric(
//                  vertical: 14, horizontal: 12
                          vertical: screenwidth * 0.0340,
                          horizontal: screenwidth * 0.0291),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: Offset(0, 3))
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Icon(
                              FeatherIcons.logOut,
                              color: Color(0xff404D4D),
                              //       size: 18,
                              size: screenwidth * 0.04379,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  //        left: 11
                                  left: screenwidth * 0.02676),
                              child: Text(
                                "Log Out",
                                style: getpoppins(TextStyle(
                                    color: Color(0xff404D4D),
                                    //   fontSize: 13.5,
                                    fontSize: screenwidth * 0.0328,
                                    fontWeight: FontWeight.w400)),
                              ),
                            )
                          ]),
                          Icon(
                            CupertinoIcons.forward,
                            color: Color(0xff404D4D),
                            //     size: 20,
                            size: screenwidth * 0.0486,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
