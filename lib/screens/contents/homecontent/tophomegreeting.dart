import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:metrocoffee/constants/fontconstants.dart';

class TopHomeGreeting extends StatelessWidget {
  const TopHomeGreeting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(

      width: screenwidth,
     padding: EdgeInsets.only(
//         horizontal: 24,vertical: 24
           left: screenwidth*0.0583,right: screenwidth*0.0583,
   //     top:35,
    top: screenwidth*0.0851
     ),
     child:
     Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children:[
       Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Text(
              int.parse(DateFormat.H('en_US').format(DateTime.now())) < 12
                  ? 'Good Morning,'+' Judas'
                  : int.parse(DateFormat.H('en_US').format(DateTime.now())) < 16
                      ? 'Good Afternoon,'+' Judas'
                      : 'Good Evening,'+' Judas',
                  style: TextStyle(
                    fontFamily: montserratsemibold,
                    color: Colors.white,
               //     fontSize: 20.5
                 fontSize: screenwidth*0.0498
                  ),
            )),
            Container(
              margin: EdgeInsets.only(
          //        top: 3
            top: screenwidth*0.00729
              ),
                child: Text(
               "You can order drinks to take away.",
                  style: TextStyle(
                      fontFamily: poppinslight,
                      color: Color(0xF3F3F3D6),
            //          fontSize: 11.5
              fontSize: screenwidth*0.0279
                  ),
                )),
          ],
        ),
      ),
        GestureDetector(onTap: (){

        }, child: Container(
          child: Image.asset(
            "assets/images/metro coffee logo@3x.png",
//  width: 45,
            width: screenwidth*0.1094
          ),
          padding: EdgeInsets.all(
            //     5
              1),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),)])
    );
  }
}
