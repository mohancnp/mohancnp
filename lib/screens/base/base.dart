import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/base/basecontroller.dart';

class Base extends StatelessWidget {
  Base({Key? key}) : super(key: key);
  final BaseController baseController = Get.put(BaseController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseController>(
        init: BaseController(),
        builder: (basecontroller) {
          return Scaffold(
            backgroundColor: Color(0xffF3F5F5),
            body: Container(
              color: Color(0xffF3F5F5),
            ),
            bottomNavigationBar: Container(
                height: 83,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, -6),
                          color: Color(0x0000000D),
                          blurRadius: 25)
                    ],
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: BottomNavigationBar(
                  iconSize: 24,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: baseController.currentindex,
                  onTap: (index) {
                    baseController.setindex(index);
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  selectedItemColor: Color(0xff550E1C),
                  unselectedItemColor: Colors.black38,
                  items: [
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        "assets/images/home-icon-silhouette.svg",
                        width: 24,
                        color: Color(0xff550E1C),
                      ),
                      backgroundColor: Colors.transparent,
                      title: Text(""),
                      icon: SvgPicture.asset(
                        "assets/images/home-icon-silhouette.svg",
                        width: 24,
                        color: Colors.black38,
                      ),
                    ),
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        "assets/images/bell.svg",
                        height: 24,
                        color: Color(0xff550E1C),
                      ),
                      title: Text(""),
                      backgroundColor: Colors.transparent,
                      icon: SvgPicture.asset(
                        "assets/images/bell.svg",
                        height: 24,
                        color: Colors.black38,
                      ),
                    ),
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        "assets/images/shopping-cart.svg",
                        height: 24,
                        color: Color(0xff550E1C),
                      ),
                      title: Text(""),
                      backgroundColor: Colors.transparent,
                      icon: SvgPicture.asset(
                        "assets/images/shopping-cart.svg",
                        height: 24,
                        color: Colors.black38,
                      ),
                    ),
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        "assets/images/user.svg",
                        height: 24,
                        color: Color(0xff550E1C),
                      ),
                      title: Text(""),
                      backgroundColor: Colors.transparent,
                      icon: SvgPicture.asset(
                        "assets/images/user.svg",
                        height: 24,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                )),
          );
        });
  }
}
