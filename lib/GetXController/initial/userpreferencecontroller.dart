
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/constants/fontconstants.dart';

class UserPreferenceController extends GetxController{
  String? preferencechoice='collection';
  String collection='collection';
  String delivery='delivery';

  setpreferenceascollection(){
    preferencechoice=collection;
    update();
  }
  setpreferenceasdelivery(){
    preferencechoice=delivery;
    update();
  }

  Widget preferenceoptions(BuildContext context){
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
 //         top: 29
   top: screenwidth*0.0705
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              setpreferenceascollection();
                  Navigator.of(context).pushReplacementNamed("Base");
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
//              height: 40, width: 200,
              height: screenwidth*0.0973, width: screenwidth*0.486,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Color(0xC3916A4D).withOpacity(0.2),
                offset: Offset(0,9),blurRadius: 30)],
                  color: preferencechoice==collection?Color(0xffD4874C):
                  Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  border:
                  Border.all(width: 2,color: preferencechoice==collection?
                  Colors.transparent:Color(0xffE16D14))
              ),
              child: Center(
                child: Text("COLLECTIONS",style: TextStyle(
                    fontFamily: poppinsregular,
                    color:preferencechoice==collection?Colors.white:
                    Color(0xffE16D14),
         //           fontSize: 12.5
           fontSize: screenwidth*0.0304
                ),),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
       //         top: 25
         top: screenwidth*0.0608
            ),
          child:
          GestureDetector(
            onTap: (){
              setpreferenceasdelivery();
              Navigator.of(context).pushReplacementNamed('/Base');
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
  //            height: 40, width: 200,
              height: screenwidth*0.0973, width: screenwidth*0.486,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Color(0xC3916A4D).withOpacity(0.2),
                      offset: Offset(0,9),blurRadius: 30)],
                color:  preferencechoice==delivery?Color(0xffD4874C):
                Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25)),
                border: Border.all(width: 2,color:
                preferencechoice==delivery?Colors.transparent:
                Color(0xffE16D14))
              ),
              child: Center(
                child: Text("DELIVERY",style: TextStyle(
                  fontFamily: poppinsregular,
                  color:preferencechoice==delivery?Colors.white:
                  Color(0xffE16D14),
      //            fontSize: 12.5
                    fontSize: screenwidth*0.0304
                ),),
              ),
            ),
          ))
        ],
      ),
    );
  }

}