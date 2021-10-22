import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart' as d;
import 'package:metrocoffee/GetXController/base/cartcontroller.dart';
import 'package:metrocoffee/GetXController/checkout/checkoutcontroller.dart';
import 'package:metrocoffee/GetXController/productcontroller/drinkdetailscontroller.dart';
import 'package:metrocoffee/GetXController/productcontroller/productdetailscontroller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/models/cart_data.dart';
import 'package:metrocoffee/models/order.dart';
import 'package:metrocoffee/models/product_model.dart';
import 'package:metrocoffee/models/variants.dart';
import 'package:metrocoffee/screens/sharables/checkout.dart';
import 'package:metrocoffee/screens/widgets/dialogs/loading_single.dart';
import 'package:metrocoffee/screens/widgets/dialogs/userpreference.dart';
import '../../../theme.dart';

class CheckoutBottomNavigation extends StatefulWidget {
  final int id;
  final OrderProducts orderProducts;
  final int? tag;

  //tag 0 means drinkdetail, 1 means productdetail

  const CheckoutBottomNavigation({
    Key? key,
    required this.id,
    required this.orderProducts,
    this.tag = 0,
  }) : super(key: key);

  @override
  _CheckoutBottomNavigationState createState() =>
      _CheckoutBottomNavigationState();
}

class _CheckoutBottomNavigationState extends State<CheckoutBottomNavigation>
    with TickerProviderStateMixin {
  ProductDetail? productDetail;
  final DrinkDetailsController drinkDetailsController =
      Get.find<DrinkDetailsController>();
  final ProductDetailController productDetailsController =
      Get.find<ProductDetailController>();

  @override
  void initState() {
    // print("checkout page detected");
    super.initState();
    drinkDetailsController.getProductDetails(widget.id).then((value) {
      setState(() {
        productDetail = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return productDetail == null
        ? LoadingWidget()
        : Container(
            padding: EdgeInsets.symmetric(
              //       vertical:18,
              //       horizontal: 16
              vertical: screenwidth * 0.0437,
              horizontal: screenwidth * 0.0389,
            ),
            width: screenwidth,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 25,
                      offset: Offset(0, -6))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  //       height: 47,
                  height: screenwidth * 0.1153,
                  width: screenwidth * 0.3966,
                  padding: EdgeInsets.symmetric(
                      //       horizontal: 22
                      horizontal: screenwidth * 0.0535),
                  decoration: BoxDecoration(
                      color: darkgrey,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xffC3916A).withOpacity(0.25),
                            blurRadius: 30,
                            offset: Offset(0, 9))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (widget.tag == 0)
                          ? drinkDetailsController.reflectPriceForDrinks(
                              screenwidth, widget.orderProducts, productDetail)
                          : productDetailsController.reflectPriceForSnacks(
                              productDetail, widget.orderProducts, screenwidth),
                      Container(
                        width: 1,
                        //           height: 18,
                        height: screenwidth * 0.0437,
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                      GetX<CartController>(
                          initState: (v) {
                            Future.delayed(Duration.zero).then((value) {
                              v.controller
                                  ?.checkProductExistence(widget.id)
                                  .then((value) {});
                            });
                          },
                          dispose: (v) {},
                          builder: (cartController) {
                            return SizedBox(
                                child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    cartController.status.toggle();

                                    //variant id of selected variant type
                                    int selectedVariantIndex = 0;
                                    if (widget.tag == 1) {
                                      //for snacks
                                      selectedVariantIndex =
                                          productDetailsController.currentsize;
                                    } else {
                                      //for drinks
                                      selectedVariantIndex =
                                          drinkDetailsController.currentsize;
                                    }
                                    widget.orderProducts.productVariantId =
                                        productDetail?.allVariants
                                            ?.elementAt(selectedVariantIndex)
                                            .id;
                                    //actual product id
                                    widget.orderProducts.productId = widget.id;

                                    //for drink otpions only
                                    if (widget.tag == 0) {
                                      //....building temprature option......///
                                      String name = productDetail?.options
                                              ?.elementAt(1)
                                              .name ??
                                          "None";

                                      String selectedTemprature = productDetail
                                              ?.options
                                              ?.elementAt(1)
                                              .options
                                              .elementAt(drinkDetailsController
                                                  .currenttabindex) ??
                                          "Error";

                                      int id = productDetail?.options
                                              ?.elementAt(1)
                                              .id ??
                                          -1;

                                      //....building toppings opions.....//
                                      String selectedToppings =
                                          drinkDetailsController.currenttopping;
                                      //.....building milk options...//
                                      String selectedMilk =
                                          drinkDetailsController.currentmilk;

                                      //collecting the option and build the order
                                      widget.orderProducts.orderProductOptions =
                                          [
                                        selectedMilk,
                                        selectedTemprature,
                                        selectedToppings
                                      ];

                                      //collecting the addons
                                      widget.orderProducts.orderProductAddons =
                                          drinkDetailsController.selectedIds;
                                    }
                                    CartData cartData = CartData(
                                      orderProducts: widget.orderProducts,
                                      name: productDetail?.name,
                                      imageUri: productDetail?.imageUri,
                                      price: drinkDetailsController
                                          .totalPrice.value,
                                    );

                                    //check before adding new data to the cart
                                    if (cartController.status.isTrue) {
                                      cartController.addOrderProducts(cartData);
                                    } else if (cartController.status.isFalse) {
                                      cartController
                                          .removeOrderProducts(cartData);
                                    }
                                  },
                                  child: Icon(
                                    CupertinoIcons.cart,
                                    color: (cartController.status.isTrue)
                                        ? coffeecolor
                                        : Colors.white,
                                    size: screenwidth * (19 / 375),
                                  ),
                                ),
                                AnimatedPositioned(
                                  left:
                                      (cartController.status.isTrue) ? 12 : 14,
                                  top: (cartController.status.isTrue) ? -6 : -4,
                                  duration: Duration(milliseconds: 200),
                                  child: AnimatedSize(
                                    vsync: this,
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                    // alignment: Alignment(0,0.4),
                                    child: Container(
                                      height: (cartController.status.isTrue)
                                          ? 13
                                          : 8,
                                      width: (cartController.status.isTrue)
                                          ? 13
                                          : 8,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (cartController.status.isTrue)
                                            ? coffeecolor
                                            : Colors.white,
                                      ),
                                      child: Align(
                                        alignment: Alignment(0.2, 0),
                                        child: Text(
                                          "${(cartController.status.isTrue) ? 1 : 0}",
                                          style: TextStyle(
                                              fontSize:
                                                  (cartController.status.isTrue)
                                                      ? 6
                                                      : 4,
                                              color:
                                                  (cartController.status.isTrue)
                                                      ? Colors.white
                                                      : null),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ));
                          }),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (widget.tag == 0) {
                      //the size selected(variant) med,small or large is detected here
                      widget.orderProducts.productVariantId = productDetail
                          ?.allVariants
                          ?.elementAt(drinkDetailsController.currentsize)
                          .id;
                    } else {
                      //the size selected(variant) med,small or large is detected here
                      widget.orderProducts.productVariantId = productDetail
                          ?.allVariants
                          ?.elementAt(productDetailsController.currentsize)
                          .id;
                    }

                    widget.orderProducts.productId = widget.id;

                    //building the selected option

                    //....building temprature option......///
                    int id = productDetail?.options?.elementAt(1).id ?? -1;
                    String name =
                        productDetail?.options?.elementAt(1).name ?? "None";

                    String selectedTemprature = productDetail?.options
                            ?.elementAt(1)
                            .options
                            .elementAt(
                                drinkDetailsController.currenttabindex) ??
                        "Error";
                    var tempOption = ProductOption(
                            id: id,
                            options: [selectedTemprature],
                            defaultValue: "0",
                            name: name)
                        .toJson();

                    String selectedToppings =
                        drinkDetailsController.currenttopping;

                    //.....building milk options...//
                    String selectedMilk = drinkDetailsController.currentmilk;

                    //collecting the option and build the order
                    widget.orderProducts.orderProductOptions = [
                      selectedMilk,
                      selectedTemprature,
                      selectedToppings
                    ];

                    //collecting the addons
                    widget.orderProducts.orderProductAddons =
                        drinkDetailsController.selectedIds;

                    CartData cartData = CartData(
                      orderProducts: widget.orderProducts,
                      name: productDetail?.name,
                      imageUri: productDetail?.imageUri,
                      price: drinkDetailsController.totalPrice.value,
                    );
                    List<CartData> orders = <CartData>[
                      cartData,
                    ];

                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              content: UserPreference(
                                  orders: orders, oldContext: context),
                            ));
                  },
                  child: Container(
                    //       height: 47,
                    height: screenwidth * 0.1153,
                    width: screenwidth * 0.3966,
                    padding: EdgeInsets.symmetric(
                        //       horizontal: 22
                        horizontal: screenwidth * 0.0535),
                    decoration: BoxDecoration(
                        color: coffeecolor,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffC3916A).withOpacity(0.25),
                              blurRadius: 30,
                              offset: Offset(0, 9))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Order Now",
                          textAlign: TextAlign.center,
                          style: getpoppins(TextStyle(
                              color: Colors.white,
                              //        fontSize: 16,
                              fontSize: screenwidth * 0.0389,
                              fontWeight: FontWeight.w300)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
