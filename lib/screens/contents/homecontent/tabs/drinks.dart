import 'package:flutter/material.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/screens/contents/homecontent/mostpopular.dart';
import 'package:metrocoffee/screens/contents/homecontent/recommendation.dart';
class DrinksTab extends StatelessWidget {
  const DrinksTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          firstrow(context),
          MostPopular(),
          Recommendation()
        ],
      ),
    );
  }

  Widget firstrow(BuildContext context){
    double screenwidth = MediaQuery.of(context).size.width;
    return
      Container(
//        height: 230,
  height: screenwidth*0.5596,
    child:

      ListView.builder(
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index){
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children:[Container(
          margin: EdgeInsets.only(
              left: screenwidth*0.0583,right:index==2? screenwidth*0.0583:0
          ),
  //        height: 192, width: 170,
    height: screenwidth*0.467,width: screenwidth*0.4136,
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
          Stack(
            children: [
              Positioned(
        //          right: -35, top: -30,
          right:-screenwidth*0.0851,top:-screenwidth*0.0729,
                  child:
                  Image.asset(getimageforrow1(index),
        //      width: 185,
          width: screenwidth*0.45012,        )),
              Container(
                padding: EdgeInsets.only(
         //         left:  12,right:10,bottom: 10
           left: screenwidth*0.02919,right: screenwidth*0.0243,bottom: screenwidth*0.0243
                ),
      //          height: 192, width: 170,
                height: screenwidth*0.467,width: screenwidth*0.4136,
                child: Column(
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
              )

            ],
          )),
        )]);
      },
    ));
  }
  getimageforrow1(int index){
  if(index==0){
    return "assets/images/coffee1.png";
  }
  if(index==1){
    return "assets/images/coffe2.png";
  }
  if(index==2){
    return "assets/images/coffee4.png";
  }

  }
  gettitleforrow1(int index){
    if(index==0){
      return "Café Latte";
    }
    if(index==1){
      return "Latte Machiato";
    }
    if(index==2){
      return "Café Americano";
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
