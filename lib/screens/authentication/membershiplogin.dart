import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/auth/membershipcontroller.dart';

class MembershipLogin extends StatelessWidget {
  const MembershipLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return
      GetBuilder<MemberShipController>(
          init: MemberShipController(),
          builder: (membershiplogincontroller){
        return Stack(
      children: [
        Scaffold(
            body: Image.asset(
              "assets/images/nathan-dumlao-c2Y16tC3yO8-unsplash@3x.png",
              width: screenheight,
              fit: BoxFit.cover,
            )),
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(0.14),
            leading: IconButton(
              onPressed: (){
Navigator.pop(context);
              },
              icon: Icon(CupertinoIcons.back,
              color: Colors.white,
              size: 28,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            padding: EdgeInsets.symmetric(
              //        horizontal: 18
                horizontal: screenwidth * 0.04379),
            height: screenheight,
            width: screenwidth,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.14),
                      Colors.black.withOpacity(0.8)
                    ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/metro coffee logo@3x.png",
//  width: 58,
                    width: screenwidth * 0.1411,
                  ),
                  padding: EdgeInsets.all(
                    //     5
                      screenwidth * 0.0121),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
                membershiplogincontroller.loginfields(context),
              ],
            ),
          ),
        )
      ],
    );});
  }
}
