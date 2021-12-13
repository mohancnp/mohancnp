import 'package:get/get.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/modules/auth/core_login.dart';
import 'package:metrocoffee/modules/auth/custom/email/email_login.dart';
import 'package:metrocoffee/modules/auth/custom/email/email_signup.dart';
import 'package:metrocoffee/modules/auth/custom/membership/membership_login.dart';
import 'package:metrocoffee/modules/cart/my_product_cart.dart';
import 'package:metrocoffee/modules/checkout/checkout_page.dart';
import 'package:metrocoffee/modules/home/base.dart';
import 'package:metrocoffee/modules/initial/splashscreen.dart';
import 'package:metrocoffee/modules/maps/map.dart';
import 'package:metrocoffee/modules/onboarding/onboardingscreen.dart';
import 'package:metrocoffee/modules/payment/order_succesful_page.dart';
import 'package:metrocoffee/modules/payment/payment_page.dart';
import 'package:metrocoffee/modules/product/product_detail_page.dart';
import 'package:metrocoffee/modules/product_search/searchpage.dart';
import 'package:metrocoffee/modules/profile/contents/favorite_products.dart';
import 'package:metrocoffee/modules/profile/contents/my_order.dart';
import 'package:metrocoffee/modules/profile/contents/order_details.dart';
import 'package:metrocoffee/modules/profile/personal_data_page.dart';
import 'package:metrocoffee/modules/shareables/change_password.dart';
import 'package:metrocoffee/ui/widgets/no_internet.dart';

class RouteHandler {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: PageName.splashscreenpage,
        page: () => SplashScreen(),
      ),
      GetPage(
        name: PageName.onboardingpage,
        page: () => OnBoardingScreen(),
      ),
      GetPage(
        name: PageName.loginpage,
        page: () => LoginPage(),
      ),
      GetPage(
        name: PageName.homepage,
        page: () => Base(),
      ),
      GetPage(
        name: PageName.membershiploginpage,
        page: () => MembershipLoginPage(),
      ),
      GetPage(
        name: PageName.personaldatapage,
        page: () => PersonalDataPage(),
      ),
      GetPage(
        name: PageName.changepasswordpage,
        page: () => ChangePasswordPage(),
      ),
      GetPage(
        name: PageName.myorderspage,
        page: () => MyOrderPage(),
      ),
      GetPage(
        name: PageName.favouritesproductpage,
        page: () => FavoriteProductsPage(),
      ),
      GetPage(
        name: PageName.orderdetailspage,
        page: () => OrderDetails(),
      ),
      GetPage(
        name: PageName.checkoutpage,
        page: () => CheckoutPage(),
      ),
      GetPage(
        name: PageName.paymentspage,
        page: () => PaymentPage(),
      ),
      GetPage(
        name: PageName.ordersucessfullpage,
        page: () => OrderSuccesfulPage(),
      ),
      GetPage(
        name: PageName.googlemappage,
        page: () => GoogleMapScreen(),
      ),
      GetPage(
        name: PageName.productdetailpage + '/:id',
        page: () => ProductDetailPage(),
      ),
      GetPage(
        name: PageName.productCartPage,
        page: () => MyProductCart(),
      ),
      GetPage(
        name: PageName.searchPage,
        page: () => SearchPage(),
      ),
      GetPage(
        name: PageName.nointernetpage,
        page: () => NoInternet(),
      ),
      GetPage(
        name: PageName.signupPage,
        page: () => EmailSignUpPage(),
      ),
      GetPage(
        name: PageName.emailloginpage,
        page: () => EmailLoginPage(),
      ),
    ];
  }
}
