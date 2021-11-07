import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/instances.dart';
import 'package:metrocoffee/core/constants/product_type.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/enums/producttype.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/product_model.dart';
import 'package:metrocoffee/models/user.dart';
import 'package:metrocoffee/models/variants.dart';
import 'package:metrocoffee/core/services/product_service/product_service.dart';
import 'package:metrocoffee/util/internet.dart';

class HomeTabController extends GetxController {
  int currentpageindex = 0;
  bool internetConnected = false;
  Rx<Client?> newUser = Client.empty().obs;
  RxList<Product> allProducts = <Product>[].obs;
  DataState _dataState = DataState.NA;

  get dataState => this._dataState;

  set dataState(value) => this._dataState = value;

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
      // await getProducts();
    }
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
    dataState = DataState.loading;
    try {
      await locator<ProductService>().handleAllProducts();
      dataState = DataState.loaded;
    } on ServerException catch (e) {
      print(e.message);
      dataState = DataState.error;
    }
  }

  Future getProductsOfType(String type) async {
    dataState = DataState.loading;
    try {
      await locator<ProductService>().handleProductsOfType(type: type);
      dataState = DataState.loaded;
    } on ServerException catch (e) {
      print(e.message);
      dataState = DataState.error;
    }
  }

  Future differentiateProductsType(
      String type, Map<String, dynamic> products) async {
    //getting products for different categories
    List<dynamic> prodList = [];
    List<dynamic> mpList = [];
    List<dynamic> rcList = [];

    if (type != "All") {
      prodList = products['data']['products'];
      mpList = products['data']['most_popular'];
      rcList = products['data']['recommendation'];
    }

    switch (type) {
      case ProductType.bakery:
        this.allBakery.clear();
        this.mostPopularBakery.clear();
        this.recommendedBakery.clear();

        //converting json to dart objects
        prodList.forEach((element) {
          var pro = Product.fromJson(element);
          this.allBakery.add(pro);
        });
        mpList.forEach((element) {
          var mpd = Product.fromJson(element);
          this.mostPopularBakery.add(mpd);
        });
        rcList.forEach((element) {
          var rcd = Product.fromJson(element);
          this.recommendedBakery.add(rcd);
        });

        //refreshing all the reactive list
        this.allBakery.refresh();
        this.recommendedBakery.refresh();
        this.mostPopularBakery.refresh();
        break;
      case ProductType.snacks:
        this.allSnacks.clear();
        this.mostPopularSnacks.clear();
        this.recommendedSnacks.clear();

        //converting json to dart objects
        prodList.forEach((element) {
          var pro = Product.fromJson(element);
          this.allSnacks.add(pro);
        });
        mpList.forEach((element) {
          var mpd = Product.fromJson(element);
          this.mostPopularSnacks.add(mpd);
        });
        rcList.forEach((element) {
          var rcd = Product.fromJson(element);
          this.recommendedSnacks.add(rcd);
        });

        //refreshing all the reactive list
        this.allSnacks.refresh();
        this.recommendedSnacks.refresh();
        this.mostPopularSnacks.refresh();
        break;
      case ProductType.drinks:
        this.allDrinks.clear();
        this.mostPopularDrinks.clear();
        this.recommendedDrinks.clear();

        //converting json to dart objects
        prodList.forEach((element) {
          var pro = Product.fromJson(element);
          this.allDrinks.add(pro);
        });
        mpList.forEach((element) {
          var mpd = Product.fromJson(element);
          this.mostPopularDrinks.add(mpd);
        });
        rcList.forEach((element) {
          var rcd = Product.fromJson(element);
          this.recommendedDrinks.add(rcd);
        });

        //refreshing all the reactive list
        this.allDrinks.refresh();
        this.mostPopularDrinks.refresh();
        this.mostPopularDrinks.refresh();
        break;
      default:
        this.allProducts.clear();
        prodList = products['data']['data'];

        //converting json to dart objects
        prodList.forEach((element) {
          var pro = Product.fromJson(element);
          this.allProducts.add(pro);
        });

        //refreshing all the reactive list
        this.allProducts.refresh();
    }
  }

  Future organiseProducts() async {}
}
