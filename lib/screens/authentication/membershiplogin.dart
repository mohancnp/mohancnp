import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/auth/membershipcontroller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/screens/widgets/dialogs/discount_dialog.dart';

class MembershipLogin extends StatelessWidget {
  const MembershipLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar appBar=AppBar(
      elevation: 0,
      backgroundColor: Colors.black.withOpacity(0.14),
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(CupertinoIcons.back,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return

        GetBuilder<MemberShipController>(
          init: MemberShipController(),
          builder: (membershiplogincontroller){
        return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
            body: Image.asset(
              "assets/images/nathan-dumlao-c2Y16tC3yO8-unsplash@3x.png",
              width: screenheight,
              fit: BoxFit.cover,
            )),
        Scaffold(
          appBar: appBar,
          backgroundColor: Colors.transparent,
          body:
          SingleChildScrollView(
            child:
          Container(
            padding: EdgeInsets.symmetric(
              //        horizontal: 18
                horizontal: screenwidth * 0.04379),
            height: screenheight,
            width: screenwidth,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.14),
                      Colors.black.withOpacity(0.8)
                    ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/metro coffee logo@3x.png",
//  width: 58,
                    width: screenwidth * 0.1411,
                  ),
                  padding: EdgeInsets.all(
                    //     5
                      screenwidth * 0.0121),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    //          top: 25
                      top: screenwidth*0.0608    ),
                  child: Text("Welcome to\nMetro Coffee",
                    style: TextStyle(
                        fontFamily: freightbold,
                        color: Colors.white,
                        //       fontSize: 42
                        fontSize: screenwidth*0.102
                    ),),
                ),
                membershiplogincontroller.loginfields(context),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      Container(
                        margin: EdgeInsets.only(
//                            top: 13,left: 10
                            top: screenwidth*0.0316,left: screenwidth*0.02433
                        ),
                        child: Text("Forgot Password?",style: TextStyle(
                            fontFamily: proximanovaregular,
                            color: Colors.white70,
 //                           fontSize: 14.5
                          fontSize: screenwidth*0.0352

                        ),),
                      )]),
                Center(
            child:
                GestureDetector(
                  onTap: (){
                    showDialog(context: context, builder: (_){
                    return  ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        child:SimpleDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),

                          children:[DiscountDialog()]));
                    });

                  },
                  child:Container(
                    margin: EdgeInsets.only(
//                        top: 34
                        top: screenwidth*0.08272
                    ),
//                    height: 46, width: 181,
                    height: screenwidth*0.111, width: screenwidth*0.4403,
                    decoration: BoxDecoration(
                      color: Color(0xffD4874C),
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      boxShadow: [BoxShadow(color: Color(0xffC3916A4D),
                      blurRadius: 30,offset: Offset(0,9)
                      )]
                    ),
                    child: Center(
                      child: Container(
                        child: Text("SIGN IN",style: TextStyle(
                          fontFamily: poppinsregular,
                          color: Colors.white,
 //                         fontSize: 16
                          fontSize: screenwidth*0.0389
                        ),),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),)
        )
      ],
    );});
  }
}
