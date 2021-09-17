import 'package:expandable/expandable.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/models/variants.dart';
import 'package:metrocoffee/services/rest/products.dart';

import '../../theme.dart';

class DrinkDetailsController extends GetxController {
  int currenttabindex = 0;
  int currentsize = 0;
  String currenttopping = 'Caramel Syrup';
  String currentmilk = 'Soy Milk';
  Rx<int> cartCount = 0.obs;
  Rx<bool> cartStatus = false.obs;
  Rx<bool> isFavorite = false.obs;
  Rx<bool> isSelected = false.obs;
  ProductDetail? pd;
  ExpandableController toppingsexpandableController = ExpandableController();
  ExpandableController milkexpandableController = ExpandableController();

  setProductDetail(proDet) {
    pd = proDet;
    update();
  }

  settabindex(int index) {
    currenttabindex = index;
    update();
  }

  setsize(int index) {
    currentsize = index;
    update();
  }

  setcurrenttopping(String topping) {
    currenttopping = topping;
    update();
  }

  setcurrentmilk(String milk) {
    currentmilk = milk;
    update();
  }

  addlistenertoexpand() {
    toppingsexpandableController.addListener(() {
      if (toppingsexpandableController.expanded) {
        update();
      }
      if (!toppingsexpandableController.expanded) {
        update();
      }
    });
    milkexpandableController.addListener(() {
      if (milkexpandableController.expanded) {
        update();
      }
      if (!milkexpandableController.expanded) {
        update();
      }
    });
  }

  updateCart(int updateCount) {
    //update later
    if (updateCount == 0)
      cartCount.value += 1;
    else
      cartCount.value -= 1;
  }

  toggleCart() {
    cartStatus.toggle();
  }

//v-2
  Future getProductDetails(int id) async {
    ProductService().getSingleProduct(id: id).then((response) {
      // print("single product detail: $response");
      var prodObj = ProductDetail.fromJson(response['data']);
      setProductDetail(prodObj);
    });
  }

  Widget drinktemperatureoption(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Container(
        width: screenwidth,
        child: AnimatedContainer(
          margin: EdgeInsets.only(
//                      top: 16, bottom: 18
              left: screenwidth * 0.0535,
              right: screenwidth * 0.0535,
              top: screenwidth * 0.0389,
              bottom: screenwidth * 0.0437),
          duration: Duration(milliseconds: 350),
          //         height: 41,
          height: screenwidth * 0.0997,
          width: screenwidth,
          alignment: currenttabindex == 0
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
              alignment: currenttabindex == 0
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                //                     height: 41, width: 180,
                height: screenwidth * 0.0997, width: screenwidth * 0.437,
                decoration: BoxDecoration(
                    color: Color(0xff404D4D),
                    borderRadius: BorderRadius.all(Radius.circular(9))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      settabindex(0);
                    },
                    child: Container(
                      //             height: 41, width: 180,
                      height: screenwidth * 0.0997,
                      width: screenwidth * 0.437,
                      child: Center(
                          child: Text(
                        "Hot",
                        style: TextStyle(
                            fontFamily: proximanovaregular,
                            //      fontSize: 15.5,
                            fontSize: screenwidth * 0.0377,
                            color: currenttabindex == 0
                                ? Colors.white
                                : Color(0xff404D4D)),
                      )),
                    )),
                GestureDetector(
                  onTap: () {
                    settabindex(1);
                  },
                  child: Container(
//                            height: 41, width: 180,
                    height: screenwidth * 0.0997, width: screenwidth * 0.437,
                    child: Center(
                        child: Text(
                      "Chilled",
                      style: TextStyle(
                          fontFamily: proximanovaregular,
                          //             fontSize: 15.5,
                          fontSize: screenwidth * 0.0377,
                          color: currenttabindex == 1
                              ? Colors.white
                              : Color(0xff404D4D)),
                    )),
                  ),
                )
              ],
            )
          ]),
        ));
  }

  Widget drinksize(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
          //          left: 22, right: 22
          left: screenwidth * 0.0535,
          right: screenwidth * 0.0535),
      width: screenwidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setsize(0);
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 150),
                      //   height: 74,width: 75,
                      height: screenwidth * 0.2,
                      width: screenwidth * 0.2,
                      decoration: BoxDecoration(
                        color: Color(0xffE8E8E8),
                        border: Border.all(
                            color: currentsize != 0
                                ? Colors.transparent
                                : Color(0xff550E1C),
                            width: currentsize != 0 ? 0 : 2),
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/lightcup.png",
                          //    height: 75,
                          height: screenwidth * 0.2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(
                      //      top: 4
                      top: screenwidth * 0.0097),
                  child: Text(
                    "Small",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w400,
                        color: darkgrey,
                        //     fontSize: 13.5
                        fontSize: screenwidth * 0.0328)),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setsize(1);
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 150),
                      //       height: 90,width: 91,
                      height: screenwidth * 0.2426,
                      width: screenwidth * 0.2426,
                      decoration: BoxDecoration(
                        color: Color(0xffE8E8E8),
                        border: Border.all(
                            color: currentsize != 1
                                ? Colors.transparent
                                : coffeecolor,
                            width: currentsize != 1 ? 0 : 2),
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/lightcup.png",
                          //        height: 91,
                          height: screenwidth * 0.242,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(
                      //      top: 4
                      top: screenwidth * 0.0097),
                  child: Text(
                    "Medium",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w400,
                        color: darkgrey,
                        //     fontSize: 13.5
                        fontSize: screenwidth * 0.0328)),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setsize(2);
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 150),
                      //      height: 100,width: 101,
                      height: screenwidth * 0.2693,
                      width: screenwidth * 0.2693,
                      decoration: BoxDecoration(
                        color: Color(0xffE8E8E8),
                        border: Border.all(
                            color: currentsize != 2
                                ? Colors.transparent
                                : coffeecolor,
                            width: currentsize != 2 ? 0 : 2),
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/lightcup.png",
                          //      height: 101,
                          height: screenwidth * 0.2693,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(
                      //      top: 4
                      top: screenwidth * 0.0097),
                  child: Text(
                    "Large",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w400,
                        color: darkgrey,
                        //     fontSize: 13.5
                        fontSize: screenwidth * 0.0328)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget toppingsoptions(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return ExpandablePanel(
      controller: toppingsexpandableController,
      theme: ExpandableThemeData(
          animationDuration: Duration(milliseconds: 240),
          tapBodyToCollapse: true,
          tapHeaderToExpand: true,
          hasIcon: false,
          tapBodyToExpand: true),
      header: AnimatedContainer(
        margin: EdgeInsets.only(
            //       top: 23
            left: screenwidth * 0.0535,
            right: screenwidth * 0.0535,
            top: screenwidth * 0.0559),
        padding: EdgeInsets.symmetric(
//                  vertical: 14.5,horizontal: 15
            vertical: screenwidth * 0.0352,
            horizontal: screenwidth * 0.0364),
        duration: Duration(milliseconds: 250),
        width: screenwidth,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: toppingsexpandableController.expanded
                    ? Colors.black.withOpacity(0.08)
                    : Colors.transparent,
                blurRadius: 20,
                offset: Offset(0, 3))
          ],
          color: Color(0xffE8E8E8),
          borderRadius: toppingsexpandableController.expanded
              ? BorderRadius.only(
                  topLeft: Radius.circular(9), topRight: (Radius.circular(9)))
              : BorderRadius.all(Radius.circular(9)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "Toppings",
                style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w500,
                    color: darkgrey,
                    //         fontSize: 14.5
                    fontSize: screenwidth * 0.0352)),
              ),
            ),
            Container(
                child: Row(children: [
              Text(
                currenttopping,
                style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w500,
                    color: coffeecolor,
                    //           fontSize: 12.5
                    fontSize: screenwidth * 0.0304)),
              ),
              Container(
                margin: EdgeInsets.only(
                    //       left: 12
                    left: screenwidth * 0.0291),
                child: Icon(
                  toppingsexpandableController.expanded
                      ? FeatherIcons.chevronUp
                      : FeatherIcons.chevronDown,
                  color: coffeecolor,
                  //         size: 17,
                  size: screenwidth * 0.04136,
                ),
              )
            ])),
          ],
        ),
      ),
      collapsed: SizedBox(
        height: 0,
      ),
      expanded: Container(
        margin: EdgeInsets.only(
            left: screenwidth * 0.0535, right: screenwidth * 0.0535),
        padding: EdgeInsets.symmetric(
            //      vertical: 14.5,horizontal: 15
            vertical: screenwidth * 0.03527,
            horizontal: screenwidth * 0.0364),
        width: screenwidth,
        decoration: BoxDecoration(
          color: Colors.white,
          //    boxShadow: [BoxShadow(color: Colors.black12,
          //  blurRadius: 20,offset: Offset(0,3))],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(9), bottomRight: Radius.circular(9)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  setcurrenttopping('Caramel Syrup');
                  toppingsexpandableController.expanded = false;
                },
                child: Container(
                  child: Text(
                    "Caramel Syrup",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w500,
                        color: currenttopping == "Caramel Syrup"
                            ? coffeecolor
                            : darkgrey,
                        //         fontSize: 12.5
                        fontSize: screenwidth * 0.0333)),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  setcurrenttopping('Honey');
                  toppingsexpandableController.expanded = false;
                },
                child: Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    "Honey",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w500,
                        color:
                            currenttopping == "Honey" ? coffeecolor : darkgrey,
                        //         fontSize: 12.5
                        fontSize: screenwidth * 0.0333)),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  setcurrenttopping('Cinnamon');
                  toppingsexpandableController.expanded = false;
                },
                child: Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    "Cinnamon",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w500,
                        color: currenttopping == "Cinnamon"
                            ? coffeecolor
                            : darkgrey,
                        //         fontSize: 12.5
                        fontSize: screenwidth * 0.0333)),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  setcurrenttopping('Butter');
                  toppingsexpandableController.expanded = false;
                },
                child: Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    "Butter",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w500,
                        color:
                            currenttopping == "Butter" ? coffeecolor : darkgrey,
                        //         fontSize: 12.5
                        fontSize: screenwidth * 0.0333)),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  setcurrenttopping('Cardamom');
                  toppingsexpandableController.expanded = false;
                },
                child: Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    "Cardamom",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w500,
                        color: currenttopping == "Cardamom"
                            ? coffeecolor
                            : darkgrey,
                        //         fontSize: 12.5
                        fontSize: screenwidth * 0.0333)),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget milkoptions(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return ExpandablePanel(
      controller: milkexpandableController,
      theme: ExpandableThemeData(
          animationDuration: Duration(milliseconds: 240),
          tapBodyToCollapse: true,
          tapHeaderToExpand: true,
          hasIcon: false,
          tapBodyToExpand: true),
      header: AnimatedContainer(
        margin: EdgeInsets.only(
            top: 23,
            //          left: 22, right: 22
            left: screenwidth * 0.0535,
            right: screenwidth * 0.0535),
        padding: EdgeInsets.symmetric(
            //        vertical: 14.5,horizontal: 15
            vertical: screenwidth * 0.03527,
            horizontal: screenwidth * 0.0364),
        duration: Duration(milliseconds: 250),
        width: screenwidth,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: milkexpandableController.expanded
                    ? Colors.black.withOpacity(0.08)
                    : Colors.transparent,
                blurRadius: 20,
                offset: Offset(0, 3))
          ],
          color: Color(0xffE8E8E8),
          borderRadius: milkexpandableController.expanded
              ? BorderRadius.only(
                  topLeft: Radius.circular(9), topRight: (Radius.circular(9)))
              : BorderRadius.all(Radius.circular(9)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "Milk",
                style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w500,
                    color: darkgrey,
                    //            fontSize: 14.5
                    fontSize: screenwidth * 0.0352)),
              ),
            ),
            Container(
                child: Row(children: [
              Text(
                currentmilk,
                style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w500,
                    color: coffeecolor,
                    //               fontSize: 12.5
                    fontSize: screenwidth * 0.0304)),
              ),
              Container(
                margin: EdgeInsets.only(
                    //        left: 12
                    left: screenwidth * 0.0291),
                child: Icon(
                  milkexpandableController.expanded
                      ? FeatherIcons.chevronUp
                      : FeatherIcons.chevronDown,
                  color: coffeecolor,
                  //       size: 17,
                  size: screenwidth * 0.04136,
                ),
              )
            ])),
          ],
        ),
      ),
      collapsed: SizedBox(
        height: 0,
      ),
      expanded: Container(
        margin: EdgeInsets.only(
          //       top: 23
          left: screenwidth * 0.0535,
          right: screenwidth * 0.0535,
        ),
        padding: EdgeInsets.symmetric(
//                  vertical: 14.5,horizontal: 15
            vertical: screenwidth * 0.0352,
            horizontal: screenwidth * 0.0364),
        width: screenwidth,
        decoration: BoxDecoration(
          color: Colors.white,
          //    boxShadow: [BoxShadow(color: Colors.black12,
          //  blurRadius: 20,offset: Offset(0,3))],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(9), bottomRight: Radius.circular(9)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  setcurrentmilk('Soy Milk');
                  milkexpandableController.expanded = false;
                },
                child: Container(
                  child: Text(
                    "Soy Milk",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w500,
                        color:
                            currentmilk == "Soy Milk" ? coffeecolor : darkgrey,
                        //         fontSize: 12.5
                        fontSize: screenwidth * 0.0333)),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  setcurrentmilk('Almond Milk');
                  milkexpandableController.expanded = false;
                },
                child: Container(
                  margin: EdgeInsets.only(
                      //         top: 8
                      top: screenwidth * 0.01946),
                  child: Text(
                    "Almond Milk",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w500,
                        color: currentmilk == "Almond Milk"
                            ? coffeecolor
                            : darkgrey,
                        //         fontSize: 12.5
                        fontSize: screenwidth * 0.0333)),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  setcurrentmilk('Rice Milk');
                  milkexpandableController.expanded = false;
                },
                child: Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    "Rice Milk",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w500,
                        color:
                            currentmilk == "Rice Milk" ? coffeecolor : darkgrey,
                        //         fontSize: 12.5
                        fontSize: screenwidth * 0.0333)),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  setcurrentmilk('Coconut Milk');
                  milkexpandableController.expanded = false;
                },
                child: Container(
                  margin: EdgeInsets.only(
                      //          top: 8
                      top: screenwidth * 0.01946),
                  child: Text(
                    "Coconut Milk",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w500,
                        color: currentmilk == "Coconut Milk"
                            ? coffeecolor
                            : darkgrey,
                        //         fontSize: 12.5
                        fontSize: screenwidth * 0.0333)),
                  ),
                )),
            GestureDetector(
                onTap: () {
                  setcurrentmilk('Skim Milk');
                  milkexpandableController.expanded = false;
                },
                child: Container(
                  margin: EdgeInsets.only(
                      //            top: 8
                      top: screenwidth * 0.01946),
                  child: Text(
                    "Skim Milk",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w500,
                        color:
                            currentmilk == "Skim Milk" ? coffeecolor : darkgrey,
                        //         fontSize: 12.5
                        fontSize: screenwidth * 0.0333)),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget extrasrow(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth,
      margin: EdgeInsets.only(top: 15.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    //          left: 22, right: 22
                    left: screenwidth * 0.0535,
                    right: screenwidth * 0.0535),
                margin: EdgeInsets.only(left: 5),
                child: Text(
                  "Add Extra",
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w500,
                      color: darkgrey,
                      //          fontSize: 14.5
                      fontSize: screenwidth * 0.0352)),
                ),
              )
            ],
          ),
          Container(
              height: 140,
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.only(
                          left: index != 0 ? 0 : screenwidth * 0.0535,
                          //          right: 17
                          right: screenwidth * 0.04136,
                        ),
//                        height: 94,width: 134,
                        height: screenwidth * 0.2287,
                        width: screenwidth * 0.326,
                        child: Stack(children: [
                          Positioned(
                              left: 0,
                              //         bottom:24,
                              bottom: screenwidth * 0.0583,
                              child: GestureDetector(
                                onTap: () {
                                  print('tapped on button');
                                  //animating the border.
                                  this.isSelected = this.isSelected.toggle();
                                },
                                child: GetX<DrinkDetailsController>(
                                    builder: (controller) {
                                  return Container(
                                    padding: EdgeInsets.only(
                                        //          left: 12,bottom: 4,right: 4
                                        left: screenwidth * 0.0291,
                                        bottom: screenwidth * 0.00973,
                                        right: screenwidth * 0.00973),
//                      height: 88,width: 110,
                                    height: screenwidth * 0.2141,
                                    width: screenwidth * 0.267,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: controller.isSelected.isTrue
                                                ? Color(0xFF550E1C)
                                                : Colors.transparent,
                                            width: 2.0),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(9),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 20,
                                              offset: Offset(0, 3))
                                        ]),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            gettitleforextras(index),
                                            style: getpoppins(TextStyle(
                                                fontWeight: FontWeight.w300,
                                                color: darkgrey,
                                                //              fontSize: 12
                                                fontSize:
                                                    screenwidth * 0.0291)),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text(
                                                "\$1.50",
                                                style: getpoppins(TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: darkgrey,
                                                    //             fontSize: 13.5
                                                    fontSize:
                                                        screenwidth * 0.0328)),
                                              ),
                                            ),
                                            Icon(
                                              CupertinoIcons.add_circled_solid,
                                              color: coffeecolor,
                                              //      size: 21,
                                              size: screenwidth * 0.0510,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              )),
                          Positioned(
                            top: index == 2 ? 0 : 29,
                            right: 0,
                            child: Image.asset(getimageforextrasrow(index),
                                width: index == 2
                                    ? screenwidth * 0.1800
                                    : index == 1
                                        ? screenwidth * 0.1654
                                        : screenwidth * 0.2092),
                          )
                        ]));
                  }))
        ],
      ),
    );
  }

  getimageforextrasrow(int index) {
    if (index == 0) {
      return "assets/images/favpng_dark-chocolate-chocolate-bar-health-effects-of-chocolate@3x.png";
    }
    if (index == 1) {
      return "assets/images/favpng_ice-cream-cone-chocolate-ice-cream-panna-cotta@3x.png";
    }
    if (index == 2) {
      return "assets/images/klipartz.com@3x.png";
    }
  }

  gettitleforextras(int index) {
    if (index == 0) {
      return "Chocolate";
    }
    if (index == 1) {
      return "Ice Cream";
    }
    if (index == 2) {
      return "Honey";
    }
  }
}
