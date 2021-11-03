import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/screens/base/my_product_cart.dart';

class TopHomeGreeting extends StatelessWidget {
  const TopHomeGreeting({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Container(
        width: screenwidth,
        // clipBehavior: Clip.none,
        padding: EdgeInsets.only(
//         horizontal: 24,vertical: 24
            left: 28.w,
            right: 28.w,
            //     top:35,
            top: 68.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetX<HomeTabController>(builder: (controller) {
                      var user = controller.newUser.value;
                      var firstName = "...";
                      if (user != null) {
                        firstName = user.name!.split(' ').elementAt(0);
                      }
                      return Container(
                          child: Text(
                        int.parse(DateFormat.H('en_US')
                                    .format(DateTime.now())) <
                                16
                            ? 'Good Afternoon,' + '$firstName'
                            : 'Good Evening,' + ' $firstName ',
                        style: TextStyle(
                            fontFamily: montserratsemibold,
                            color: Colors.white,
                            //     fontSize: 20.5
                            fontSize: screenwidth * 0.0498),
                      ));
                    }),
                    Container(
                        margin: EdgeInsets.only(
                            //        top: 3
                            top: 4.h),
                        child: Text(
                          "You can order drinks for collections or Delivery.",
                          style: TextStyle(
                              fontFamily: poppinslight,
                              color: Color(0xF3F3F3D6),
                              //          fontSize: 11.5
                              fontSize: screenwidth * 0.0279),
                        )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(MyProductCart());
                },
                child: SvgPicture.asset(
                  "assets/images/cartadd.svg",
                  width: 20.w,
                  height: 20.w,
                  color: Colors.white,
                ),
              )
            ]));
  }
}
