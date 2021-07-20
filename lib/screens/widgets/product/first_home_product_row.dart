import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/screens/widgets/product/ratings_row.dart';
import 'package:metrocoffee/theme.dart';
class FirstHomeProductRow extends StatelessWidget {
  const FirstHomeProductRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return   Container(
//        height: 230,
        height: screenwidth*0.5996,
        child:

        ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index){
            return
              GestureDetector(
                  onTap: (){
                    Navigator.pushNamedAndRemoveUntil(context, '/ProductDetails', (route) => true);
                  },
                  child:
                      Container(
                          margin: EdgeInsets.only(
                              left: screenwidth*0.0583,right:index==2? screenwidth*0.0583:0

                          ),
//                          height: 110,width: 180,
                          height: screenwidth*0.267,width: screenwidth*0.4379,
                          child:
                      Stack(
            children:[
                  Positioned(
               //     bottom: 44,
                 bottom: screenwidth*0.107,
                    left: 0,
                    child:
                        Container(
//                          height: 170,width: 168,
                          height: screenwidth*0.4136,width: screenwidth*0.408,
                          decoration: BoxDecoration(
                            color:Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            boxShadow: [BoxShadow(color: Colors.black26,
                                offset: Offset(0,9),blurRadius: 30)]
                        ),
                        child:
                        ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            child:
                                Container(
                                  padding: EdgeInsets.only(
                                    //         left:  12,right:10,bottom: 10
                                      left: screenwidth*0.02919,right: screenwidth*0.0243,bottom: screenwidth*0.0243
                                  ),
                                  //          height: 192, width: 170,
                            //      height: 170,width: 168,
                                  height: screenwidth*0.4136,width: screenwidth*0.408,
                                  child: Stack(
                                    children:[

                                      Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          child: Text(
                                            gettitleforrow1(index),
                                            style: getpoppins(
                                                TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff404D4D),
                                                    //        fontSize: 14
                                                    fontSize: screenwidth*0.034063
                                                )
                                            ),
                                          )
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                              child: Text(
                                                "\$ "+getpriceforrow1(index),
                                                style: getpoppins(
                                                    TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        color: Color(0xff550E1C),
                                                        //         fontSize: 15
                                                        fontSize: screenwidth*0.0364
                                                    )
                                                ),
                                              )
                                          ),
                                          Container(
                                            //      height: 29,width: 29,
                                            height: screenwidth*0.07055,width: screenwidth*0.07055,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2),
                                                    blurRadius: 15,
                                                    offset: Offset(0,3)),
                                                ],
                                                shape: BoxShape.circle
                                            ),
                                            child: Center(
                                              child: GestureDetector(
                                                onTap: (){

                                                },
                                                child: Icon(Icons.favorite,
                                                  color: Colors.redAccent,
                                                  //    size: 17,
                                                  size: screenwidth*0.04136,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),

                                    ],
                                  ),
                                      Positioned(
                                          left: 0,
                                     //     top: 12,
                                       top: screenwidth*0.02919,
                                          child: RatingsRow(rating:4.5,backgrounddark: false,)), ]),
                                )
                        ),
                      )),
              Positioned(
                //          right: -35, top: -30,
                  right:0,top:0,
                  child:
                  Image.asset(getimageforrow1(index),
                    //      width: 185,
                    width: screenwidth*0.3012,        )),

            ])));
          },
        ));
  }
  getimageforrow1(int index){
    if(index==0){
      return "assets/images/productimages/burgermetrocoffee.png";
    }
    if(index==1){
      return "assets/images/productimages/correctsandwich.png";
    }
    if(index==2){
      return "assets/images/productimages/pngfind.com-pizza-emoji-png-800270@3x.png";
    }

  }
  gettitleforrow1(int index){
    if(index==0){
      return "Burger";
    }
    if(index==1){
      return "Sandwich";
    }
    if(index==2){
      return "Pizza";
    }

  }
  getpriceforrow1(int index){
    if(index==0){
      return "3.00";
    }
    if(index==1){
      return "2.00";
    }
    if(index==2){
      return "4.00";
    }
  }

}
