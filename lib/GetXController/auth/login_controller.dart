import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:metrocoffee/screens/widgets/dialogs/discount_dialog.dart';
import 'package:metrocoffee/services/api_service.dart';

import '../../locator.dart';

class LoginController extends GetxController {
  bool isSigningIn=false;
  final googleSignIn=GoogleSignIn();
  final FacebookLogin facebookLogin=FacebookLogin();

  setloggingstatetrue(){
    isSigningIn=true;
    update();
  }
  setloggingstatefalse(){
    isSigningIn=false;
    update();
  }

  loginwithemail(BuildContext context, {
    String? emailaddress, String? password}) async {
    setloggingstatetrue();
    Map response = await locator<ApiService>().emaillogin(
        email: emailaddress,
        password: password
    );
    print(response.values);
    if (response.containsKey("data")) {
      setloggingstatefalse();
      showDialog(context: context, builder: (_) {
        return SimpleDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),

            children: [DiscountDialog()]);
      });
    }
    else {
      setloggingstatefalse();
      print("error");
    }
  }

  changepassword(String? currentpass,String? newpass,String? confirmnewpass,)async{
    Map response=await locator<ApiService>().changepassword(
      currentpassword:currentpass ,newpassword: newpass,confirmnewpassword: confirmnewpass
    );
    print(response.values);
  }

  loginwithmembershipid(BuildContext context,{
    String? membershipnumber, String? password}) async {
    setloggingstatetrue();
    Map response = await locator<ApiService>().membershiplogin(
        membershipnumber: membershipnumber,
        password: password
    );
    print(response.values);
    if(response.containsKey("data")){
      setloggingstatefalse();
      showDialog(context: context, builder: (_){
        return SimpleDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),

            children:[DiscountDialog()]);
      });
    }
    else{
      setloggingstatefalse();
      print("error");
    }
  }
  Future googlelogin()async{
    setloggingstatetrue();
    await googleSignIn.signOut();
    final user=await googleSignIn.signIn();
    if(user==null){
      print('userisnull');
      setloggingstatefalse();
      return ;
    }
    else{
      setloggingstatefalse();
      print('userisnotnull');
      final googleAuth=await user.authentication;
      print(googleAuth.accessToken);

    }

  }

  Future facebooklogin()async{
    setloggingstatetrue();
  await facebookLogin.logOut();
    final FacebookLoginResult facebookLoginResult=await
        facebookLogin.logIn(permissions: [
          FacebookPermission.publicProfile,
          FacebookPermission.email,
        ]);
    switch(facebookLoginResult.status){
      case FacebookLoginStatus.success:
        final String facebookAccessToken=facebookLoginResult.accessToken!.token;
        print("FB access token"+facebookAccessToken);
        setloggingstatefalse();
        //print("Userid"+facebookAccessToken.userId);
        break;
      case FacebookLoginStatus.cancel:
        print("cancelled by user");
        setloggingstatefalse();
        break;
      case FacebookLoginStatus.error:
        print("error loggin into fb");
        setloggingstatefalse();
        break;

    }

  }


  logout(){

  }


}