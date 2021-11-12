import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/icons/carticons.dart';
import 'package:metrocoffee/core/constants/icons/utility_icons.dart';
import 'package:metrocoffee/core/models/cart_model.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/models/cart_data.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/screens/widgets/product/finalpricecalculationcard.dart';
import 'package:metrocoffee/screens/widgets/product/product_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/ui/widgets/custom_button.dart';
import 'package:metrocoffee/ui/widgets/utility_info_widget.dart';

class MyProductCart extends StatelessWidget {
  MyProductCart({Key? key}) : super(key: key);
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return GetBuilder<CartController>(
        init: CartController(),
        initState: (v) {
          cartController.getAllCartProducts();
        },
        builder: (controller) {
          return controller.cartProductList == null
              ? SizedBox()
              : Scaffold(
                  backgroundColor: Color(0xFFF3F5F5),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.centerFloat,
                  floatingActionButton: Obx(() {
                    return cartController.cartCount.value > 0
                        ? CustomReusableBtn(
                            buttonText: "Proceed to Checkout",
                            width: 320.w,
                            height: 47.h,
                            onPressed: () {
                              Get.toNamed(PageName.checkoutpage);
                            },
                          )
                        : SizedBox();
                  }),
                  // floatingActionButtonLocation: ,
                  appBar: AppBar(
                    backgroundColor: Color(0xFFF3F5F5),
                    elevation: 0,
                    centerTitle: true,
                    leading: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 24.w,
                        height: 24.h,
                        color: Colors.transparent,
                        child: Icon(
                          CupertinoIcons.back,
                          size: 20.w,
                          color: coffeecolor,
                        ),
                      ),
                    ),
                    title: Text(
                      "MY CART",
                      style: TextStyle(
                          fontFamily: poppinsmedium,
                          color: Color(0xff404D4D),
                          //       fontSize: 16
                          fontSize: screenwidth * 0.0389),
                    ),
                  ),
                  body: Obx(() {
                    return controller.cartCount.value < 1
                        ? UtilityInfoWidget(
                            title: "Your Cart is Empty",
                            content:
                                "Looks like you have not added anything to your cart yet",
                            svgImageUri: UtilityIcons.emptyCart,
                            onPressed: () {
                              Get.back();
                              //navigate on button pressed
                            },
                            buttonText: "Browse Products")
                        : Stack(
                            children: [
                              SingleChildScrollView(
                                physics: AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 30.w,
                                          ),
                                          child: Obx(() {
                                            return Text(
                                              " ${controller.cartCount.value} items",
                                              style: getpoppins(TextStyle(
                                                  color: Color(0xCF344141))),
                                            );
                                          }),
                                        ),
                                        // Padding(
                                        //   padding: EdgeInsets.only(right: 30.w),
                                        //   child: Row(
                                        //     children: [
                                        //       Text(
                                        //         "Add",
                                        //         style: getpoppins(
                                        //             TextStyle(fontWeight: FontWeight.w500)),
                                        //       ),
                                        //       Padding(
                                        //         padding: EdgeInsets.only(left: 8.w),
                                        //         child: Icon(
                                        //           Icons.add_circle,
                                        //           size: 16.w,
                                        //           color: coffeecolor,
                                        //         ),
                                        //       )
                                        //     ],
                                        //   ),
                                        // )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    GetX<CartController>(builder: (controller) {
                                      // print(controller.cartCount);
                                      // print(
                                      //     "${controller.cartCount.value} count");

                                      return SizedBox(
                                        width: 320.w,
                                        child: controller
                                                    .cartProductList!.length >
                                                0
                                            ? ListView.builder(
                                                itemCount: controller
                                                    .cartProductList!.length,
                                                shrinkWrap: true,
                                                primary: false,
                                                // physics: NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  CartModel cartData =
                                                      controller
                                                          .cartProductList!
                                                          .elementAt(index);
                                                  // print(cartData.qty);
                                                  return ProductCard(
                                                      cartModel: cartData,
                                                      index: index);
                                                })
                                            : SizedBox(),
                                      );
                                    }),
                                    Container(
                                      height: 2.w,
                                      width: 320.w,
                                      color: Colors.black12,
                                      padding: EdgeInsets.only(top: 10.h),
                                    ),
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    FinalProductCalculationCard(),
                                  ],
                                ),
                              ),
                            ],
                          );
                  }));
        });
  }
}
