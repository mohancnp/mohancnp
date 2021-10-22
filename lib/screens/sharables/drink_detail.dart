import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/productcontroller/drinkdetailscontroller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/models/order.dart';
import 'package:metrocoffee/models/product_model.dart';
import 'package:metrocoffee/screens/widgets/dialogs/loading_single.dart';
import 'package:metrocoffee/screens/widgets/product/checkout_bottomnavigation.dart';
import 'package:metrocoffee/theme.dart';

class DrinkDetail extends StatelessWidget {
  DrinkDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0; // 1.0 means normal animation speed.

    Product drink = ModalRoute.of(context)!.settings.arguments as Product;
    final DrinkDetailsController drinkDetailsController =
        Get.find<DrinkDetailsController>();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return GetBuilder<DrinkDetailsController>(
        initState: (v) {
          drinkDetailsController.addlistenertoexpand();
          drinkDetailsController.getProductDetails(drink.id);
          drinkDetailsController.orderProducts = OrderProducts();
          drinkDetailsController.selectedPrice.value = 0.0;
          drinkDetailsController.totalPrice.value = 0.0;
          drinkDetailsController.selectedIds.clear();
          drinkDetailsController.setsize(0);
        },
        dispose: (v) {},
        init: DrinkDetailsController(),
        builder: (drinksDetailController) {
          // print(drinkDetailsController.pd?.isFavorite);
          return drinksDetailController.pd == null
              ? LoadingWidget()
              : Stack(
                  children: [
                    Scaffold(
                        backgroundColor: Color(0xffF3F5F5),
                        body: Container(
                          child: ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.06),
                                  Colors.black.withOpacity(0.5)
                                ]).createShader(bounds),
                            blendMode: BlendMode.srcATop,
                            child: Hero(
                              tag: drink.id,
                              child: Material(
                                child: InkWell(
                                  child: Image.asset(
                                      "assets/images/productimages/cardddd@3x-min.png",
                                      width: screenwidth,
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),

                            //  productdetailscontroller.pd == null
                            //     ? Image.network(
                            //         "$baseUrl/storage/uploads/product/2021/7/IqZ0skXFEXc0oTO61WmBWoOlWmsxSWyZzJrFxwso.jpg",
                            //         width: screenwidth,
                            //         fit: BoxFit.cover,
                            //       )
                            //     : Image.network(
                            //         "$baseUrl${productdetailscontroller.pd!.imageUri}",
                            //         width: screenwidth,
                            //         fit: BoxFit.fill,
                            //       )
                          ),
                        )),
                    Scaffold(
                      bottomNavigationBar: CheckoutBottomNavigation(
                        id: drink.id,
                        orderProducts: drinksDetailController.orderProducts,
                      ),
                      backgroundColor: Colors.transparent,
                      //    appBar:
                      body: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(children: [
                          AppBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            leading: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  CupertinoIcons.back,
                                  //      size: 28,
                                  size: screenwidth * 0.0681,
                                  color: Colors.white70,
                                )),
                          ),
                          Container(
                              width: screenwidth,
                              padding: EdgeInsets.only(
//                          top: 175, bottom: 40
                                  top: screenwidth * 0.4257,
                                  bottom: screenwidth * 0.09732),
                              child: Stack(children: [
                                Container(
                                    width: screenwidth,
                                    margin: EdgeInsets.only(
                                        //       bottom: 8
                                        bottom: screenwidth * 0.0194),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            // print(productdetailscontroller
                                            //     .productOrderCount);
                                            var count = drinksDetailController
                                                .orderProducts.qty;
                                            if (count > 1) {
                                              drinksDetailController
                                                  .removeCount();
                                            }
                                          },
                                          child: Icon(
                                            CupertinoIcons.minus_circle,
                                            color: drinksDetailController
                                                        .orderProducts.qty >
                                                    1
                                                ? Colors.white
                                                : Colors.white38,
                                            //      size: 27.5,
                                            size: screenwidth * 0.0669,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              //          horizontal: 22
                                              horizontal: screenwidth * 0.0535),
                                          child: Text(
                                            drinksDetailController
                                                .orderProducts.qty
                                                .toString(),
                                            style: getpoppins(TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize:
                                                    screenwidth * 0.0583)),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // add products to be orderd in cart
                                            drinksDetailController.addCount();
                                          },
                                          child: Icon(
                                            CupertinoIcons.plus_circle,
                                            color: Colors.white,
                                            //      size: 27.5,
                                            size: screenwidth * 0.0669,
                                          ),
                                        ),
                                      ],
                                    )),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        //      width: 48, height: 50,
                                        width: screenwidth * 0.1167,
                                        height: screenwidth * 0.121,
                                        child: Stack(children: [
                                          Positioned(
                                              left: 0,
                                              bottom: 0,
                                              child: Image.asset(
                                                "assets/images/negborderradius.png",
                                                //       width: 48,
                                                width: screenwidth * 0.1167,
                                                fit: BoxFit.cover,
                                              )),
                                        ])),
                                    Container(
                                      padding: EdgeInsets.only(
                                        //           top: 16,
                                        //          left: 22, right: 22
                                        top: screenwidth * 0.0389,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xffF3F5F5),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(60)),
                                          border: Border.all(
                                              color: Colors.transparent)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    //          left: 22, right: 22
                                                    left: screenwidth * 0.0535,
                                                    right:
                                                        screenwidth * 0.0535),
                                                child: Text(
                                                  "${drinksDetailController.pd?.name ?? 'N/A'}",
                                                  style: getpoppins(TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: darkgrey,
                                                      //         fontSize: 26
                                                      fontSize: screenwidth *
                                                          0.0632)),
                                                ),
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    // print("function caled");
                                                    var status =
                                                        drinkDetailsController
                                                            .toggleFavorite(drink
                                                                .id); // print(status);
                                                  },
                                                  child: getFavoriteWidget(
                                                      drinksDetailController,
                                                      screenwidth,
                                                      screenheight)),
                                            ],
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                //          left: 22, right: 22
                                                left: screenwidth * 0.0535,
                                                right: screenwidth * 0.0535),
                                            child: Text(
                                              (drinksDetailController
                                                          .pd?.ingredients ==
                                                      null)
                                                  ? "Caffe latte is a coffee drink "
                                                      "made with espresso and steamed milk. "
                                                      "The word comes from the Italian caffè e "
                                                      'which means "coffee & milk".'
                                                  : "${drinksDetailController.pd?.ingredients}",
                                              style: getpoppins(TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  color:
                                                      darkgrey.withOpacity(0.6),
                                                  //         fontSize: 13.5
                                                  fontSize:
                                                      screenwidth * 0.0328)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    drinksDetailController
                                        .drinktemperatureoption(context),
                                    drinksDetailController.drinksize(context),
                                    (drinksDetailController.pd != null)
                                        ? drinksDetailController
                                            .toppingsoptions(context)
                                        : SizedBox(
                                            height: 0,
                                          ),
                                    (drinksDetailController.pd != null)
                                        ? drinksDetailController
                                            .milkoptions(context)
                                        : SizedBox(
                                            height: 0,
                                          ),
                                    (drinksDetailController.pd != null)
                                        ? drinksDetailController
                                            .extrasrow(context)
                                        : SizedBox(
                                            height: 0,
                                          ),
                                  ],
                                ),
                              ]))
                        ]),
                      ),
                    )
                  ],
                );
        });
  }

  Widget getFavoriteWidget(controller, screenwidth, screenheight) {
    return Container(
      height: screenwidth * (30 / 375),
      width: screenwidth * (30 / 375),
      margin: EdgeInsets.only(right: screenwidth * 0.0335),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: controller.pd!.isFavorite
              ? [BoxShadow(color: Colors.black26, blurRadius: 10)]
              : null),
      child: Center(
          child: controller.pd!.isFavorite
              ? Icon(
                  Icons.favorite,
                  color: Colors.red,
                  // size: 17,
                  size: screenwidth * (17 / 375),
                )
              : Icon(
                  Icons.favorite_outline,
                  color: null,
                  // size: 17,
                  size: screenwidth * (17 / 375),
                )),
    );
  }
}
