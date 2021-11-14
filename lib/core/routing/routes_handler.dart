import 'package:flutter/material.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/modules/auth/core_login.dart';
import 'package:metrocoffee/modules/auth/custom/membership_login.dart';
import 'package:metrocoffee/modules/cart/my_product_cart.dart';
import 'package:metrocoffee/modules/checkout/checkout_page.dart';
import 'package:metrocoffee/modules/home/base.dart';
import 'package:metrocoffee/modules/initial/splashscreen.dart';
import 'package:metrocoffee/modules/maps/map.dart';
import 'package:metrocoffee/modules/onboarding/onboardingscreen.dart';
import 'package:metrocoffee/modules/payment/order_succesful_page.dart';
import 'package:metrocoffee/modules/payment/payment_page.dart';
import 'package:metrocoffee/modules/products/product_detail_page.dart';
import 'package:metrocoffee/modules/profile/personal_data_page.dart';
import 'package:metrocoffee/modules/shareables/change_password.dart';
import 'package:metrocoffee/modules/home/searchpage.dart';
import 'package:metrocoffee/modules/profile/contents/favorite_products.dart';
import 'package:metrocoffee/modules/profile/contents/my_order.dart';
import 'package:metrocoffee/modules/profile/contents/order_details.dart';

class RouteHandler {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      PageName.splashscreenpage: (BuildContext context) => SplashScreen(),
      PageName.onboardingpage: (BuildContext context) => OnBoardingScreen(),
      PageName.loginpage: (BuildContext context) => LoginPage(),
      PageName.homepage: (BuildContext context) => Base(),
      PageName.membershiploginpage: (BuildContext context) =>
          MembershipLoginPage(),
      PageName.checkoutpage: (BuildContext context) => CheckoutPage(),
      PageName.personaldatapage: (BuildContext context) => PersonalDataPage(),
      PageName.changepasswordpage: (BuildContext context) =>
          ChangePasswordPage(),
      PageName.myorderspage: (BuildContext context) => MyOrderPage(),
      PageName.favouritesproductpage: (BuildContext context) =>
          FavoriteProductsPage(),
      PageName.orderdetailspage: (BuildContext context) => OrderDetails(),
      PageName.paymentspage: (BuildContext context) => PaymentPage(),
      PageName.ordersucessfullpage: (BuildContext context) =>
          OrderSuccesfulPage(),
      PageName.googlemappage: (BuildContext context) => GoogleMapScreen(),
      PageName.productdetailpage: (BuildContext context) => ProductDetailPage(),
      PageName.productCartPage: (BuildContext context) => MyProductCart(),
      PageName.searchPage: (BuildContext context) => SearchPage(),
    };
  }
}
