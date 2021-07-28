import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/locator.dart';
import 'package:metrocoffee/services/api_service.dart';
class APITest extends StatelessWidget {
  const APITest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [IconButton(
            onPressed: ()async{
              changepassword('testpassword', 'adminadmin','adminadmin');
            }, icon:
        Icon(CupertinoIcons.add_circled_solid,
        color: Colors.black87,
        size: 24,))],
      ),
    );
  }
  emaillogin()async{
    Map response=await locator<ApiService>().emaillogin(
        email: "admin@admin.com",
        password: "adminadmin"
    );
    print(response.values);
  }

  changepassword(String? currentpass,String? newpass,String? confirmnewpass)async{
    Map response=await locator<ApiService>().changePassword(
        oldPassword:currentpass ,newPassword: newpass,confirmnewPassword: confirmnewpass
    );
    print(response.values);
  }
  membershiplogin()async{
    Map response=await locator<ApiService>().membershiplogin(
        membershipnumber: "metro-1",
        password: "adminadmin"
    );
    print(response.values);
  }
}
