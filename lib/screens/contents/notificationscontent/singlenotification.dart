import 'package:flutter/material.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
class SingleNotification extends StatelessWidget {
  final int? index;
  const SingleNotification({Key? key,@required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
 //         bottom: 12
   bottom: screenwidth*0.02919
      ),
      width: screenwidth,
    //  height: 72,
      height: screenwidth*0.175,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(9)),
        boxShadow: [BoxShadow(color: Colors.black12,offset: Offset(0,3),blurRadius: 30)]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
    //        height: 72, width: 6,
            height: screenwidth*0.175,width: screenwidth*0.0145,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(7),bottomLeft:Radius.circular(7) ),
              color: index!.isOdd?Colors.redAccent:Color(0xff550E1C),
                boxShadow: [BoxShadow(color: Colors.black12,offset: Offset(0,3),blurRadius: 30)]
            ),
          ),
          Container(
            margin: EdgeInsets.only(
      //          left: 14,right: 12
            left: screenwidth*0.03406,right:screenwidth*0.0291
            ),
       //     height: 54,width: 54,
         height: screenwidth*0.1313,width: screenwidth*0.1313,
            decoration: BoxDecoration(
              color: Color(0xffE8E8E8),
              shape: BoxShape.circle
            ),
            child: Center(
              child: Image.asset(getorderimage(index),
     //         height: 54,
              height:  screenwidth*0.1313,
                fit: BoxFit.cover,),
            ),
          ),
          Container(
      //      height: 54,
            height:  screenwidth*0.1313,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(getordertext(index),style: getpoppins(
                    TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff404D4D),
                //      fontSize: 12.5
                  fontSize: screenwidth*0.0304
                    )
                  ),),
                ),
                Container(
                  child: Text("4 hours ago",style: getpoppins(
                      TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff404D4D).withOpacity(0.6),
                 //         fontSize: 11.5
                  fontSize: screenwidth*0.02798
                      )
                  ),),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
  getordertext(int? index){
    if(index!.isEven){
      return "Your order has been delivered!";
    }
    if(index.isOdd){
      return "Your order has been cancelled!";
    }
  }
  getorderimage(int? index){
    if(index!.isEven){
      return "assets/images/singlecup.png";
    }
    if(index.isOdd){
      return "assets/images/favpng_coffee-cup-clip-art-image@3x.png";
    }
  }
}
