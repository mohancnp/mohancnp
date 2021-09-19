import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/home/hometabcontroller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/enums/section.dart';
import 'package:metrocoffee/models/product_model.dart';
import 'package:metrocoffee/screens/widgets/product/ratings_row.dart';
import 'package:metrocoffee/services/rest/config.dart';

class HomeSmallRow extends StatelessWidget {
  final Section section;
  final int page;

  const HomeSmallRow({Key? key, required this.page, required this.section})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return GetX<HomeTabController>(builder: (controller) {
      List<Product> pList = [];
      if (page == 1) {
        if (section == Section.recommendation) {
          pList = controller.recommendedBakery;
        } else {
          pList = controller.mostPopularBakery;
        }
      } else {
        if (section == Section.recommendation) {
          pList = controller.recommendedSnacks;
        } else {
          pList = controller.mostPopularSnacks;
        }
      }

      return pList.length < 1
          ? SizedBox(
              height: screenwidth * 0.4476,
            )
          : Container(
//        height: 184,
              height: screenwidth * 0.4476,
              child: ListView.builder(
                itemCount: pList.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  Product p = pList.elementAt(index);
                  return Container(
                      margin: EdgeInsets.only(
                        right: index != 2 ? 0 : screenwidth * 0.0583,
                        //      top: 24
                      ),
                      child: Stack(children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: index == 0
                                  ? screenwidth * 0.0233
                                  : screenwidth * 0.0083,
                              right: 0,
                              //      top: 24
                              top: screenwidth * 0.0583),
                          height: screenwidth * 0.367,
                          width: screenwidth * 0.503,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  //        height: 118, width: 174,
                                  height: screenwidth * 0.287,
                                  width: screenwidth * 0.423,
                                  decoration: BoxDecoration(
                                      color: Color(0xff550E1C),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(22)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 9),
                                            blurRadius: 30)
                                      ]),
                                  child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(22)),
                                      child: Stack(
                                        children: [
                                          Positioned(
//                                left: 11,top: 14,
                                              left: screenwidth * 0.0267,
                                              top: screenwidth * 0.034,
                                              child: RatingsRow(
                                                rating: 4.5,
                                                backgrounddark: true,
                                              )),
                                          Container(
                                            padding: EdgeInsets.only(
                                                //         left:  12,right:10,bottom: 10
                                                left: screenwidth * 0.02919,
                                                right: screenwidth * 0.0243,
                                                bottom: screenwidth * 0.0243),
//                            height: 118,width: 174,
                                            height: screenwidth * 0.287,
                                            width: screenwidth * 0.423,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    child: Text(
                                                  p.name,
                                                  style: getpoppins(TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                      //        fontSize: 13.5
                                                      fontSize: screenwidth *
                                                          0.0328)),
                                                )),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                        child: Text(
                                                      "\$ " +
                                                          p.price.toString(),
                                                      style: getpoppins(
                                                          TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.white,
                                                              //         fontSize: 15
                                                              fontSize:
                                                                  screenwidth *
                                                                      0.0364)),
                                                    )),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                )
                              ]),
                        ),
                        Positioned(
                            //          right: -30, top: -25,
                            right: 0,
                            //    top: 14.5,
                            // top: screenwidth*0.0352,
                            child: Image.network(
                              baseUrl + p.image,
                              //      width: 120,
                              width: screenwidth * 0.28,
                            )),
                      ]));
                },
              ));
    });
  }

  getimageforrow2(int index) {
    if (index == 0) {
      return "assets/images/productimages/pngfind.com-pizza-emoji-png-800270@3x.png";
    }
    if (index == 1) {
      return "assets/images/productimages/correctsandwich.png";
    }
    if (index == 2) {
      return "assets/images/productimages/burgermetrocoffee.png";
    }
  }

  gettitleforrow2(int index) {
    if (index == 0) {
      return "Pizza";
    }
    if (index == 1) {
      return "Sandwich";
    }
    if (index == 2) {
      return "Irish Coffee";
    }
  }

  getpriceforrow2(int index) {
    if (index == 0) {
      return "2.00";
    }
    if (index == 1) {
      return "4.00";
    }
    if (index == 2) {
      return "3.00";
    }
  }
}
