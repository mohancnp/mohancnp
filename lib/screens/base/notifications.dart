import 'package:flutter/material.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/screens/contents/notificationscontent/singledaynotification.dart';
class Notifications extends StatelessWidget {
const Notifications({Key? key})  : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("NOTIFICATIONS",style: TextStyle(
          fontFamily: poppinsmedium,
          color: Color(0xff404D4D),
       //   fontSize: 16
        fontSize: screenwidth* 0.0389
        ),),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
          child:Container(
        child: Column(
          children: [
            ListView.builder(
              physics: BouncingScrollPhysics(),
                itemCount: 3,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return
            SingleDayNotifications(index: index,);}),

          ],
        ),
      )),
    );
  }
}
