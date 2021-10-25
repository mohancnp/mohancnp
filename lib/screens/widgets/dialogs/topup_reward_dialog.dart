import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/theme.dart';
class TopUpRewardDialog extends StatelessWidget {
  const TopUpRewardDialog({Key? key,this.rewardPoint}) : super(key: key);
  final String? rewardPoint;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
//          horizontal: 12.5
          horizontal: screenwidth*0.03041
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(9)),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(CupertinoIcons.xmark_circle,
                color: darkgrey,
//                size: 24,
                  size: screenwidth*0.0583,
                ),
              )

            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
//                height: 82, width: 82,
                height: screenwidth*0.199, width:  screenwidth*0.199,
                decoration: BoxDecoration(
                  color: Color(0xffEBEBEB),
                  shape: BoxShape.circle
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/badge.svg",
                    color: Color(0xff5AB898),
            //        width: 34,
                    width: screenwidth*0.0827,
                    fit: BoxFit.cover,),
                ),
              ),

            ],
          ),
          Container(
            margin: EdgeInsets.only(
//                top: 16,bottom: 29
                top: screenwidth*0.0389,bottom: screenwidth*0.07055
            ),
            child: Text("Earn 100 reward points with\nevery pound spent.",
              textAlign: TextAlign.center,
              style: getpoppins(
                  TextStyle(
//                      fontSize: 13.5,
                      fontSize: screenwidth*0.0328,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400
                  )
              ),),
          )

        ],
      ),
    );
  }
}
