import 'package:flutter/material.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/home/product_detail_page_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expandable/expandable.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:metrocoffee/core/theme.dart';

class ToppingsOptionWidget extends StatelessWidget {
  const ToppingsOptionWidget({
    Key? key,
    required this.screenwidth,
  }) : super(key: key);

  final double screenwidth;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProductDetailPageController(),
        builder: (ProductDetailPageController controller) {
          return Container(
            width: 320.w,
            margin: EdgeInsets.only(left: 28.w, top: 29.h, right: 28.w),
            child: ExpandablePanel(
              controller: controller.toppingsexpandableController,
              theme: ExpandableThemeData(
                  animationDuration: Duration(milliseconds: 240),
                  tapBodyToCollapse: true,
                  tapHeaderToExpand: true,
                  hasIcon: false,
                  tapBodyToExpand: true),
              header: AnimatedContainer(
                padding: EdgeInsets.symmetric(
//                  vertical: 14.5,horizontal: 15
                    vertical: screenwidth * 0.0352,
                    horizontal: screenwidth * 0.0364),
                duration: Duration(milliseconds: 250),
                width: screenwidth,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: controller.toppingsexpandableController.expanded
                            ? Colors.black.withOpacity(0.08)
                            : Colors.transparent,
                        blurRadius: 20,
                        offset: Offset(0, 3))
                  ],
                  color: Color(0xffE8E8E8),
                  borderRadius: controller.toppingsexpandableController.expanded
                      ? BorderRadius.only(
                          topLeft: Radius.circular(9),
                          topRight: (Radius.circular(9)))
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
                        controller.currenttopping,
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
                          controller.toppingsexpandableController.expanded
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
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: Offset(0, 3))
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(9),
                        bottomRight: Radius.circular(9)),
                  ),
                  child: SizedBox(
                    child: ListView.builder(
                        itemCount: controller.toppings.length,
                        physics: AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                var toppings = controller.toppings;
                                controller.setcurrenttopping(
                                    toppings.elementAt(index));
                                controller.toppingsexpandableController
                                    .expanded = false;
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 8),
                                child: Text(
                                  controller.toppings.elementAt(index),
                                  style: getpoppins(TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: controller.currenttopping ==
                                              "${controller.toppings.elementAt(index)}"
                                          ? coffeecolor
                                          : darkgrey,
                                      fontSize: 12.5)),
                                ),
                              ));
                        }),
                  )),
            ),
          );
        });
  }
}
