import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/instances.dart';
import 'package:metrocoffee/core/constants/product_type.dart';
import 'package:metrocoffee/models/product_model.dart';
import 'package:metrocoffee/models/user.dart';
import 'package:metrocoffee/models/variants.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/user_detail.dart';
import 'package:metrocoffee/services/rest/products.dart';
import 'package:metrocoffee/util/internet.dart';

class HomeTabController extends GetxController {
  int currentpageindex = 0;
  bool internetConnected = false;
  StreamSubscription? streamSubscription;
  Rx<Client?> newUser = Client.empty().obs;

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

  setNewUser(Client newUser) {
    // print("Name received: ${newUser.name}");
    this.newUser.value = newUser;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /*...from list page pass true to update in server as well
  .....no need to update server in case of detail page as it is done from detail controller*/

  Future updateFavoriteDrinksAtId(int id, status,
      [bool fromListPage = false]) async {
    for (int i = 0; i < this.allDrinks.length; i++) {
      var element = this.allDrinks[i];
      if (element.id == id) {
        element.isFavorite = status;
        break;
      }
    }
    this.allDrinks.refresh();
    if (fromListPage) {
      await singleProductService.toggleFavoriteStatus(id: id);
    }
  }

  Future setUserDetail() async {
    Map<String, dynamic> data = await userTableHandler.getUser();
    // print("Dara from DB: $data ");
    setNewUser(Client.fromJson(data));
  }

  /*...from list page pass true to update in server as well
  .....no need to update server in case of detail page as it is done from detail controller*/
  Future updateFavoriteProductAtId(int id, status,
      [bool fromListPage = false]) async {
    bool found = false;
    for (int i = 0; i < this.allBakery.length; i++) {
      // print("Index $i");
      var element = this.allBakery[i];
      if (element.id == id) {
        // print("bakery found");
        element.isFavorite = status;
        this.allBakery.refresh();
        found = true;
        break;
      }
    }

    if (!found) {
      for (int i = 0; i < this.allSnacks.length; i++) {
        var element = this.allSnacks[i];
        if (element.id == id) {
          // print("snacks found");
          element.isFavorite = status;
          this.allSnacks.refresh();
          break;
        }
      }
    }
    if (fromListPage) {
      print("from list page: $id");
      await singleProductService.toggleFavoriteStatus(id: id);
    }
  }

  Future initializeAllData() async {
    // print("data initialized");
    var ready = await checkInternet();
    if (ready) {
      internetConnected = true;
      await getProductsOfType(ProductType.bakery);
      await getProductsOfType(ProductType.drinks);
      await getProductsOfType(ProductType.snacks);
      //for the all menu page
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

//  v-2
  Future checkInternet() async {
    bool ready = await InternetConnectionHelper.isConnectionReady();
    return ready;
    // getProducts();
  }

  //v-2 subscribe to network connection changes and notify when the app
  //is in foreground
  // subscriptionToConnectionChange() {
  //   streamSubscription = Connectivity()
  //       .onConnectivityChanged
  //       .listen((ConnectivityResult result) {
  //     print("listening to changes");
  //   });
  //   streamSubscription?.onData((data) {
  //     if (getBoolFromEnum(data)) {
  //       internetConnected = true;
  //       getProducts();
  //     }
  //   });
  // }

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
          // print('product not null');

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
    // print("$type:$response");
    if (response != null) {
      if (type == ProductType.bakery) {
        //getting products for different categories
        List<dynamic> products = response['data']['products'];
        List<dynamic> mostPopularBakery = response['data']['most_popular'];
        List<dynamic> recommendedBakery = response['data']['recommendation'];
        allBakery.clear();
        this.mostPopularBakery.clear();
        this.recommendedBakery.clear();

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
        this.mostPopularDrinks.clear();
        this.recommendedDrinks.clear();

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
        // print(allDrinks.elementAt(0).name);
        //refreshing all the reactive
        allDrinks.refresh();
        this.recommendedDrinks.refresh();
        this.mostPopularDrinks.refresh();
      } else if (type == ProductType.snacks) {
        allSnacks.clear();
        this.mostPopularSnacks.clear();
        this.recommendedSnacks.clear();

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
