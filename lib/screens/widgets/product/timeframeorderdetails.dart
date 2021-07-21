import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/theme.dart';
class TimeFrameOrderDetails extends StatelessWidget {
  final int? index;
   TimeFrameOrderDetails({Key? key,@required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        //     bottom: 20,top:16
          left: screenwidth * 0.0535,
          right: screenwidth * 0.0535,
          top: screenwidth*0.0389,
          bottom: screenwidth * 0.0486),
      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xffFBFBFB),
        borderRadius: BorderRadius.all(Radius.circular(9)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.07),
        blurRadius: 10,offset: Offset(0,3))]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("Order ID: #5432",style: getpoppins(
                  TextStyle(
                    fontWeight: FontWeight.w500,
                    color: coffeecolor,
                    fontSize: 13.5
                  )
                ),),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("Status",style: getpoppins(
                          TextStyle(
                              fontWeight: FontWeight.w300,
                              color: darkgrey,
                              fontSize: 9.5
                          )
                      ),),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(CupertinoIcons.timer_fill,
                          color: Color(0xffE1C40D),
                          size: 15,),
                          Container(
                            margin: EdgeInsets.only(left: 4),
                            child: Text("Pending",style: getpoppins(
                                TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xffE1C40D),
                                    fontSize: 10.5
                                )
                            ),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 2.5),
                child: Text("Date: 01-02-2021",style: getpoppins(
                    TextStyle(
                        fontWeight: FontWeight.w400,
                        color: darkgrey,
                        fontSize: 11.5
                    )
                ),),
              ),],),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 4),
                child: Text("1:00 pm",style: getpoppins(
                    TextStyle(
                        fontWeight: FontWeight.w400,
                        color: darkgrey,
                        fontSize: 11.5
                    )
                ),),
              ),],),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on,
                size: 15,
                color: darkgrey,),
              Container(
                margin: EdgeInsets.only(left: 4,bottom: 2.5),
                child: Text("2 Saint Street. st",style: getpoppins(
                    TextStyle(
                        fontWeight: FontWeight.w400,
                        color: coffeecolor,
                        decoration: TextDecoration.underline,
                        fontSize: 11
                    )
                ),),
              ),],),
        ],
      ),
    );
  }
}
