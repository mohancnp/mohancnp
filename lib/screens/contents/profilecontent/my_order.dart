import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/screens/widgets/product/singletimeframeorders.dart';

import '../../../theme.dart';
class MyOrderPage extends StatelessWidget {
  const MyOrderPage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          width: screenwidth,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                title: Text("MY ORDER",style: getpoppins(
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
                  bottom: 0,),
                width: screenwidth,
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0xffA5A5A5).withOpacity(0.4),
                ),
              ),
              Container(
                width: screenwidth,
                  padding: EdgeInsets.only(
//                top:14,bottom: 24
                    left: screenwidth * 0.0535,
                    right: screenwidth * 0.0535,),
                child:
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return SingleTimeFrameReorders(index: index);
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
