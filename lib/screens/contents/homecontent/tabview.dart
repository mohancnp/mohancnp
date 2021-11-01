import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/home/hometabcontroller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return GetBuilder<HomeTabController>(
        initState: (v) {},
        init: HomeTabController(),
        builder: (hometabcontroller) {
          return Container(
            margin: EdgeInsets.only(
                //     top: 23,
                top: screenwidth * 0.0559),
            padding: EdgeInsets.only(
                left: screenwidth * 0.0583, right: screenwidth * 0.0583),
            width: screenwidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          hometabcontroller.setpageindex(0);
                        },
                        child: Container(
                          child: Text(
                            "Drinks",
                            style: hometabcontroller.currentpageindex == 0
                                ? GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color:
                                        hometabcontroller.currentpageindex == 0
                                            ? Colors.white
                                            : Colors.white70,
                                    fontSize:
                                        hometabcontroller.currentpageindex == 0
                                            ?
                                            //         16.5:14.5
                                            screenwidth * 0.0401
                                            : screenwidth * 0.0352)
                                : GoogleFonts.poppins(
                                    fontWeight: FontWeight.w300,
                                    color:
                                        hometabcontroller.currentpageindex == 0
                                            ? Colors.white
                                            : Colors.white70,
                                    fontSize:
                                        hometabcontroller.currentpageindex == 0
                                            ?
                                            //        16.5:14.5
                                            screenwidth * 0.0401
                                            : screenwidth * 0.0352),
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          hometabcontroller.setpageindex(1);
                        },
                        child: Container(
                          child: Text("Bakery",
                              style: hometabcontroller.currentpageindex == 1
                                  ? GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color:
                                          hometabcontroller.currentpageindex ==
                                                  1
                                              ? Colors.white
                                              : Colors.white70,
                                      fontSize:
                                          hometabcontroller.currentpageindex ==
                                                  1
                                              ?
                                              //        16.5:14.5
                                              screenwidth * 0.0401
                                              : screenwidth * 0.0352)
                                  : GoogleFonts.poppins(
                                      fontWeight: FontWeight.w300,
                                      color:
                                          hometabcontroller.currentpageindex ==
                                                  1
                                              ? Colors.white
                                              : Colors.white70,
                                      fontSize:
                                          hometabcontroller.currentpageindex ==
                                                  1
                                              ?
                                              //      16.5:14.5
                                              screenwidth * 0.0401
                                              : screenwidth * 0.0352)),
                        )),
                    GestureDetector(
                        onTap: () {
                          hometabcontroller.setpageindex(2);
                        },
                        child: Container(
                          child: Text(
                            "Snacks",
                            style: TextStyle(
                                fontFamily:
                                    hometabcontroller.currentpageindex == 2
                                        ? poppinsmedium
                                        : poppinslight,
                                color: hometabcontroller.currentpageindex == 2
                                    ? Colors.white
                                    : Colors.white70,
                                fontSize:
                                    hometabcontroller.currentpageindex == 2
                                        ?
                                        //        16.5:14.5
                                        screenwidth * 0.0401
                                        : screenwidth * 0.0352),
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/AllMenu", (route) => true);
                        },
                        child: Container(
                          child: Text(
                            "All Menu",
                            style: TextStyle(
                                fontFamily:
                                    hometabcontroller.currentpageindex == 3
                                        ? poppinsmedium
                                        : poppinslight,
                                color: hometabcontroller.currentpageindex == 3
                                    ? Colors.white
                                    : Colors.white70,
                                fontSize:
                                    hometabcontroller.currentpageindex == 3
                                        ?
                                        //        16.5: 14.5
                                        screenwidth * 0.0401
                                        : screenwidth * 0.0352),
                          ),
                        )),
                  ],
                ),
                AnimatedContainer(
                  alignment: hometabcontroller.currentpageindex != 3
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  height: 2,
                  width: screenwidth,
                  margin: EdgeInsets.only(
                      left: hometabcontroller.currentpageindex == 1
                          ? screenwidth * 0.225
                          : hometabcontroller.currentpageindex == 2
                              ? screenwidth * 0.47
                              : 0,
                      //       bottom: 48
                      bottom: screenwidth * 0.1167),
                  duration: Duration(milliseconds: 250),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    height: 2,
                    width: hometabcontroller.currentpageindex == 1
                        ? 59
                        : hometabcontroller.currentpageindex == 3
                            ?
                            //     69:
                            screenwidth * 0.167
                            : hometabcontroller.currentpageindex == 2
                                ?
                                //      59: 49,
                                screenwidth * 0.143
                                : screenwidth * 0.11922,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        });
  }
}
