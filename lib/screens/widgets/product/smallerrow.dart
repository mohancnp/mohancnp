import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/enums/section.dart';
import 'package:metrocoffee/core/models/product_model.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import 'package:metrocoffee/services/rest/config.dart';

class SmallProductRow extends StatelessWidget {
  final Section tag;

  SmallProductRow({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return GetX<HomeTabController>(builder: (controller) {
      return Container(
//        height: 184,
          height: screenwidth * 0.4476,
          child: ListView.builder(
            itemCount: provideCount(controller, tag),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              Product? mpd;
              if (tag == Section.mostPopular) {
                mpd = controller.mostPopularDrinks.elementAt(index);
              } else if (tag == Section.recommendation) {
                mpd = controller.recommendedDrinks.elementAt(index);
              }
              return GestureDetector(
                onTap: () {
                  Get.toNamed("/DrinkDetails", arguments: mpd);
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: screenwidth * 0.0583,
                            right: index == 2 ? screenwidth * 0.0583 : 0,
                            //      top: 24
                            top: screenwidth * 0.0583),
                        //        height: 118, width: 174,
                        height: screenwidth * 0.287,
                        width: screenwidth * 0.423,
                        decoration: BoxDecoration(
                            color: Color(0xff550E1C),
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 9),
                                  blurRadius: 30)
                            ]),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            child: Stack(
                              children: [
                                Positioned(
                                    //          right: -30, top: -25,
                                    right: -screenwidth * 0.0729,
                                    top: -screenwidth * 0.0608,
                                    child: mpd != null
                                        ? Image.network(
                                            baseUrl + mpd.image,
                                            width: screenwidth * 0.291,
                                          )
                                        : Image.network(
                                            "$baseUrl/storage/uploads/product/2021/7/IqZ0skXFEXc0oTO61WmBWoOlWmsxSWyZzJrFxwso.jpg",
                                            width: screenwidth * 0.291,
                                            fit: BoxFit.cover,
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
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          child: Text(
                                        mpd?.name ?? "N/A",
                                        style: getpoppins(TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white70,
                                            //        fontSize: 13.5
                                            fontSize: screenwidth * 0.0328)),
                                      )),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                              child: Text(
                                            "\$  ${mpd?.price ?? "0"}",
                                            style: getpoppins(TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                                //         fontSize: 15
                                                fontSize:
                                                    screenwidth * 0.0364)),
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
              );
            },
          ));
    });
  }

  getimageforrow2(int index) {
    if (index == 0) {
      return "assets/images/coffe2.png";
    }
    if (index == 1) {
      return "assets/images/smallrowcoffee.png";
    }
    if (index == 2) {
      return "assets/images/pexels-maria-orlova-4915835@3x.png";
    }
  }

  gettitleforrow2(int index) {
    if (index == 0) {
      return "Latte Machiato";
    }
    if (index == 1) {
      return "Pumpkin Latte";
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

  int provideCount(controller, Section tag) {
    switch (tag) {
      case Section.recommendation:
        return controller.recommendedDrinks.length;
      case Section.mostPopular:
        return controller.mostPopularDrinks.length;
        break;
      default:
        return 1;
    }
  }
}
