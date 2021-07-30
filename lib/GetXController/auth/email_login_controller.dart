import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/constants/fontconstants.dart';

class EmailLoginController extends GetxController{
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  bool showpassword=false;
  bool eye=false;

  Widget loginfields(BuildContext context){
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                //        top: 37
                  top: screenwidth*0.0900
              ),
              padding: EdgeInsets.only(
                //         horizontal: 24
                  left: screenwidth*0.0583,
                  right: 3

              ),
              //      height: 46,
              height: screenwidth*0.1119,
              width: screenwidth,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.all(Radius.circular(26)),
              ),
              child: TextFormField(

                controller: emailcontroller,
                cursorColor: Colors.black87,
                style: TextStyle(
                    fontFamily: poppinsregular,
                    color: Colors.black87,
                    //       fontSize: 13.5
                    fontSize: screenwidth*0.0328
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  suffixIcon: Icon(FeatherIcons.user,
                    color: Color(0xff404d4d),
                    //                 size: 18,
                    size: screenwidth*0.0437,
                  ),
                  border: InputBorder.none,
                  hintText: 'robfox@gmail.com',
                  hintStyle: TextStyle(
                      fontFamily: poppinsregular,
                      color: Color(0xff404d4d)
                  ),

                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                //        top: 37
                  top: screenwidth*0.0800
              ),
              padding: EdgeInsets.only(
                //         horizontal: 24
                  left: screenwidth*0.0583,
                  right: 3
              ),
              //      height: 46,
              height: screenwidth*0.1119,
              width: screenwidth,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.all(Radius.circular(26)),
              ),
              child: TextFormField(
                onChanged: (v){
                  if(passwordcontroller.text!=""){
                    eye=true;
                    update();
                  }
                  if(passwordcontroller.text==""){
                    eye=false;
                    update();
                  }
                },
                obscureText: !showpassword,
                controller: passwordcontroller,
                cursorColor: Colors.black87,
                style: TextStyle(
                    fontFamily: poppinsregular,
                    color: Colors.black87,
                    //       fontSize: 13.5
                    fontSize: screenwidth*0.0328
                ),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: (){
                        showpassword=!showpassword;
                        update();

                      },
                      child:Icon(
                        passwordcontroller.text==""?
                        FeatherIcons.lock:
                        showpassword?
                        FeatherIcons.eyeOff:
                        FeatherIcons.eye
                        ,
                        color: Color(0xff404d4d),
                        //             size: 18,
                        size: screenwidth*0.0437,
                      )),
                  border: InputBorder.none,
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      fontFamily: poppinsregular,
                      color: Color(0xff404d4d)
                  ),

                ),
              ),
            ),

          ],
        ),
      );
  }
}