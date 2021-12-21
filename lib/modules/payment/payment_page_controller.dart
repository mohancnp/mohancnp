import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/order_state.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/older/order_model.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/services/older/order_service/order_service.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/checkout/checkout_page_controller.dart';
import 'package:metrocoffee/modules/home/base_controller.dart';
import 'package:metrocoffee/ui/widgets/custom_snackbar_widget.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';

class PaymentPageController extends GetxController {
  RemoteOrder remoteOrder = RemoteOrder.empty();
  OrderState _orderState = OrderState.initial;
  final cartController = Get.find<CartController>();
  final checkoutConroller = Get.find<CheckoutPageController>();
  final _orderService = locator.get<OrderService>();
  bool reordering = false;

  Future confirmPaymentAndPlaceOrder() async {}

  Future placeOrder() async {}

  set orderState(OrderState os) {
    _orderState = os;
    update();
  }

  reorderWithId({required int orderId, int? addressId}) async {
    showCustomDialog(message: "Processing");
    try {
      var reorderStatus = await _orderService.reorderWithOrderId(id: orderId);
      if (reorderStatus == null) {
        Get.back();
        showCustomSnackBarMessage(
            title: "Re Ordering", message: "failed try again!!");
      } else {
        showCustomSnackBarMessage(
            title: "Re Ordering", message: "sucessfully done!!");
        reordering = false;
        Future.delayed(const Duration(seconds: 1)).then((value) {
          Get.find<BaseController>().setindex(0);
          Get.offAllNamed(PageName.homepage);
        });
      }
    } on AppException {
      reordering = false;
      Get.back();
      showCustomSnackBarMessage(
          title: "Re Ordering", message: "failed try again!!");
    }
  }
}
