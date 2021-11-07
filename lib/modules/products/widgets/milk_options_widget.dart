import 'package:flutter/material.dart';
import 'package:metrocoffee/modules/products/product_detail_page_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expandable/expandable.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class MilkOptionWidget extends StatelessWidget {
  const MilkOptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ProductDetailPageController(),
        builder: (ProductDetailPageController controller) {
          return Container(
            width: 320.w,
            margin: EdgeInsets.only(left: 28.w, top: 29.h, right: 28.w),
            child: ExpandablePanel(
              controller: controller.milksexpandableController,
              theme: ExpandableThemeData(
                  animationDuration: Duration(milliseconds: 240),
                  tapBodyToCollapse: true,
                  tapHeaderToExpand: true,
                  hasIcon: false,
                  tapBodyToExpand: true),
              header: AnimatedContainer(
                padding: EdgeInsets.symmetric(
//                  vertical: 14.5,horizontal: 15
                    vertical: 14.h,
                    horizontal: 15.w),
                duration: Duration(milliseconds: 250),
                width: 375.w,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: controller.toppingsexpandableController.expanded
                            ? Colors.black.withOpacity(0.08)
                            : Colors.transparent,
                        blurRadius: 20.r,
                        offset: Offset(0, 3.h))
                  ],
                  color: Color(0xffE8E8E8),
                  borderRadius: controller.toppingsexpandableController.expanded
                      ? BorderRadius.only(
                          topLeft: Radius.circular(9.r),
                          topRight: (Radius.circular(9.r)))
                      : BorderRadius.all(Radius.circular(9.r)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Milks",
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Palette.darkGery,
                            //         fontSize: 14.5
                            fontSize: 14.sp)),
                      ),
                    ),
                    Container(
                        child: Row(children: [
                      Text(
                        controller.currentmilk,
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w500,
                            color: coffeecolor,
                            //           fontSize: 12.5
                            fontSize: 12.sp)),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            //       left: 12
                            left: 12.w),
                        child: Icon(
                          controller.milksexpandableController.expanded
                              ? FeatherIcons.chevronUp
                              : FeatherIcons.chevronDown,
                          color: Palette.coffeeColor,
                          //         size: 17,
                          size: 17.w,
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
                  padding: EdgeInsets.symmetric(
                      //      vertical: 14.5,horizontal: 15
                      vertical: 14.h,
                      horizontal: 15.w),
                  width: 375.w,
                  decoration: BoxDecoration(
                    color: Palette.pagebackgroundcolor,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20.r,
                          offset: Offset(0, 3.h))
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(9.r),
                        bottomRight: Radius.circular(9.r)),
                  ),
                  child: ListView.builder(
                      itemCount: controller.milks.length,
                      padding: EdgeInsets.all(0),
                      // physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              var milks = controller.milks;
                              controller.setcuttentmilk(milks.elementAt(index));
                              controller.milksexpandableController.expanded =
                                  false;
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 8.r),
                              child: Text(
                                controller.milks.elementAt(index),
                                style: getpoppins(TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: controller.currentmilk ==
                                            "${controller.milks.elementAt(index)}"
                                        ? coffeecolor
                                        : darkgrey,
                                    fontSize: 12.5.sp)),
                              ),
                            ));
                      })),
            ),
          );
        });
  }
}
