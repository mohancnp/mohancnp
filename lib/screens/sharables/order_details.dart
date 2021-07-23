import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/screens/widgets/product/singletimeframeorderdetails.dart';

import '../../theme.dart';
class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffF3F5F5),
      body: Container(
        width: screenwidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(
              title: Text("ORDER DETAILS",style: getpoppins(
                  TextStyle(
                      fontWeight: FontWeight.w400,
                      color: darkgrey,
                      //    fontSize: 16.5
                      fontSize: screenwidth*0.0401 )
              ),),
              centerTitle: true,
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(CupertinoIcons.back,
                  color: darkgrey,
//                size: 28,
                  size: screenwidth*0.0681,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,),
            Container(
              margin: EdgeInsets.only(
//                top:14,bottom: 24
                left: screenwidth * 0.0535,
                right: screenwidth * 0.0535,
                top: 26,
                bottom: 14,),
              width: screenwidth,
              height: 1,
              decoration: BoxDecoration(
                color: Color(0xffA5A5A5).withOpacity(0.4),
              ),
            ),
            ListView.builder(
                itemCount: 1,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index){
                  return SingleTimeFrameOrderDetails(
                    index: index,
                  );

            })

          ],
        ),
      ),
    );
  }
}
