import 'package:flutter/material.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/screens/widgets/product/ratings_row.dart';
class HomeSmallRow extends StatelessWidget {
  const HomeSmallRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
//        height: 184,
        height: screenwidth * 0.4476,
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return
            Container(
                margin: EdgeInsets.only(
                    right: index!=2?0: screenwidth * 0.0583,
                    //      top: 24
                   ),  child:
            Stack(
            children:[

              Container(
                  margin: EdgeInsets.only(
                      left: screenwidth * 0.0583,
                      right:  0,
                      //      top: 24
                      top: screenwidth * 0.0583),
                  height: screenwidth * 0.357,
                  width: screenwidth * 0.443,
                  child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(

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
//                                left: 11,top: 14,
                                left: screenwidth*0.0267,top: screenwidth*0.034,
                                child:
                            RatingsRow(rating: 4.5,backgrounddark: true,)),

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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      child: Text(
                                        gettitleforrow2(index),
                                        style: getpoppins(TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            //        fontSize: 13.5
                                            fontSize: screenwidth * 0.0328)),
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                          child: Text(
                                            "\$ " + getpriceforrow2(index),
                                            style: getpoppins(TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                                //         fontSize: 15
                                                fontSize: screenwidth * 0.0364)),
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
                top: screenwidth*0.0352,
                  child: Image.asset(
                    getimageforrow2(index),
                    //      width: 120,
                    width: screenwidth * 0.21,
                  )),]));
          },
        ));  }
  getimageforrow2(int index) {
    if (index == 0) {
      return "assets/images/productimages/burger_sandwich_PNG4114@3x.png";
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
}
