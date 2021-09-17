import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/models/product_model.dart';
import 'package:metrocoffee/services/rest/products.dart';
import 'package:metrocoffee/util/internet.dart';

class HomeTabController extends GetxController {
  int currentpageindex = 0;
  List<Product> prods = [];
  bool internetConnected = false;

  @override
  void onInit() {
    super.onInit();
    checkInternetAndRetrieveProducts();
  }

  void checkInternetAndRetrieveProducts() async {
    bool ready = await isConnectionReady();
    if (ready) {
      internetConnected = !internetConnected;
      update();
      getProducts();
    }
  }

  setpageindex(int index) {
    currentpageindex = index;
    update();
  }

  Widget getcurrenttab() {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 250),
    );
  }

  void getProducts() async {
    prods.clear();

    ProductService().getAllProducts().then((products) {
      if (products != null) {
        var list = products.data['data']['data'];
        list.forEach((element) {
          var data = Product.fromJson(element);
          prods.add(data);
          // prods.add(element);
        });
        update();
        // prods=
        // print("product list: ${products.data['data']['data']}");
      }
    });
  }
}
