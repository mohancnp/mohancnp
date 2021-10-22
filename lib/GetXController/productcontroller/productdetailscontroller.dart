import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/models/order.dart';
import 'package:metrocoffee/models/variants.dart';
import 'package:metrocoffee/services/rest/products.dart';
import 'package:metrocoffee/theme.dart';

class ProductDetailController extends GetxController {
  int currentsize = 0;
  final _productService = ProductService.getInstance();
  ProductDetail? pd;
  int productOrderCount = 1;
  Rx<double> totalPrice = (0.0).obs;
  OrderProducts orderProducts = OrderProducts();
  // Order order= Order();

  setsize(int index) {
    currentsize = index;
    update();
  }

  setProductDetail(proDet) {
    pd = proDet;
    update();
  }

  void addCount() {
    // productOrderCount++;
    orderProducts.qty++;
    update();
  }

  void removeCount() {
    // productOrderCount--;
    orderProducts.qty--;
    update();
  }

  //v-2
  Future getProductDetails(int id) async {
    _productService.getSingleProduct(id: id).then((response) {
      // print("single product detail: $response");
      var prodObj = ProductDetail.fromJson(response['data']);
      prodObj.allVariants = sortList(prodObj.allVariants);
      setProductDetail(prodObj);
    });
  }

  List<Variant> sortList(variants) {
    if (variants.isNotEmpty && variants.length > 2) {

      List<Variant> newList = [variants[0], variants[0], variants[0]];
      variants.forEach((element) {
        if (element.name == "Small") {
          newList[0] = element;
          // variants[0] = element;
        } else if (element.name == "Medium") {
          newList[1] = element;
          // variants[1] = element;
        } else if (element.name == "Large") {
          newList[2] = element;
        }
      });
      variants = newList;
    }
    return variants;
  }

  Widget reflectPriceForSnacks(productDetail, orderProducts, screenwidth) {
    return GetX<ProductDetailController>(builder: (controller) {
      if (productDetail != null) {
        double priceOfAVariant =
            (productDetail?.allVariants?.elementAt(this.currentsize).price);
        // print("product Id: ${productDetail.id}");

        // print("price of product variant: $priceOfAVariant");
        // print("quanity ${orderProducts.qty}");

        controller.totalPrice.value = priceOfAVariant * orderProducts.qty;
        // print("total price: ${controller.totalPrice.value}");
      }
      return Text(
        "\$ ${controller.totalPrice.value.toPrecision(2)}",
        style: getpoppins(TextStyle(
            color: Colors.white,
            //        fontSize: 16,
            fontSize: screenwidth * 0.0389,
            fontWeight: FontWeight.w500)),
      );
    });
  }

  Widget fooditemsize(BuildContext context) {
    int length = pd?.allVariants?.length ?? 0;

    double screenwidth = MediaQuery.of(context).size.width;

    return Container(
        padding: EdgeInsets.only(
            //          left: 22, right: 22
            left: screenwidth * 0.0535,
            right: screenwidth * 0.0535),
        width: screenwidth,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.only(
//              top: 22,bottom: 9.5
                  top: screenwidth * 0.0535,
                  bottom: screenwidth * 0.0231),
              child: Text(
                "Select size",
                style: getpoppins(TextStyle(
                    color: Color(0xff344141),
                    //     fontSize: 14.5,
                    fontSize: screenwidth * 0.0352,
                    fontWeight: FontWeight.w500)),
              ),
            )
          ]),
          SizedBox(
            height: screenwidth * 0.28,
            child: ListView.separated(
                itemCount: length,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: screenwidth * 0.15,
                  );
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        setsize(index);
                        // orderProducts.orderProductAddons?.add(0);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            //   height: 74,width: 75,
                            height:
                                getHeightAccordingToIndex(screenwidth, index),
                            width:
                                getHeightAccordingToIndex(screenwidth, index),
                            decoration: BoxDecoration(
                              color: Color(0xffE8E8E8),
                              border: Border.all(
                                  color: currentsize != index
                                      ? Colors.transparent
                                      : Color(0xff550E1C),
                                  width: currentsize != index ? 0 : 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9)),
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/productimages/burgermetrocoffee.png",
                                //    height: 75,
                                height: getHeightAccordingToIndex(
                                    screenwidth, index),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                //      top: 4
                                top: screenwidth * 0.0097),
                            child: Text(
                              "${pd?.allVariants?.elementAt(index).name}",
                              style: getpoppins(TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: darkgrey,
                                  //     fontSize: 13.5
                                  fontSize: screenwidth * 0.0328)),
                            ),
                          )
                        ],
                      ));
                }),
          )
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Container(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(
//                           //      top: 4
//                           top: screenwidth * 0.0097),
//                       child: Text(
//                         "Small",
//                         style: getpoppins(TextStyle(
//                             fontWeight: FontWeight.w400,
//                             color: darkgrey,
//                             //     fontSize: 13.5
//                             fontSize: screenwidth * 0.0328)),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     GestureDetector(
//                         onTap: () {
//                           setsize(1);
//                         },
//                         child: AnimatedContainer(
//                           padding: EdgeInsets.all(8),
//                           duration: Duration(milliseconds: 150),
//                           //       height: 90,width: 91,
//                           height: screenwidth * 0.2426,
//                           width: screenwidth * 0.2426,
//                           decoration: BoxDecoration(
//                             color: Color(0xffE8E8E8),
//                             border: Border.all(
//                                 color: currentsize != 1
//                                     ? Colors.transparent
//                                     : coffeecolor,
//                                 width: currentsize != 1 ? 0 : 2),
//                             borderRadius: BorderRadius.all(Radius.circular(9)),
//                           ),
//                           child: Center(
//                             child: Image.asset(
//                               "assets/images/productimages/burgermetrocoffee.png",
//                               //        height: 91,
//                               //    height: screenwidth*0.242,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         )),
//                     Container(
//                       margin: EdgeInsets.only(
//                           //      top: 4
//                           top: screenwidth * 0.0097),
//                       child: Text(
//                         "Medium",
//                         style: getpoppins(TextStyle(
//                             fontWeight: FontWeight.w400,
//                             color: darkgrey,
//                             //     fontSize: 13.5
//                             fontSize: screenwidth * 0.0328)),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     GestureDetector(
//                         onTap: () {
//                           setsize(2);
//                         },
//                         child: AnimatedContainer(
//                           padding: EdgeInsets.all(8),
//                           duration: Duration(milliseconds: 150),
//                           //      height: 100,width: 101,
//                           height: screenwidth * 0.2693,
//                           width: screenwidth * 0.2693,
//                           decoration: BoxDecoration(
//                             color: Color(0xffE8E8E8),
//                             border: Border.all(
//                                 color: currentsize != 2
//                                     ? Colors.transparent
//                                     : coffeecolor,
//                                 width: currentsize != 2 ? 0 : 2),
//                             borderRadius: BorderRadius.all(Radius.circular(9)),
//                           ),
//                           child: Center(
//                             child: Image.asset(
//                               "assets/images/productimages/burgermetrocoffee.png",
//                               //      height: 101,
// //                          height: screenwidth*0.2693,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         )),
//                     Container(
//                       margin: EdgeInsets.only(
//                           //      top: 4
//                           top: screenwidth * 0.0097),
//                       child: Text(
//                         "Large",
//                         style: getpoppins(TextStyle(
//                             fontWeight: FontWeight.w400,
//                             color: darkgrey,
//                             //     fontSize: 13.5
//                             fontSize: screenwidth * 0.0328)),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
        ]));
  }

  getHeightAccordingToIndex(double screenwidth, int index) {
    if (index == 0) {
      return screenwidth * 0.14;
    } else if (index == 1) {
      return screenwidth * 0.16;
    } else {
      return screenwidth * 0.2;
    }
  }
}
