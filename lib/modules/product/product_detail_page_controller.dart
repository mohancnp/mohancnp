// import 'package:expandable/expandable.dart';
import 'package:expandable/expandable.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/product_detail_model.dart';
import 'package:metrocoffee/core/services/product_service/product_service.dart';

// import 'package:metrocoffee/core/constants/icons/product_option_name.dart';
// import 'package:metrocoffee/core/constants/variants_type.dart';
// import 'package:metrocoffee/core/enums/data_state.dart';
// import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
// import 'package:metrocoffee/core/locator.dart';
// import 'package:metrocoffee/core/models/cart_model.dart';
// import 'package:metrocoffee/core/models/order_model.dart';
// import 'package:metrocoffee/core/models/product_detail_model.dart';
// import 'package:metrocoffee/core/services/product_service/product_service.dart';
// import 'package:metrocoffee/modules/cart/cart_controller.dart';
// import 'package:metrocoffee/modules/product/product_view_model.dart';
// import 'package:metrocoffee/modules/public/redirection_controller.dart';
// import 'package:metrocoffee/ui/widgets/custom_snackbar_widget.dart';
// import 'package:metrocoffee/ui/widgets/progress_dialog.dart';
class ProductDetailPageController extends GetxController
    with StateMixin<ProductDetail> {
  ExpandableController toppingsexpandableController = ExpandableController();
  var _productService = locator.get<ProductService>();
  late Rx<ProductDetail> _productDetail = ProductDetail(
    id: 0,
    name: "",
    description: "",
    image: "",
    variants: [],
    toppings: [],
    addons: [],
  ).obs;
  ProductDetail get productDetail {
    return _productDetail.value;
  }

  set productDetail(ProductDetail p) {
    _productDetail.value = p;
  }

  Future getProductDetail() async {
    int? id = Get.arguments["productId"];
    if (id != null) {
      var response = await _productService.getProductDetailWithId(id);
      response.fold((l) => handleResponse(l), (r) => handleFailure(r));
    }
  }

  handleResponse(ProductDetail p) {
    change(p, status: RxStatus.success());
    productDetail = p;
    // productDetail.refresh();
  }

  handleFailure(Failure f) {
    change(null, status: RxStatus.error(f.message));
  }

  @override
  void onInit() {
    getProductDetail();
    super.onInit();
  }
}
