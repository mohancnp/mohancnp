import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/config.dart';
import 'package:metrocoffee/locator.dart';
import 'package:metrocoffee/models/UserprofileModel.dart';
import 'package:metrocoffee/models/product_model.dart';
import 'package:metrocoffee/services/api_service.dart';
class APITest extends StatelessWidget {
   APITest({Key? key}) : super(key: key);
  List<Product> prods=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [IconButton(
            onPressed: ()async{
              getproducts();
            }, icon:
        Icon(CupertinoIcons.add_circled_solid,
        color: Colors.black87,
        size: 24,))],
      ),
      body: Container(
        child: Column(
          children: [
            Image.asset("http://metro.clickandpress.com/api/product/storage/uploads/product/2021/7/BfphddsfUFWhGQ521Wra9JJGvlPGZmfvvWp6GAiW.jpg",
              width: 200,)
          ],
        ),
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

  getproducts()async{
    Map response=await locator<ApiService>().getallproducts();
    print(response.values);
    List<dynamic> productlist = response['data']['data'] as List;
    var products = productlist.map<Product>((json) => Product.fromJson(json));
    prods.addAll(products);
    for(int i=0;i<=prods.length-1;i++){
      print("Name:"+prods[i].name.toString());
      print("Image:"+prods[i].image.toString());
      print("Price:"+prods[i].price.toString());

    }

  }

  profiledata()async{
    Map<String,dynamic> response=await locator<ApiService>().getprofiledata();
    print(response.values);
    UserProfile user=UserProfile.fromJson(response["data"]);
    print(user.name);
    print(user.membershipnumber);
    print(user.status);
    print(user.createdat);

  }
  changepassword(String? currentpass,String? newpass,String? confirmnewpass)async{
    Map<String,dynamic> response=await locator<ApiService>().changepassword(
        currentpassword:currentpass ,newpassword: newpass,confirmnewpassword: confirmnewpass
    );
    print(response.values);
  }
  updateprofiledata()async{
    Map response=await locator<ApiService>().updateprofiledata(
        name: "TEst name",
      email: "admin@admin.com",
      phone: "98098098ij-09",
      profilepic:"/storage/uploads/user/2021/7/LM5br0myKLSguw4qBU5MKPks3f0KapSI94IUjxDB.jpg"
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
