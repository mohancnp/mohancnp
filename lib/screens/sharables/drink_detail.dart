import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/productcontroller/drinkdetailscontroller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/models/product_model.dart';
import 'package:metrocoffee/screens/widgets/product/checkout_bottomnavigation.dart';
import 'package:metrocoffee/services/rest/config.dart';
import 'package:metrocoffee/theme.dart';

class DrinkDetail extends StatelessWidget {
  DrinkDetail({Key? key}) : super(key: key);
  final DrinkDetailsController drinkDetailsController =
      Get.find<DrinkDetailsController>();

  @override
  Widget build(BuildContext context) {
    Product drink = ModalRoute.of(context)!.settings.arguments as Product;

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
        },
        init: DrinkDetailsController(),
        builder: (productdetailscontroller) {

          return productdetailscontroller.pd == null
              ? Material(child: Center(child: Text("loading...")))
              : Stack(
                  children: [
                    Scaffold(
                        backgroundColor: Color(0xffF3F5F5),
                        body: ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.06),
                                      Colors.black.withOpacity(0.5)
                                    ]).createShader(bounds),
                            blendMode: BlendMode.srcATop,
                            child: productdetailscontroller.pd == null
                                ? Image.network(
                                    "$baseUrl/storage/uploads/product/2021/7/IqZ0skXFEXc0oTO61WmBWoOlWmsxSWyZzJrFxwso.jpg",
                                    width: screenheight,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    "$baseUrl${productdetailscontroller.pd!.imageUri}",
                                    width: screenheight,
                                    fit: BoxFit.cover,
                                  ))),
                    Scaffold(
                      bottomNavigationBar: CheckoutBottomNavigation(
                        id: drink.id,
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
                                            // print("something");
                                            //add products to be orderd in cart
                                            // drinkDetailsController.orderProducts.qty++;

                                          },
                                          child: Icon(
                                            CupertinoIcons.minus_circle,
                                            color: Colors.white,
                                            //      size: 27.5,
                                            size: screenwidth * 0.0669,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              //          horizontal: 22
                                              horizontal: screenwidth * 0.0535),
                                          child: Text(
                                            "1",
                                            style: getpoppins(TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white,
                                                fontSize:
                                                    screenwidth * 0.0583)),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {},
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
                                                  "${productdetailscontroller.pd?.name ?? 'N/A'}",
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
                                                  var status =
                                                      drinkDetailsController
                                                          .toggleFavorite(drink
                                                              .id); // print(status);
                                                },
                                                // child: GetX<DrinkDetailsController>(
                                                // builder: (controller) {

                                                child: GetX<
                                                        DrinkDetailsController>(
                                                    builder: (controller) {
                                                  return Container(
                                                    height: screenwidth *
                                                        (30 / 375),
                                                    width: screenwidth *
                                                        (30 / 375),
                                                    margin: EdgeInsets.only(
                                                        right: screenwidth *
                                                            0.0535),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                        boxShadow: controller
                                                                .isFavorite
                                                                .value
                                                            ? [
                                                                BoxShadow(
                                                                    color: Colors
                                                                        .black26,
                                                                    blurRadius:
                                                                        10)
                                                              ]
                                                            : null),
                                                    child: Center(
                                                        child: controller
                                                                .isFavorite
                                                                .value
                                                            ? Icon(
                                                                Icons.favorite,
                                                                color:
                                                                    Colors.red,
                                                                // size: 17,
                                                                size:
                                                                    screenwidth *
                                                                        (17 /
                                                                            375),
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .favorite_outline,
                                                                color: null,
                                                                // size: 17,
                                                                size:
                                                                    screenwidth *
                                                                        (17 /
                                                                            375),
                                                              )),
                                                  );
                                                }),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                                //          left: 22, right: 22
                                                left: screenwidth * 0.0535,
                                                right: screenwidth * 0.0535),
                                            child: Text(
                                              "Caffe latte is a coffee drink "
                                              "made with espresso and steamed milk. "
                                              "The word comes from the Italian caffè e "
                                              'which means "coffee & milk".',
                                              style: getpoppins(TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  color:
                                                      darkgrey.withOpacity(0.6),
                                                  //         fontSize: 13.5
                                                  fontSize:
                                                      screenwidth * 0.0328)),
                                            ),
                                          ),
                                          Container(
                                              child: productdetailscontroller
                                                  .drinktemperatureoption(
                                                      context)),
                                          productdetailscontroller
                                              .drinksize(context),
                                          productdetailscontroller
                                              .toppingsoptions(context),
                                          productdetailscontroller
                                              .milkoptions(context),
                                          productdetailscontroller
                                              .extrasrow(context),
                                        ],
                                      ),
                                    )
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
}
