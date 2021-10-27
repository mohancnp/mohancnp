import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/home/hometabcontroller.dart';
import 'package:metrocoffee/GetXController/productcontroller/drinkdetailscontroller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/screens/contents/homecontent/mostpopular.dart';
import 'package:metrocoffee/screens/contents/homecontent/recommendation.dart';
import 'package:metrocoffee/services/rest/config.dart';

class DrinksTab extends StatelessWidget with WidgetsBindingObserver {
  DrinksTab({Key? key}) : super(key: key);
  final c = Get.put(DrinkDetailsController());
  final homeTabController = Get.find<HomeTabController>();

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [firstrow(context), MostPopular(), Recommendation()],
      ),
    );
  }

  Widget firstrow(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return GetX<HomeTabController>(builder: (controller) {
      print(controller.allDrinks.length);
      return controller.allDrinks.length < 1
          ? SizedBox()
          : Container(
              height: screenwidth * 0.5596,
              child: ListView.builder(
                itemCount: controller.allDrinks.length,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final drink = controller.allDrinks.elementAt(index);
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: screenwidth * 0.0583,
                              right: index == 2 ? screenwidth * 0.0583 : 0),
                          //        height: 192, width: 170,
                          height: screenwidth * 0.467,
                          width: screenwidth * 0.4136,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(22)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 9),
                                    blurRadius: 30)
                              ]),
                          child: Stack(
                            children: [
                              Positioned(
                                  //          right: -35, top: -30,
                                  right: -screenwidth * 0.0851,
                                  top: -screenwidth * 0.0729,
                                  child: Hero(
                                    tag: drink.id,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed("/DrinkDetails",
                                              arguments: drink);
                                        },
                                        child: Image.network(
                                          "$baseUrl" + drink.image,
                                          height: screenwidth * 0.40,
                                          // //      width: 185,
                                          width: screenwidth * 0.45012,
                                        ),
                                      ),
                                    ),
                                  )),
                              Container(
                                padding: EdgeInsets.only(
                                    //         left:  12,right:10,bottom: 10
                                    left: screenwidth * 0.02919,
                                    right: screenwidth * 0.0243,
                                    bottom: screenwidth * 0.0243),
                                //          height: 192, width: 170,
                                height: screenwidth * 0.467,
                                width: screenwidth * 0.4136,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        child: Text(
                                      drink.name,
                                      style: getpoppins(TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff404D4D),
                                          //        fontSize: 14
                                          fontSize: screenwidth * 0.034063)),
                                    )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                            child: Text(
                                          "\$ " + drink.price.toString(),
                                          style: getpoppins(TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff550E1C),
                                              //         fontSize: 15
                                              fontSize: screenwidth * 0.0364)),
                                        )),
                                        Container(
                                          //      height: 29,width: 29,
                                          height: screenwidth * 0.07055,
                                          width: screenwidth * 0.07055,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.2),
                                                    blurRadius: 15,
                                                    offset: Offset(0, 3)),
                                              ],
                                              shape: BoxShape.circle),
                                          child: Center(
                                              child: GestureDetector(
                                                  onTap: () {
                                                    controller
                                                        .updateFavoriteDrinksAtId(
                                                            drink.id,
                                                            !drink.isFavorite,
                                                            true);
                                                  },
                                                  child: drink.isFavorite
                                                      ? Icon(
                                                          Icons.favorite,
                                                          color: Colors.red,
                                                          // size: 17,
                                                          size: screenwidth *
                                                              (17 / 375),
                                                        )
                                                      : Icon(
                                                          Icons
                                                              .favorite_outline,
                                                          color: null,
                                                          // size: 17,
                                                          size: screenwidth *
                                                              (17 / 375),
                                                        ))),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ]);
                },
              ));
    });
  }
}
