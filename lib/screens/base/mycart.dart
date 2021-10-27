import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/base/cartcontroller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/screens/contents/cartcontent/neworderspage.dart';
import 'package:metrocoffee/screens/contents/cartcontent/reorderpage.dart';

class MyCart extends StatelessWidget {
  MyCart({Key? key}) : super(key: key);
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    double screenwidth = MediaQuery.of(context).size.width;
    return GetBuilder<CartController>(
        init: CartController(),
        initState: (v) {
          cartController.getOrderProducts();
        },
        builder: (cartcontroller) {
          return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  "MY CART",
                  style: TextStyle(
                      fontFamily: poppinsmedium,
                      color: Color(0xff404D4D),
                      //       fontSize: 16
                      fontSize: screenwidth * 0.0389),
                ),
              ),
//               floatingActionButtonLocation:
//                   FloatingActionButtonLocation.centerFloat,
//               floatingActionButton: GestureDetector(
//                 onTap: () {
//                   if (cartController.cartDataList.length < 1) {
//                     print("No products Available");
//                   } else {
//                     showDialog<String>(
//                         context: context,
//                         builder: (BuildContext context) => AlertDialog(
//                               content: UserPreference(
//                                   orders: cartController.cartDataList,
//                                   oldContext: context),
//                             ));
//                   }
//                 },
//                 child: Container(
//                   margin: EdgeInsets.only(
// //                    bottom: 12
//                       bottom: screenwidth * 0.0291),
// //                height: 47, width: 245,
//                   height: screenwidth * 0.114,
//                   width: screenwidth * 0.5961,
//                   decoration: BoxDecoration(
//                       color: Color(0xff550E1C),
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                       boxShadow: [
//                         BoxShadow(
//                             color: Color(0xffC3916A).withOpacity(0.5),
//                             blurRadius: 30,
//                             offset: Offset(0, 9))
//                       ]),
//                   child: Center(
//                     child: Text(
//                       "Proceed to Checkout",
//                       style: getpoppins(TextStyle(
//                           fontWeight: FontWeight.w300,
//                           color: Colors.white,
//                           //       fontSize: 15
//                           fontSize: screenwidth * 0.0364)),
//                     ),
//                   ),
//                 ),
//               ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                    width: screenwidth,
                    padding: EdgeInsets.only(
                        //           left: 22,right: 22,
                        left: screenwidth * 0.0535,
                        right: screenwidth * 0.0535,
                        //      bottom: 90
                        bottom: screenwidth * 0.2189),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          margin: EdgeInsets.only(
//                      top: 16, bottom: 18
                              top: screenwidth * 0.0389,
                              bottom: screenwidth * 0.0437),
                          duration: Duration(milliseconds: 350),
                          //         height: 41,
                          height: screenwidth * 0.0997,
                          width: screenwidth,
                          alignment: cartcontroller.tabindex == 0
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          decoration: BoxDecoration(
                            color: Color(0xffE8E8E8),
                            borderRadius: BorderRadius.all(Radius.circular(9)),
                          ),
                          child: Stack(children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 250),
                              //                height: 41,
                              height: screenwidth * 0.0997,
                              width: screenwidth,
                              alignment: cartcontroller.tabindex == 0
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 250),
                                //                     height: 41, width: 180,
                                height: screenwidth * 0.0997,
                                width: screenwidth * 0.437,
                                decoration: BoxDecoration(
                                    color: Color(0xff404D4D),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9))),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      cartcontroller.settabindex(0);
                                    },
                                    child: Container(
                                      //             height: 41, width: 180,
                                      height: screenwidth * 0.0997,
                                      width: screenwidth * 0.437,
                                      child: Center(
                                          child: Text(
                                        "New Order",
                                        style: TextStyle(
                                            fontFamily: proximanovaregular,
                                            //      fontSize: 15.5,
                                            fontSize: screenwidth * 0.0377,
                                            color: cartcontroller.tabindex == 0
                                                ? Colors.white
                                                : Color(0xff404D4D)),
                                      )),
                                    )),
                                GestureDetector(
                                  onTap: () {
                                    cartcontroller.settabindex(1);
                                  },
                                  child: Container(
//                            height: 41, width: 180,
                                    height: screenwidth * 0.0997,
                                    width: screenwidth * 0.437,
                                    child: Center(
                                        child: Text(
                                      "Re Order",
                                      style: TextStyle(
                                          fontFamily: proximanovaregular,
                                          //             fontSize: 15.5,
                                          fontSize: screenwidth * 0.0377,
                                          color: cartcontroller.tabindex == 1
                                              ? Colors.white
                                              : Color(0xff404D4D)),
                                    )),
                                  ),
                                )
                              ],
                            )
                          ]),
                        ),
                        AnimatedSwitcher(
                            duration: Duration(milliseconds: 250),
                            child: cartcontroller.tabindex == 0
                                ? NewOrdersPage()
                                : ReorderPage()),
                      ],
                    )),
              ));
        });
  }
}
