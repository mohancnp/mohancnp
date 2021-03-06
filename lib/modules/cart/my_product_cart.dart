import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/icons/utility_icons.dart';
import 'package:metrocoffee/core/models/cart_instance.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/cart/widgets/product_card.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';
import 'package:metrocoffee/modules/shareables/userpreference.dart';
import 'package:metrocoffee/modules/shareables/widgets/finalpricecalculationcard.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/custom_button.dart';
import 'package:metrocoffee/ui/widgets/utility_info_widget.dart';

class MyProductCart extends StatelessWidget {
  MyProductCart({Key? key}) : super(key: key);
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: CartController(),
      initState: (v) {
        cartController.getAllCartProducts();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: Palette.pagebackgroundcolor,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Obx(
            () {
              return cartController.cartCount.value > 0
                  ? CustomReusableBtn(
                      buttonText: "Proceed to Checkout",
                      width: 320.w,
                      height: 48.h,
                      onPressed: () {
                        final redirection = Get.find<RedirectionController>();
                        if (redirection.userExists) {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.r)),
                                child: SimpleDialog(
                                  contentPadding: const EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(18.r),
                                    ),
                                  ),
                                  children: [
                                    UserPreference(
                                      question:
                                          "How would you like to\nhave your order?",
                                      onPressedFirst:
                                          controller.handleOrderPickUp,
                                      firstText: "COLLECTIONS",
                                      onPressedSecond:
                                          controller.handleOrderDelivery,
                                      secondText: "DELIVERY",
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          redirection.fromCheckoutPage = true;
                          Get.toNamed(PageName.loginpage);
                        }
                      },
                    )
                  : const SizedBox();
            },
          ),
          appBar: AppBar(
            backgroundColor: Palette.pagebackgroundcolor,
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
                fontFamily: CustomFont.poppinsMedium,
                color: Palette.darkGery,
                fontSize: 14.sp,
              ),
            ),
          ),
          body: controller.cartProductList.isEmpty
              ? UtilityInfoWidget(
                  title: "Your Cart is Empty",
                  content:
                      "Looks like you have not added anything to your cart yet",
                  svgImageUri: UtilityIcons.emptyCart,
                  onPressed: () {
                    Get.back();
                  },
                  buttonText: "Browse Products")
              : Stack(
                  children: [
                    SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 30.w,
                                ),
                                child: Obx(() {
                                  return Text(
                                    " ${controller.cartCount.value} items",
                                    style: const TextStyle(
                                      color: Color(0xCF344141),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            width: 320.w,
                            child: controller.cartProductList.isNotEmpty
                                ? ListView.builder(
                                    itemCount:
                                        controller.cartProductList.length,
                                    shrinkWrap: true,
                                    primary: false,
                                    itemBuilder: (context, index) {
                                      CartInstance cartData =
                                          controller.cartProductList[index];
                                      print(cartData.toString());
                                      return ProductCard(
                                        cartModel: cartData,
                                        index: index,
                                      );
                                    },
                                  )
                                : const SizedBox(),
                          ),
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
                ),
        );
      },
    );
  }
}
