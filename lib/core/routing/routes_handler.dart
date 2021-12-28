import 'package:get/get.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/modules/auth/core_login.dart';
import 'package:metrocoffee/modules/auth/custom/email/login/email_login.dart';
import 'package:metrocoffee/modules/auth/custom/email/signup/signup.dart';
import 'package:metrocoffee/modules/auth/custom/password/forgot_password.dart';
import 'package:metrocoffee/modules/auth/custom/password/reset_password.dart';
import 'package:metrocoffee/modules/auth/custom/membership/membership_login.dart';
import 'package:metrocoffee/modules/auth/custom/otp_verification.dart';
import 'package:metrocoffee/modules/cart/my_product_cart.dart';
import 'package:metrocoffee/modules/checkout/checkout_page.dart';
import 'package:metrocoffee/modules/home/base.dart';
import 'package:metrocoffee/modules/initial/splashscreen.dart';
import 'package:metrocoffee/modules/maps/map.dart';
import 'package:metrocoffee/modules/onboarding/onboarding_screen.dart';
import 'package:metrocoffee/modules/payment/order_receipt.dart';
import 'package:metrocoffee/modules/payment/order_succesful_page.dart';
import 'package:metrocoffee/modules/payment/payment_page.dart';
import 'package:metrocoffee/modules/product/product_detail_page.dart';
import 'package:metrocoffee/modules/product_search/search_page.dart';
import 'package:metrocoffee/modules/profile/contents/favorite_products.dart';
import 'package:metrocoffee/modules/profile/contents/my_order.dart';
import 'package:metrocoffee/modules/profile/contents/order_details.dart';
import 'package:metrocoffee/modules/profile/personal_data_page.dart';
import 'package:metrocoffee/modules/shareables/change_password.dart';
import 'package:metrocoffee/ui/widgets/no_internet.dart';

class PageNameHandler {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: PageName.splashscreenpage,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: PageName.onboardingpage,
        page: () => const OnBoardingScreen(),
      ),
      GetPage(
        name: PageName.loginpage,
        page: () => const LoginPage(),
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
        page: () => const FavoriteProductsPage(),
      ),
      GetPage(
        name: PageName.orderdetailspage,
        page: () => const OrderDetails(),
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
        page: () => const OrderSuccesfulPage(),
      ),
      GetPage(
        name: PageName.googlemappage,
        page: () => const GoogleMapScreen(),
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
        page: () => const SearchPage(),
      ),
      GetPage(
        name: PageName.nointernetpage,
        page: () => const NoInternet(),
      ),
      GetPage(
        name: PageName.signupPage,
        page: () => EmailSignUpPage(),
      ),
      GetPage(
        name: PageName.emailloginpage,
        page: () => EmailLoginPage(),
      ),
      GetPage(
        name: PageName.forgotPasswordPage,
        page: () => ForgotPasswordPage(),
      ),
      GetPage(
        name: PageName.otpVerificationPage,
        page: () => OtpVerificationPage(),
      ),
      GetPage(
        name: PageName.resetPasswordPage,
        page: () => ResetPasswordPage(),
      ),
      GetPage(
        name: PageName.orderReceiptPage,
        page: () => OrderReceiptPage(),
      ),
    ];
  }
}
