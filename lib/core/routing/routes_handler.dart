import 'package:flutter/material.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/modules/home/base.dart';
import 'package:metrocoffee/modules/initial/splashscreen.dart';
import 'package:metrocoffee/modules/onboarding/onboardingscreen.dart';
import 'package:metrocoffee/screens/authentication/change_password.dart';
import 'package:metrocoffee/screens/authentication/email_login.dart';
import 'package:metrocoffee/screens/authentication/login.dart';
import 'package:metrocoffee/screens/authentication/membershiplogin.dart';
import 'package:metrocoffee/screens/authentication/register.dart';
import 'package:metrocoffee/screens/contents/homecontent/product_detail_page.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabs/all_menu.dart';
import 'package:metrocoffee/screens/contents/profilecontent/favorite_products.dart';
import 'package:metrocoffee/screens/contents/profilecontent/my_order.dart';
import 'package:metrocoffee/screens/contents/profilecontent/personal_data.dart';
import 'package:metrocoffee/screens/maps/map.dart';
import 'package:metrocoffee/screens/sharables/checkout.dart';
import 'package:metrocoffee/screens/sharables/drink_detail.dart';
import 'package:metrocoffee/screens/sharables/no_internet.dart';
import 'package:metrocoffee/screens/sharables/order_details.dart';
import 'package:metrocoffee/screens/sharables/order_succesful_page.dart';
import 'package:metrocoffee/screens/sharables/payment_page.dart';

class RouteHandler {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      PageName.splashscreenpage: (BuildContext context) => SplashScreen(),
      PageName.loginpage: (BuildContext context) => Login(),
      PageName.homepage: (BuildContext context) => Base(),
      PageName.socialregisterpage: (BuildContext context) => SocialRegister(),
      PageName.drinkdetailpage: (BuildContext context) => DrinkDetail(),
      PageName.allmenupage: (BuildContext context) => AllMenu(),
      PageName.checkoutpage: (BuildContext context) => CheckoutPage(),
      PageName.personaldatapage: (BuildContext context) => PersonalData(),
      PageName.changepasswordpage: (BuildContext context) =>
          ChangePasswordPage(),
      PageName.myorderspage: (BuildContext context) => MyOrderPage(),
      PageName.favouritesproductpage: (BuildContext context) =>
          FavoriteProductsPage(),
      PageName.orderdetailspage: (BuildContext context) => OrderDetails(),
      PageName.paymentspage: (BuildContext context) => PaymentPage(),
      PageName.ordersucessfullpage: (BuildContext context) =>
          OrderSuccesfulPage(),
      PageName.emailloginpage: (BuildContext context) => EmailLogin(),
      PageName.googlemappage: (BuildContext context) => GoogleMapScreen(),
      PageName.membershiploginpage: (BuildContext context) => MembershipLogin(),
      PageName.onboardingpage: (BuildContext context) => OnBoardingScreen(),
      PageName.productdetailpage: (BuildContext context) => ProductDetailPage(),
      PageName.nointernetpage: (BuildContext context) => NoInternet(),
    };
  }
}
