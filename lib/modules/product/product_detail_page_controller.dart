// import 'package:expandable/expandable.dart';
import 'package:expandable/expandable.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/currency.dart';
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
  static ProductDetailPageController get to => Get.find();

  var _productService = locator.get<ProductService>();
  var params;
  RxList<String> selectedToppings = <String>[].obs;
  late Rx<ProductDetail> _productDetail = ProductDetail(
    product: Product(
      id: 0,
      name: "",
      description: "",
      image: "",
    ),
    variants: [],
    toppings: [],
    addons: [],
  ).obs;
  List<String>? tpl;
  Rx<double> totalPrice = 0.0.obs;
  ProductDetail get productDetail {
    return _productDetail.value;
  }

  set productDetail(ProductDetail p) {
    _productDetail.value = p;
  }

  Future getProductDetail() async {
    // print("not null");

    if (params != null) {
      int id = int.parse(params["id"]);
      var response = await _productService.getProductDetailWithId(id);
      response.fold((l) => handleResponse(l), (r) => handleFailure(r));
    }
    // print(args);
  }

  handleResponse(ProductDetail p) {
    // print("handling rsponse");
    change(p, status: RxStatus.success());
    totalPrice.value = p.variants[0].price;
    productDetail = p;
    // productDetail.refresh();
  }

  calculateTotal() {
    totalPrice.value = 0.0;
    double total = 0.0;
    total = getSizeAmount();
    if (tpl != null) {
      total += getToppingsAmount(tpl);
    }
    total += getAddonsAmount();
    totalPrice.value = total * productDetail.product.qty;
    print("calculated total");
  }

  double getToppingsAmount(tpl) {
    var total = 0.0;
    var toppings = productDetail.toppings;

    for (var i = 0; i < tpl.length; i++) {
      for (var j = 0; j < toppings.length; j++) {
        var topping = toppings[j];
        var newName = "${topping.name}   $dollar${topping.price}";
        if (newName == tpl[i]) {
          total += toppings[j].price;
          break;
        }
      }
    }
    return total;
  }

  double getAddonsAmount() {
    var addons = productDetail.addons;
    var total = 0.0;
    for (var i = 0; i < addons.length; i++) {
      if (addons[i].selected) {
        total += addons[i].price;
      }
    }
    return total;
  }

  double getSizeAmount() {
    var t = 0.0;
    for (var i = 0; i < productDetail.variants.length; i++) {
      if (productDetail.variants[i].selected) {
        t = productDetail.variants[i].price;
        break;
      }
    }
    return t;
  }

  handleFailure(Failure f) {
    print("handling failure");
    change(null, status: RxStatus.error(f.message));
  }

  handleSizeSelection(atIndex) {
    var variants = productDetail.variants;
    productDetail.variants[atIndex].selected = true;
    for (var i = 0; i < variants.length; i++) {
      if (variants[i].productId != variants[atIndex].productId) {
        productDetail.variants[i].selected = false;
      }
    }
    _productDetail.refresh();
  }

  handleAddonSelection(id) {
    var addons = productDetail.addons;
    for (var i = 0; i < addons.length; i++) {
      if (id == addons[i].id) {
        productDetail.addons[i].selected = !productDetail.addons[i].selected;
      }
    }
    _productDetail.refresh();
  }

  addCount() {
    productDetail.product.qty += 1;
    _productDetail.refresh();
  }

  removeCount() {
    if (productDetail.product.qty > 1) {
      productDetail.product.qty -= 1;
      _productDetail.refresh();
    }
  }

  @override
  void onInit() {
    params = Get.parameters;
    getProductDetail();
    super.onInit();
  }

  getToppingsList() {
    List<String> toppingsList = [];
    for (var i = 0; i < productDetail.toppings.length; i++) {
      var topping = productDetail.toppings[i];
      toppingsList.add("${topping.name}   $dollar${topping.price}");
    }
    return toppingsList;
  }

  refreshToppingList(List<String> x) {
    // print("refreshing toppings");
    selectedToppings.clear();
    selectedToppings.addAll(x);
    // selectedToppings.refresh();
  }
}
