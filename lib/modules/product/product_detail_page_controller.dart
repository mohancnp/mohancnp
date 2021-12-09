import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/currency.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/cart_instance_model.dart';
import 'package:metrocoffee/core/models/product_detail_model.dart';
import 'package:metrocoffee/core/services/cart_service/cart_service.dart';
import 'package:metrocoffee/core/services/product_service/product_service.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/ui/widgets/custom_snackbar_widget.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';

class ProductDetailPageController extends GetxController
    with StateMixin<ProductDetail> {
  static ProductDetailPageController get to => Get.find();
  var _productService = locator.get<ProductService>();
  var cartService = locator.get<CartService>();
  late Variant selectedVariant;
  late ProductType selectedproductType =
      ProductType(id: -1, name: "None", price: 0.0);
  late List<Topping> selectedToppingsObject = <Topping>[];
  late List<Addon> selectedAddons = <Addon>[];

  var params;
  RxList<String> selectedToppings = <String>[].obs;
  Rx<ProductDetail> _productDetail = ProductDetail(
    product: Product(
      id: 0,
      name: "",
      description: "",
      image: "",
    ),
    productTypes: [],
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
    if (params != null) {
      int id = int.parse(params["id"]);
      var response = await _productService.getProductDetailWithId(id);
      response.fold((l) => handleResponse(l), (r) => handleFailure(r));
    }
  }

  handleResponse(ProductDetail p) {
    change(p, status: RxStatus.success());
    p.variants[0].selected = true;
    selectedVariant = p.variants[0];
    if (p.productTypes.isNotEmpty) {
      p.productTypes[0].selected = true;
      selectedproductType = p.productTypes[0];
    }
    productDetail = p;
    calculateTotal();
  }

  calculateTotal() {
    totalPrice.value = 0.0;
    double total = 0.0;
    total = getSizeAmount();
    total += getTempOptionTotal();

    if (tpl != null) {
      total += getToppingsAmount(tpl);
    }
    total += getAddonsAmount();
    totalPrice.value = total * productDetail.product.qty;
    // print("calculated total");
  }

  double getTempOptionTotal() {
    var price = 0.0;
    for (var i = 0; i < productDetail.productTypes.length; i++) {
      if (productDetail.productTypes[i].selected) {
        price += productDetail.productTypes[i].price;
        break;
      }
    }
    return price;
  }

  double getToppingsAmount(tpl) {
    var total = 0.0;
    var toppings = productDetail.toppings;
    selectedToppings.clear();
    for (var i = 0; i < tpl.length; i++) {
      for (var j = 0; j < toppings.length; j++) {
        var topping = toppings[j];
        var newName = "${topping.name}   $dollar${topping.price}";
        if (newName == tpl[i]) {
          selectedToppingsObject.add(toppings[j]);
          total += toppings[j].price;
          break;
        }
      }
    }
    return total;
  }

  double getAddonsAmount() {
    selectedAddons.clear();
    var addons = productDetail.addons;
    var total = 0.0;
    for (var i = 0; i < addons.length; i++) {
      if (addons[i].selected) {
        selectedAddons.add(addons[i]);
        total += addons[i].price;
      }
    }
    return total;
  }

  double getSizeAmount() {
    var t = 0.0;
    for (var i = 0; i < productDetail.variants.length; i++) {
      if (productDetail.variants[i].selected) {
        selectedVariant = productDetail.variants[i];
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
    selectedToppings.clear();
    selectedToppings.addAll(x);
  }

  handleProductTypeSelection(int atIndex) {
    var pt = productDetail.productTypes;
    var elementToCheck = pt[atIndex];
    for (var i = 0; i < pt.length; i++) {
      // var status = productDetail.productTypes[atIndex].selected;
      if (elementToCheck.id == pt[i].id) {
        productDetail.productTypes[atIndex].selected = true;
      } else {
        productDetail.productTypes[i].selected = false;
      }
    }
    calculateTotal();
    _productDetail.refresh();
  }

  Future addProductToCart() async {
    showCustomDialog();
    var newInstance = CartInstance(
      productId: productDetail.product.id,
      totalPrice: totalPrice.value,
      qty: productDetail.product.qty,
      name: productDetail.product.name,
      selectedVariants: selectedVariant,
      selectedProductType: selectedproductType,
      toppingsList: selectedToppingsObject,
      addons: selectedAddons,
      imageUri: productDetail.product.image,
    );
    // print(newInstance.toJson());
    var response = await cartService.addProductToCart(newInstance.toJson());

    response.fold(
        (l) => handleCartProductSucess(l), (r) => handleCartProductFailure(r));

    var countResponse = await cartService.getCount();
    var cartController = Get.find<CartController>();
    countResponse.fold((l) => cartController.cartCount.value = l,
        (r) => print("failure getting count"));
  }

  handleCartProductFailure(Failure r) {
    Get.back();
    showCustomSnackBarMessage(title: "Cart", message: "${r.message}");
  }

  handleCartProductSucess(int count) {
    Get.back();
    showCustomSnackBarMessage(title: "", message: "sucessfully added an item");
    update();
  }
}
