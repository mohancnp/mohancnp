import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/constants/product_type.dart';
import 'package:metrocoffee/models/product_model.dart';
import 'package:metrocoffee/models/variants.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/user_detail.dart';
import 'package:metrocoffee/services/rest/products.dart';
import 'package:metrocoffee/util/internet.dart';

class HomeTabController extends GetxController {
  int currentpageindex = 0;
  bool internetConnected = false;
  StreamSubscription? streamSubscription;
  ProductService productService = ProductService.getInstance();
  Rx<String?> name = 'Judas'.obs;
  List<Product> allProducts = [];

  RxList<Product> allDrinks = <Product>[].obs;
  RxList<Product> allSnacks = <Product>[].obs;
  RxList<Product> allBakery = <Product>[].obs;

  RxList<Product> mostPopularDrinks = <Product>[].obs;
  RxList<Product> recommendedDrinks = <Product>[].obs;

  RxList<Product> mostPopularBakery = <Product>[].obs;
  RxList<Product> recommendedBakery = <Product>[].obs;

  RxList<Product> mostPopularSnacks = <Product>[].obs;
  RxList<Product> recommendedSnacks = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    // streamSubscription?.cancel();
  }

  Future initializeAllData() async {
    var ready = await checkInternet();
    if (ready) {
      internetConnected = true;
      await getProductsOfType(ProductType.drinks);
      await getProductsOfType(ProductType.snacks);
      await getProductsOfType(ProductType.bakery);
      await getProducts();
      return true;
    }
    return false;
  }

  //v-2
  Future<ProductDetail?> getProductDetails(int id) async {
    ProductDetail prodObj;
    return productService.getSingleProduct(id: id).then((response) {
      // print("single product detail: $response");
      prodObj = ProductDetail.fromJson(response['data']);
      return prodObj;
    });
  }

  setUserName() {
    getUserName().then((name) {
      this.name.value = name ?? "";
    });
  }

//  v-2
  Future checkInternet() async {
    bool ready = await isConnectionReady();
    return ready;
    // getProducts();
  }

  //v-2 subscribe to network connection changes and notify when the app
  //is in foreground
  subscriptionToConnectionChange() {
    streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print("listening to changes");
    });
    streamSubscription?.onData((data) {
      if (getBoolFromEnum(data)) {
        internetConnected = true;
        getProducts();
      }
    });
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

  Future getProducts() async {
    allProducts.clear();
    if (internetConnected) {
      productService.getAllProducts().then((products) {
        if (products != null) {
          print('product not null');

          var list = products.data['data']['data'];
          list.forEach((element) {
            var data = Product.fromJson(element);
            allProducts.add(data);
            // prods.add(element);
          });
          update();
        }
      });
    }
  }

  Future getProductsOfType(String type) async {
    var response = await productService.getProductsOfType(type: type);
    print("$type:$response");
    if (response != null) {
      if (type == ProductType.bakery) {
        allBakery.clear();
        this.mostPopularBakery.clear();
        this.recommendedBakery.clear();

        //getting products for different categories
        List<dynamic> products = response['data']['products'];
        List<dynamic> mostPopularBakery = response['data']['most_popular'];
        List<dynamic> recommendedBakery = response['data']['recommendation'];

        //converting json to dart objects
        products.forEach((element) {
          var pro = Product.fromJson(element);
          allBakery.add(pro);
        });
        mostPopularBakery.forEach((element) {
          var mpd = Product.fromJson(element);
          this.mostPopularBakery.add(mpd);
        });
        recommendedBakery.forEach((element) {
          var rcd = Product.fromJson(element);
          this.recommendedBakery.add(rcd);
        });

        //refreshing all the reactive list
        allBakery.refresh();
        this.recommendedBakery.refresh();
        this.mostPopularBakery.refresh();
      } else if (type == ProductType.drinks) {
        allDrinks.clear();

        List<dynamic> products = response['data']['products'];
        List<dynamic> mostPopularDrinks = response['data']['most_popular'];
        List<dynamic> recommendedDrinks = response['data']['recommendation'];

        //converting all the data to dart objects
        products.forEach((element) {
          var pro = Product.fromJson(element);
          allDrinks.add(pro);
        });
        mostPopularDrinks.forEach((element) {
          var mpd = Product.fromJson(element);
          this.mostPopularDrinks.add(mpd);
        });
        recommendedDrinks.forEach((element) {
          var rcd = Product.fromJson(element);
          this.recommendedDrinks.add(rcd);
        });
        //refreshing all the reactive list
        this.recommendedDrinks.refresh();
        this.mostPopularDrinks.refresh();
        allDrinks.refresh();
      } else if (type == ProductType.snacks) {
        allSnacks.clear();
        //getting products for different categories
        List<dynamic> products = response['data']['products'];
        List<dynamic> mostPopularSnacks = response['data']['most_popular'];
        List<dynamic> recommendedSnacks = response['data']['recommendation'];

        //converting json to dart objects
        products.forEach((element) {
          var pro = Product.fromJson(element);
          allSnacks.add(pro);
        });
        mostPopularSnacks.forEach((element) {
          var mpd = Product.fromJson(element);
          this.mostPopularSnacks.add(mpd);
        });
        recommendedSnacks.forEach((element) {
          var rcd = Product.fromJson(element);
          this.recommendedSnacks.add(rcd);
        });

        //refreshing all the reactive list
        allSnacks.refresh();
        this.recommendedSnacks.refresh();
        this.mostPopularSnacks.refresh();
      }
    }
  }
}
