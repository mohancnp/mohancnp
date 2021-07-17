import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:metrocoffee/GetXController/productcontroller/productdetailscontroller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/theme.dart';

class ProductDetail extends StatelessWidget {
  ProductDetail({Key? key}) : super(key: key);
  final ProductDetailsController productDetailsController =
      Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return GetBuilder<ProductDetailsController>(
        initState: (v) {
          productDetailsController.addlistenertoexpand();
        },
        init: ProductDetailsController(),
        builder: (productdetailscontroller) {
          return Stack(
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
                      child: Image.asset(
                        "assets/images/productimages/cardddd@3x-min.png",
                        width: screenheight,
                        fit: BoxFit.cover,
                      ))),
              Scaffold(
                bottomNavigationBar: Container(
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
                            Text(
                              "\$3.00",
                              style: getpoppins(TextStyle(
                                  color: Colors.white,
                                  //        fontSize: 16,
                                  fontSize: screenwidth * 0.0389,
                                  fontWeight: FontWeight.w500)),
                            ),
                            Container(
                              width: 1,
                              //           height: 18,
                              height: screenwidth * 0.0437,
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                            Container(
                                child: Icon(
                              CupertinoIcons.cart_badge_plus,
                              color: Colors.white,
                              //      size: 24,
                              size: screenwidth * 0.0583,
                            )),
                          ],
                        ),
                      ),
                      Container(
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
                              style: getpoppins(
                                  TextStyle(
                                  color: Colors.white,
                                  //        fontSize: 16,
                                  fontSize: screenwidth * 0.0389,
                                  fontWeight: FontWeight.w300)),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: Colors.transparent,
            //    appBar:
                body: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
          children:[
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
                size: screenwidth*0.0681,
                    color: Colors.white70,
                  )),
            ),Container(
                      width: screenwidth,
                      padding: EdgeInsets.only(
//                          top: 175, bottom: 40
                          top: screenwidth*0.4257, bottom: screenwidth*0.09732
                      ),
                      child: Stack(children: [
                        Container(
                            width: screenwidth,
                            margin: EdgeInsets.only(
                         //       bottom: 8
                           bottom: screenwidth*0.0194 ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    CupertinoIcons.minus_circle,
                                    color: Colors.white,
                                    //      size: 27.5,
                                    size: screenwidth*0.0669,
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
                                        fontSize: screenwidth * 0.0583)),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    CupertinoIcons.plus_circle,
                                    color: Colors.white,
                                    //      size: 27.5,
                                    size: screenwidth*0.0669,
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
                            width: screenwidth*0.1167,height: screenwidth*0.121,
                                child: Stack(children: [
                                  Positioned(
                                      left: 0,
                                      bottom: 0,
                                      child: Image.asset(
                                        "assets/images/negborderradius.png",
                                 //       width: 48,
                                   width: screenwidth*0.1167,     fit: BoxFit.cover,
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
                                  border:
                                      Border.all(color: Colors.transparent)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      //          left: 22, right: 22
                                        left: screenwidth * 0.0535,
                                        right: screenwidth * 0.0535),
                                    child: Text(
                                      "Café Latte",
                                      style: getpoppins(TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: darkgrey,
                                 //         fontSize: 26
                                   fontSize: screenwidth*0.0632   )),
                                    ),
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
                                          color: darkgrey.withOpacity(0.6),
                                 //         fontSize: 13.5
                                   fontSize: screenwidth*0.0328   )),
                                    ),
                                  ),
                                  Container(
                                      child:
                                  productdetailscontroller
                                      .drinktemperatureoption(context)),
                                  productdetailscontroller.drinksize(context),
                                  productdetailscontroller
                                      .toppingsoptions(context),
                                  productdetailscontroller.milkoptions(context),
                                  productdetailscontroller.extrasrow(context),
                                ],
                              ),
                            )
                          ],
                        ),
                      ]))]),
                ),
              )
            ],
          );
        });
  }
}
