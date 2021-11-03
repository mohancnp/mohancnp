import 'package:expandable/expandable.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/models/order.dart';
import 'package:metrocoffee/models/variants.dart';
import 'package:metrocoffee/services/rest/products.dart';
import 'package:metrocoffee/services/rest/single_product.dart';
import '../../core/theme.dart';

class DrinkDetailsController extends GetxController {
  int currenttabindex = 0;
  int currentsize = 0;
  String currenttopping = 'Caramel Syrup';
  String currentmilk = 'Soy Milk';
  Rx<bool> isFavorite = false.obs;
  RxList<int?> selectedIds = <int>[].obs;
  Rx<dynamic> selectedPrice = 0.0.obs;
  Rx<double> totalPrice = 0.0.obs;

  ProductDetail? pd;
  ExpandableController toppingsexpandableController = ExpandableController();
  ExpandableController milkexpandableController = ExpandableController();
  final _productService = ProductService.getInstance();
  final _singleProduct = SingleProductService.getInstance();
  int productOrderCount = 1;
  OrderProducts orderProducts = OrderProducts();

  addCount() {
    orderProducts.qty++;
    update();
  }

  removeCount() {
    orderProducts.qty--;
    update();
  }

  setProductDetail(proDet) {
    pd = proDet;
    update();
  }

  settabindex(int index) {
    currenttabindex = index;
    update();
  }

  setsize(int index) {
    currentsize = index;
    update();
  }

  setcurrenttopping(String topping) {
    currenttopping = topping;
    // print('set toppings:$topping');
    update();
  }

  setcurrentmilk(String milk) {
    currentmilk = milk;
    update();
  }

  addlistenertoexpand() {
    toppingsexpandableController.addListener(() {
      if (toppingsexpandableController.expanded) {
        update();
      }
      if (!toppingsexpandableController.expanded) {
        update();
      }
    });
    milkexpandableController.addListener(() {
      if (milkexpandableController.expanded) {
        update();
      }
      if (!milkexpandableController.expanded) {
        update();
      }
    });
  }

  //prices value differ according to the default selection of the drinksize initially
  //hence price  might differ from  that  in drink listing page in detail page.
  Widget reflectPriceForDrinks(screenwidth, orderProducts, productDetail) {
    return GetX<DrinkDetailsController>(builder: (controller) {
      if (productDetail != null) {
        double total = this.totalPrice.value;

        //determining selected variant
        int variantIndex = this.currentsize;

        //getting variant object o the above index
        Variant? v = productDetail?.allVariants?.elementAt(variantIndex);
        print("${this.totalPrice}");

        //getting price of the addons selected
        double priceOfAddons = this.selectedPrice.value;

        // print('price of addons: $priceOfAddons');
        //totalling the all amount
        this.totalPrice.value =
            total = (v?.price + priceOfAddons) * orderProducts.qty;
        // print(
        //     "total price: ${drinkDetailsController.totalPrice.value}");
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

//v-2
  Future<ProductDetail> getProductDetails(int id) async {
    ProductDetail prodObj;
    return _productService.getSingleProduct(id: id).then((response) {
      // print(" from server1: ${response['data']['all_variants'][0]["name"]}");
      // print(" from server2: ${response['data']['all_variants'][1]["name"]}");
      // print(" from server3: ${response['data']['all_variants'][2]["name"]}");

      // print("single product detail: $response");
      prodObj = ProductDetail.fromJson(response['data']);
      // print("${prodObj.allVariants![0].name} IN APP");
      // print("${prodObj.allVariants![1].name} IN APP");
      // print("${prodObj.allVariants![2].name} IN APP");

      prodObj.allVariants = sortList(prodObj.allVariants);
      setProductDetail(prodObj);
      return prodObj;
    });
  }

  Future getFavoriteStatus(int id) async {
    _singleProduct.toggleFavoriteStatus(id: id).then((status) {
      pd!.isFavorite = status;
      update();
    });
  }

  //if favorites

  Future toggleFavorite(int id) async {
    bool status = pd!.isFavorite = !(pd!.isFavorite);
    update();
    Get.find<HomeTabController>().updateFavoriteDrinksAtId(id, status);
    await _singleProduct.toggleFavoriteStatus(id: id);
  }

  Widget drinktemperatureoption(BuildContext context) {
    //get the temprature option
    List<String>? tempOptions;
    if (pd!.options!.isNotEmpty) {
      tempOptions = pd?.options?.elementAt(1).options;
    }
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return tempOptions == null
        ? SizedBox()
        : Container(
            width: screenwidth,
            child: AnimatedContainer(
              margin: EdgeInsets.only(
//                      top: 16, bottom: 18
                  left: screenwidth * 0.0535,
                  right: screenwidth * 0.0535,
                  top: screenwidth * 0.0389,
                  bottom: screenwidth * 0.0437),
              duration: Duration(milliseconds: 350),
              //         height: 41,
              height: screenwidth * 0.0997,
              width: screenwidth,
              alignment: currenttabindex == 0
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              decoration: BoxDecoration(
                color: Color(0xffE8E8E8),
                borderRadius: BorderRadius.all(Radius.circular(9)),
              ),
              child: Stack(children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 250),
                  //                height: 41,
                  height: screenwidth * 0.0997,
                  width: screenwidth,
                  alignment: currenttabindex == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    //                     height: 41, width: 180,
                    height: screenwidth * 0.0997, width: screenwidth * 0.437,
                    decoration: BoxDecoration(
                        color: Color(0xff404D4D),
                        borderRadius: BorderRadius.all(Radius.circular(9))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          // orderProducts.orderProductOptions()
                          settabindex(0);
                          // orderProducts.orderProductOptions
                          //     ?.add(tempOptions.elementAt(0));
                        },
                        child: Container(
                          //             height: 41, width: 180,
                          height: screenwidth * 0.0997,
                          width: screenwidth * 0.437,
                          child: Center(
                              child: Text(
                            "${tempOptions.elementAt(0)}",
                            style: TextStyle(
                                fontFamily: proximanovaregular,
                                //      fontSize: 15.5,
                                fontSize: screenwidth * 0.0377,
                                color: currenttabindex == 0
                                    ? Colors.white
                                    : Color(0xff404D4D)),
                          )),
                        )),
                    GestureDetector(
                      onTap: () {
                        settabindex(1);
                        // orderProducts.orderProductOptions
                        //     ?.add(tempOptions.elementAt(1));
                      },
                      child: Container(
//                            height: 41, width: 180,
                        height: screenwidth * 0.0997,
                        width: screenwidth * 0.437,
                        child: Center(
                            child: Text(
                          "${tempOptions.elementAt(1)}",
                          style: TextStyle(
                              fontFamily: proximanovaregular,
                              //             fontSize: 15.5,
                              fontSize: screenwidth * 0.0377,
                              color: currenttabindex == 1
                                  ? Colors.white
                                  : Color(0xff404D4D)),
                        )),
                      ),
                    )
                  ],
                )
              ]),
            ));
  }

  List<Variant> sortList(variants) {
    if (variants.isNotEmpty || variants.length > 2) {
      // print("variants: ${variants[0].name}");
      // print("variants: ${variants[1].name}");
      // print("variants: ${variants[2].name}");
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

  Widget drinksize(BuildContext context) {
    int length = pd?.allVariants?.length ?? 0;
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.only(
            //          left: 22, right: 22
            left: screenwidth * 0.0535,
            right: screenwidth * 0.0535),
        width: screenwidth,
        child: SizedBox(
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
                          height: getHeightAccordingToIndex(screenwidth, index),
                          width: getHeightAccordingToIndex(screenwidth, index),
                          decoration: BoxDecoration(
                            color: Color(0xffE8E8E8),
                            border: Border.all(
                                color: currentsize != index
                                    ? Colors.transparent
                                    : Color(0xff550E1C),
                                width: currentsize != index ? 0 : 2),
                            borderRadius: BorderRadius.all(Radius.circular(9)),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/lightcup.png",
                              //    height: 75,
                              height:
                                  getHeightAccordingToIndex(screenwidth, index),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              //      top: 4
                              top: screenwidth * 0.0097),
                          child: Text(
                            "${pd?.allVariants![index].name}",
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
        ));
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

  Widget toppingsoptions(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    var options = pd?.options;
    if (options == null || options.length < 3) {
      return SizedBox();
    } else {
      List<String> toppings = options[2].options;
      return ExpandablePanel(
        controller: toppingsexpandableController,
        theme: ExpandableThemeData(
            animationDuration: Duration(milliseconds: 240),
            tapBodyToCollapse: true,
            tapHeaderToExpand: true,
            hasIcon: false,
            tapBodyToExpand: true),
        header: AnimatedContainer(
          margin: EdgeInsets.only(
              //       top: 23
              left: screenwidth * 0.0535,
              right: screenwidth * 0.0535,
              top: screenwidth * 0.0559),
          padding: EdgeInsets.symmetric(
//                  vertical: 14.5,horizontal: 15
              vertical: screenwidth * 0.0352,
              horizontal: screenwidth * 0.0364),
          duration: Duration(milliseconds: 250),
          width: screenwidth,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: toppingsexpandableController.expanded
                      ? Colors.black.withOpacity(0.08)
                      : Colors.transparent,
                  blurRadius: 20,
                  offset: Offset(0, 3))
            ],
            color: Color(0xffE8E8E8),
            borderRadius: toppingsexpandableController.expanded
                ? BorderRadius.only(
                    topLeft: Radius.circular(9), topRight: (Radius.circular(9)))
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
                  currenttopping,
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
                    toppingsexpandableController.expanded
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
              //    boxShadow: [BoxShadow(color: Colors.black12,
              //  blurRadius: 20,offset: Offset(0,3))],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(9),
                  bottomRight: Radius.circular(9)),
            ),
            child: SizedBox(
              child: ListView.builder(
                  itemCount: toppings.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // print('${toppings.elementAt(index)}');
                    return GestureDetector(
                        onTap: () {
                          setcurrenttopping(toppings.elementAt(index));
                          toppingsexpandableController.expanded = false;
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(
                            toppings.elementAt(index),
                            style: getpoppins(TextStyle(
                                fontWeight: FontWeight.w500,
                                color: currenttopping ==
                                        "${toppings.elementAt(index)}"
                                    ? coffeecolor
                                    : darkgrey,
                                //         fontSize: 12.5
                                fontSize: screenwidth * 0.0333)),
                          ),
                        ));
                  }),
            )),
      );
    }
  }

  Widget milkoptions(BuildContext context) {
    List<String> milkOptions = [];
    int length = pd?.options?.length ?? 0;
    if (length > 0) {
      milkOptions = pd!.options!.elementAt(0).options;
    }

    double screenwidth = MediaQuery.of(context).size.width;

    return milkOptions.length > 0
        ? SizedBox(height: 0)
        : ExpandablePanel(
            controller: milkexpandableController,
            theme: ExpandableThemeData(
                animationDuration: Duration(milliseconds: 240),
                tapBodyToCollapse: true,
                tapHeaderToExpand: true,
                hasIcon: false,
                tapBodyToExpand: true),
            header: AnimatedContainer(
              margin: EdgeInsets.only(
                  top: 23,
                  //          left: 22, right: 22
                  left: screenwidth * 0.0535,
                  right: screenwidth * 0.0535),
              padding: EdgeInsets.symmetric(
                  //        vertical: 14.5,horizontal: 15
                  vertical: screenwidth * 0.03527,
                  horizontal: screenwidth * 0.0364),
              duration: Duration(milliseconds: 250),
              width: screenwidth,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: milkexpandableController.expanded
                          ? Colors.black.withOpacity(0.08)
                          : Colors.transparent,
                      blurRadius: 20,
                      offset: Offset(0, 3))
                ],
                color: Color(0xffE8E8E8),
                borderRadius: milkexpandableController.expanded
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
                      "Milk",
                      style: getpoppins(TextStyle(
                          fontWeight: FontWeight.w500,
                          color: darkgrey,
                          //            fontSize: 14.5
                          fontSize: screenwidth * 0.0352)),
                    ),
                  ),
                  Container(
                      child: Row(children: [
                    Text(
                      currentmilk,
                      style: getpoppins(TextStyle(
                          fontWeight: FontWeight.w500,
                          color: coffeecolor,
                          //               fontSize: 12.5
                          fontSize: screenwidth * 0.0304)),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          //        left: 12
                          left: screenwidth * 0.0291),
                      child: Icon(
                        milkexpandableController.expanded
                            ? FeatherIcons.chevronUp
                            : FeatherIcons.chevronDown,
                        color: coffeecolor,
                        //       size: 17,
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
                //       top: 23
                left: screenwidth * 0.0535,
                right: screenwidth * 0.0535,
              ),
              padding: EdgeInsets.symmetric(
//                  vertical: 14.5,horizontal: 15
                  vertical: screenwidth * 0.0352,
                  horizontal: screenwidth * 0.0364),
              width: screenwidth,
              decoration: BoxDecoration(
                color: Colors.white,
                //    boxShadow: [BoxShadow(color: Colors.black12,
                //  blurRadius: 20,offset: Offset(0,3))],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(9),
                    bottomRight: Radius.circular(9)),
              ),
              child: ListView.builder(
                  itemCount: milkOptions.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // print('${milkOptions.elementAt(index)}');
                    return GestureDetector(
                        onTap: () {
                          // print(
                          //     'current toppings:${milkOptions.elementAt(index)}');
                          setcurrentmilk(milkOptions.elementAt(index));
                          milkexpandableController.expanded = false;
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 8),
                          child: Text(
                            milkOptions.elementAt(index),
                            style: getpoppins(TextStyle(
                                fontWeight: FontWeight.w500,
                                color: currenttopping ==
                                        "${milkOptions.elementAt(index)}"
                                    ? coffeecolor
                                    : darkgrey,
                                //         fontSize: 12.5
                                fontSize: screenwidth * 0.0333)),
                          ),
                        ));
                  }),
            ),
          );
  }

  Widget extrasrow(BuildContext context) {
    List<ProductAddOn>? addons = pd?.addons;
    // print(addons?.elementAt(0).name);
    double screenwidth = MediaQuery.of(context).size.width;
    return addons == null
        ? SizedBox()
        : Container(
            width: screenwidth,
            margin: EdgeInsets.only(top: 15.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          //          left: 22, right: 22
                          left: screenwidth * 0.0535,
                          right: screenwidth * 0.0535),
                      margin: EdgeInsets.only(left: 5),
                      child: Text(
                        "Add Extra",
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w500,
                            color: darkgrey,
                            //          fontSize: 14.5
                            fontSize: screenwidth * 0.0352)),
                      ),
                    )
                  ],
                ),
                Container(
                    height: 140,
                    child: addons.length < 1
                        ? SizedBox(
                            child: Center(child: Text("Not Available")),
                          )
                        : ListView.builder(
                            itemCount: addons.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              ProductAddOn proAddon = addons.elementAt(index);
                              return GetX<DrinkDetailsController>(
                                  initState: (v) {
                                // selectedPrice.value = 0;
                              }, dispose: (v) {
                                // v.controller?.selectedPrice.value = 0.0;
                              }, builder: (controller) {
                                // print(proAddon.name);
                                return Container(
                                    margin: EdgeInsets.only(
                                      left:
                                          index != 0 ? 0 : screenwidth * 0.0535,
                                      //          right: 17
                                      right: screenwidth * 0.04136,
                                    ),
                                    //                        height: 94,width: 134,
                                    height: screenwidth * 0.2287,
                                    width: screenwidth * 0.326,
                                    child: Stack(children: [
                                      Positioned(
                                          left: 0,
                                          //         bottom:24,
                                          bottom: screenwidth * 0.0583,
                                          child: GestureDetector(
                                            onTap: () {
                                              if (selectedIds
                                                  .contains(proAddon.id)) {
                                                selectedIds.remove(proAddon.id);
                                                selectedPrice.value -=
                                                    proAddon.cost as double;
                                              } else {
                                                selectedIds.add(proAddon.id);
                                                selectedPrice.value +=
                                                    proAddon.cost as double;
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  //          left: 12,bottom: 4,right: 4
                                                  left: screenwidth * 0.0291,
                                                  bottom: screenwidth * 0.00973,
                                                  right: screenwidth * 0.00973),
                                              //                      height: 88,width: 110,
                                              height: screenwidth * 0.2141,
                                              width: screenwidth * 0.267,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: (controller
                                                              .selectedIds
                                                              .contains(
                                                                  proAddon.id))
                                                          ? Color(0xFF550E1C)
                                                          : Colors.transparent,
                                                      width: 2.0),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(9),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black12,
                                                        blurRadius: 20,
                                                        offset: Offset(0, 3))
                                                  ]),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      proAddon.name.toString(),
                                                      style: getpoppins(
                                                          TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              color: darkgrey,
                                                              //              fontSize: 12
                                                              fontSize:
                                                                  screenwidth *
                                                                      0.0291)),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        child: Text(
                                                          "\$ ${proAddon.cost}",
                                                          style: getpoppins(
                                                              TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color:
                                                                      darkgrey,
                                                                  //             fontSize: 13.5
                                                                  fontSize:
                                                                      screenwidth *
                                                                          0.0328)),
                                                        ),
                                                      ),
                                                      Icon(
                                                        CupertinoIcons
                                                            .add_circled_solid,
                                                        color: coffeecolor,
                                                        //      size: 21,
                                                        size: screenwidth *
                                                            0.0510,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          )),
                                      Positioned(
                                        right: 0,
                                        top: 20,
                                        child: Image.network(
                                            baseUrl + "${proAddon.image}",
                                            width: screenwidth * 0.2092),
                                      ),
                                    ]));
                              });
                            }))
              ],
            ),
          );
  }

  getimageforextrasrow(int index) {
    if (index == 0) {
      return "assets/images/favpng_dark-chocolate-chocolate-bar-health-effects-of-chocolate@3x.png";
    }
    if (index == 1) {
      return "assets/images/favpng_ice-cream-cone-chocolate-ice-cream-panna-cotta@3x.png";
    }
    if (index == 2) {
      return "assets/images/klipartz.com@3x.png";
    }
  }

  gettitleforextras(int index) {
    if (index == 0) {
      return "Chocolate";
    }
    if (index == 1) {
      return "Ice Cream";
    }
    if (index == 2) {
      return "Honey";
    }
  }
}
