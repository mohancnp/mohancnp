import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/models/product_model.dart';
import 'package:metrocoffee/services/api_service.dart';

import '../../../locator.dart';

class HomeTabController extends GetxController {
  int currentpageindex = 0;
  List<Product> prods = [];

  setpageindex(int index) {
    currentpageindex = index;
    update();
  }

  Widget getcurrenttab() {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 250),
    );
  }

  getallproducts() async {
    prods.clear();
    Map response = await locator<ApiService>().getallproducts();
    print(response.values);
    List<dynamic> productlist = response['data']['data'] as List;
    var products = productlist.map<Product>((json) => Product.fromJson(json));
    prods.addAll(products);
    for (int i = 0; i <= prods.length - 1; i++) {
      print("Name:" + prods[i].name!.toString());
      print("Image:" + prods[i].image!.toString());
      print("Price:" + prods[i].price!.toString());
    }
    update();
  }
}
