import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/constants/fontconstants.dart';

import '../../../theme.dart';
class DeleteOrderDialog extends StatelessWidget {
  const DeleteOrderDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
//          horizontal: 12.5,vertical:12.5
          horizontal: screenwidth*0.03041,vertical:  screenwidth*0.03041
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
                    child:
                    Icon(CupertinoIcons.delete,
                      color: coffeecolor,
//                  size: 39,
                      size: screenwidth*0.09489,
                    )
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
//                top: 16,bottom: 29
                top: screenwidth*0.0389,bottom: screenwidth*0.07055
            ),
            child: Text("Remove your order?",
              textAlign: TextAlign.center,
              style: getpoppins(
                  TextStyle(
//                      fontSize: 13.5,
                      fontSize: screenwidth*0.0328,
                      color: darkgrey,
                      fontWeight: FontWeight.w400
                  )
              ),),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
//            width: 185,height: 36,
              width: screenwidth*0.450,height: screenwidth*0.0875,
              decoration: BoxDecoration(
                  color: coffeecolor,
                  borderRadius: BorderRadius.all(Radius.circular(17)),
                  boxShadow: [BoxShadow(
                      color: Color(0xffC3916A).withOpacity(0.2),
                      blurRadius: 30,offset: Offset(0,9)
                  )]
              ),
              child: Center(
                child: Text(
                  "Delete",
                  textAlign: TextAlign.center,
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      //      fontSize: 13.5
                      fontSize: screenwidth*0.0328
                  )),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(
//                top: 16
                  top: screenwidth*0.0389
              ),
//            width: 185,height: 36,
              width: screenwidth*0.450,height: screenwidth*0.0875,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: coffeecolor,
                    width: 1.2,),
                  borderRadius: BorderRadius.all(Radius.circular(17)),
                  boxShadow: [BoxShadow(
                      color: Color(0xffC3916A).withOpacity(0.2),
                      blurRadius: 30,offset: Offset(0,9)
                  )]
              ),
              child: Center(
                child: Text(
                  "Cancel",
                  textAlign: TextAlign.center,
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w300,
                      color: coffeecolor,
                      //      fontSize: 13.5
                      fontSize: screenwidth*0.0328
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
