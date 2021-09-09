import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:metrocoffee/locator.dart';
import 'package:metrocoffee/screens/authentication/change_password.dart';
import 'package:metrocoffee/screens/authentication/email_login.dart';
import 'package:metrocoffee/screens/authentication/login.dart';
import 'package:metrocoffee/screens/authentication/membershiplogin.dart';
import 'package:metrocoffee/screens/base/base.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabs/all_menu.dart';
import 'package:metrocoffee/screens/contents/profilecontent/favorite_products.dart';
import 'package:metrocoffee/screens/contents/profilecontent/my_order.dart';
import 'package:metrocoffee/screens/contents/profilecontent/personal_data.dart';
import 'package:metrocoffee/screens/initial/splashscreen.dart';
import 'package:metrocoffee/screens/sharables/checkout.dart';
import 'package:metrocoffee/screens/sharables/drink_detail.dart';
import 'package:metrocoffee/screens/sharables/order_details.dart';
import 'package:metrocoffee/screens/sharables/order_succesful_page.dart';
import 'package:metrocoffee/screens/sharables/payment_page.dart';
import 'package:metrocoffee/screens/sharables/product_detail.dart';
import 'package:metrocoffee/test/apitest.dart';
import 'package:shared_preferences/shared_preferences.dart';
GetIt getIt = GetIt.instance;

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Metro Coffee',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Base(),
      routes: <String, WidgetBuilder>{
        '/Login': (BuildContext context) => Login(),
        '/Base': (BuildContext context) => Base(),
        '/DrinkDetails': (BuildContext context) => DrinkDetail(),
        '/AllMenu': (BuildContext context) => AllMenu(),
        '/ProductDetails': (BuildContext context) => ProductDetail(),
        '/CheckoutPage': (BuildContext context) => CheckoutPage(),
        '/PersonalDataPage': (BuildContext context) => PersonalData(),
        '/ChangePassword': (BuildContext context) => ChangePasswordPage(),
        '/MyOrders': (BuildContext context) => MyOrderPage(),
        '/FavoriteProducts': (BuildContext context) => FavoriteProductsPage(),
        '/OrderDetails': (BuildContext context) => OrderDetails(),
        '/PaymentsPage': (BuildContext context) => PaymentPage(),
        '/OrderSuccesfulPage': (BuildContext context) => OrderSuccesfulPage(),
        '/EmailLoginPage': (BuildContext context) => EmailLogin(),

      },
    );
  }
  Future<int> _getloginstatus() async {
    final prefs = await SharedPreferences.getInstance();
    final loginstatus = prefs.getInt('loginstatus');
    if (loginstatus == null) {
      return 0;
    }
    return loginstatus;
  }
}
