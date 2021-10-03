import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/maps/map_controller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/enums/uistate.dart';
import 'package:metrocoffee/models/profile.dart';
import 'package:metrocoffee/theme.dart';

class UITest extends StatefulWidget {
  UITest({Key? key}) : super(key: key);

  @override
  _UITestState createState() => _UITestState();
}

class _UITestState extends State<UITest> {
  final controller = Get.put(MapController());

  @override
  void initState() {
    super.initState();
    controller.getAllAddresses().then((value) => null);
    // print("initState called");
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
          child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Get.toNamed('/GoogleMapPage');
                // showModalBottomSheet(
                //     context: context,
                //     backgroundColor: Colors.transparent,
                //     builder: (context) {
                //       return CustomBtnActionSheet();
                //     });
              },
              child: Text("Click me"),
            ),
            GetX<MapController>(builder: (controller) {
              return (controller.addresses.length < 1 &&
                      controller.uiState.value == UIState.processing)
                  ? Center(
                      child: Text("loading"),
                    )
                  : ListView.builder(
                      itemCount: controller.addresses.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Address address = controller.addresses.elementAt(index);
                        return GestureDetector(
                          onTap: () {
                            controller.selectedAddressIndex.value = index;
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                //                vertical: 10,horizontal: 12
                                vertical: screenwidth * 0.0243,
                                horizontal: screenwidth * 0.0291),
                            margin: EdgeInsets.only(top: 10),
                            width: screenwidth,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(9),
                                ),
                                border: Border.all(
                                    color: (controller
                                                .selectedAddressIndex.value ==
                                            index)
                                        ? coffeecolor
                                        : Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.07),
                                      blurRadius: 10,
                                      offset: Offset(0, 3))
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        //                  height: 57,width: 58,
                                        height: screenwidth * 0.138,
                                        width: screenwidth * 0.141,
                                        decoration: BoxDecoration(
                                          color: Color(0xffE8E8E8),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(9)),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.location_on,
                                            color: coffeecolor,
                                            //    size: 22,
                                            size: screenwidth * 0.0535,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            //       left: 19
                                            left: screenwidth * 0.0462),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                address.addr1.toString(),
                                                style: getpoppins(TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: darkgrey,
                                                    //                              fontSize:13.5
                                                    fontSize:
                                                        screenwidth * 0.0328)),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                address.addr2.toString(),
                                                style: getpoppins(TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: darkgrey
                                                        .withOpacity(0.8),
                                                    //                              fontSize:10.5
                                                    fontSize:
                                                        screenwidth * 0.0255)),
                                              ),
                                            ),
                                            Container(
                                              child: Text(
                                                address.phone ?? "+99 56581464",
                                                style: getpoppins(TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: darkgrey
                                                        .withOpacity(0.8),
                                                    //           fontSize:10.5
                                                    fontSize:
                                                        screenwidth * 0.0255)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                Container(
                                    //    height: 57,
                                    height: screenwidth * 0.138,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            // CustomLocation result =
                                            //     await Get.toNamed("/GoogleMapPage");
                                            // print(
                                            //     "data from route: ${result.mainLocation}");
                                            // mapController.current.value.mainLocation =
                                            //     result.mainLocation;
                                            // mapController.current.value.subLocation =
                                            //     result.subLocation;
                                          },
                                          child: Icon(
                                            FeatherIcons.edit,
                                            color: darkgrey,
                                            //       size: 19,
                                            size: screenwidth * 0.0462,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Icon(
                                            CupertinoIcons.delete,
                                            color: Colors.redAccent,
                                            //       size: 19,
                                            size: screenwidth * 0.0462,
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        );
                      });
            })
          ],
        ),
      )),
    );
  }

  Future<void> _showProgressDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[CircularProgressIndicator()],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class CustomBtnActionSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 300.h,
      decoration: BoxDecoration(
          color: Color(0xFFE9E9F8),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18))),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 133.w,
            height: 4.h,
            margin: EdgeInsets.only(top: 25, bottom: 18),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(2)),
          ),
          Column(
            children: [
              Action(
                  text: "Add to playlist",
                  assetIcon: "assets/images/testcanberemoved/paperplus.svg"),
              Action(
                  text: "Add to favorites",
                  assetIcon: "assets/images/testcanberemoved/heart.svg"),
              Action(
                  text: "Share",
                  assetIcon: "assets/images/testcanberemoved/send.svg"),
            ],
          ),
        ],
      ),
    );
  }
}

class Action extends StatelessWidget {
  final String text, assetIcon;

  Action({Key? key, required this.text, required this.assetIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 32,
        top: 22,
      ),
      color: Colors.transparent,
      child: Row(
        children: [
          SvgPicture.asset(
            assetIcon,
            width: 17.w,
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
