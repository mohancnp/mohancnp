import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/home/hometabcontroller.dart';
import 'package:metrocoffee/GetXController/productcontroller/productdetailscontroller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/models/order.dart';
import 'package:metrocoffee/models/product_model.dart';
import 'package:metrocoffee/screens/widgets/dialogs/loading_single.dart';
import 'package:metrocoffee/screens/widgets/product/checkout_bottomnavigation.dart';
import 'package:metrocoffee/screens/widgets/product/ratings_row_product_detail.dart';
import 'package:metrocoffee/services/rest/config.dart';
import 'package:metrocoffee/theme.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key}) : super(key: key);

  final ProductDetailController productDetailsController =
      Get.put(ProductDetailController());
  final HomeTabController homeTabController = Get.find<HomeTabController>();

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return GetBuilder<ProductDetailController>(
        init: ProductDetailController(),
        initState: (v) {
          productDetailsController.getProductDetails(product.id);
          productDetailsController.orderProducts = OrderProducts();
          productDetailsController.totalPrice.value = 0.0;
          productDetailsController.setsize(0);
        },
        dispose: (v) {},
        builder: (productdetailscontroller) {
          final prod = productdetailscontroller.pd;
          return prod == null
              ? LoadingWidget()
              : Stack(
                  children: [
                    Scaffold(
                        backgroundColor: Color(0xffF3F5F5),
                        body: Hero(
                          tag: product.id,
                          child: Material(
                            child: InkWell(
                              child: Container(
                                height: screenheight * 0.6,
                                width: screenwidth,
                                decoration: BoxDecoration(color: coffeecolor),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          //        top: 85
                                          top: screenwidth * 0.206),
                                      child: prod.imageUri != null
                                          ? Image.network(
                                              '$baseUrl${prod.imageUri}',
                                              height: screenwidth * 0.362,
                                              fit: BoxFit.contain,
                                            )
                                          : Image.asset(
                                              "assets/images/productimages/burger_sandwich_PNG4114@3x.png",
                                              //    height: 75,
                                              height: screenwidth * 0.362,
                                              fit: BoxFit.cover,
                                            ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
                    Scaffold(
                      backgroundColor: Colors.transparent,
                      bottomNavigationBar: CheckoutBottomNavigation(
                        id: product.id,
                        orderProducts: productDetailsController.orderProducts,
                        tag: 1,
                      ),
                      body: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
                          child: Container(
                            width: screenwidth,
                            child: Column(
                              children: [
                                AppBar(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  leading: IconButton(
                                    onPressed: () {
                                      productDetailsController.orderProducts =
                                          OrderProducts();
//                                      productDetailsController.setsize(0);
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      CupertinoIcons.back,
                                      color: Colors.white,
//                        size: 28,
                                      size: screenwidth * 0.0681,
                                    ),
                                  ),
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
                                                  var count =
                                                      productdetailscontroller
                                                          .orderProducts.qty;
                                                  if (count > 1) {
                                                    productdetailscontroller
                                                        .removeCount();
                                                  }
                                                },
                                                child: Icon(
                                                  CupertinoIcons.minus_circle,
                                                  color:
                                                      productdetailscontroller
                                                                  .orderProducts
                                                                  .qty >
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
                                                    horizontal:
                                                        screenwidth * 0.0535),
                                                child: Text(
                                                  productdetailscontroller
                                                      .orderProducts.qty
                                                      .toString(),
                                                  style: getpoppins(TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.white,
                                                      fontSize: screenwidth *
                                                          0.0583)),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  // add products to be orderd in cart
                                                  productDetailsController
                                                      .addCount();
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                      width:
                                                          screenwidth * 0.1167,
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
                                                    topRight:
                                                        Radius.circular(60)),
                                                border: Border.all(
                                                    color: Colors.transparent)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      //          left: 22, right: 22
                                                      left:
                                                          screenwidth * 0.0535,
                                                      right:
                                                          screenwidth * 0.0535),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "${prod.name}",
                                                        style: getpoppins(
                                                            TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: darkgrey,
                                                                //         fontSize: 26
                                                                fontSize:
                                                                    screenwidth *
                                                                        0.0532)),
                                                      ),
                                                      GestureDetector(
                                                          onTap: () {
                                                            var status =
                                                                productDetailsController
                                                                    .updateFavoriteWithId(
                                                                        product
                                                                            .id); // print(status);
                                                          },
                                                          child: getFavoriteWidget(
                                                              productdetailscontroller,
                                                              screenwidth,
                                                              screenheight)),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      //          left: 22, right: 22
                                                      left:
                                                          screenwidth * 0.0535,
                                                      right:
                                                          screenwidth * 0.0535),
                                                  child: Text(
                                                    "A hamburger (also burger for short) is"
                                                    " a sandwich consisting of one or more cooked patties of ground meat,"
                                                    " usually beef, placed inside a sliced bread roll or bun. The patty "
                                                    "may be pan fried, grilled, smoked or flame broiled.",
                                                    style: getpoppins(TextStyle(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: darkgrey
                                                            .withOpacity(0.6),
                                                        //         fontSize: 13.5
                                                        fontSize: screenwidth *
                                                            0.0328)),
                                                  ),
                                                ),
                                                Container(
                                                    child:
                                                        productdetailscontroller
                                                            .fooditemsize(
                                                                context)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ]))
                              ],
                            ),
                          )),
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
