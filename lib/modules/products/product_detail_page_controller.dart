import 'package:expandable/expandable.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/models/cart_model.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/core/constants/icons/product_option_name.dart';
import 'package:metrocoffee/core/constants/variants_type.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/product_detail_model.dart';
import 'package:metrocoffee/core/services/product_service/product_service.dart';
import 'package:metrocoffee/core/models/order_model.dart';

class ProductDetailPageController extends GetxController {
  var cartController = Get.find<CartController>();

  DataState _dataState = DataState.NA;
  ExpandableController toppingsexpandableController = ExpandableController();
  ExpandableController milksexpandableController = ExpandableController();
  ProductDetail _productDetail = ProductDetail.empty();
  Rx<UserOrder> userOrder = UserOrder.local(
      productVariantId: 0,
      qty: 1,
      amount: 0.0,
      orderProductAddons: [],
      orderProductOptions: []).obs;
  ProductOption? tempOptions;
  int _selectedTemprature = 0;
  int _selectedVariant = 0;
  String currenttopping = 'Caramel Syrup';
  List<Variant> _variants = [
    Variant.dummy(-1, -1, "name", "sku", "imageUri", "productName"),
    Variant.dummy(-1, -1, "name", "sku", "imageUri", "productName"),
    Variant.dummy(-1, -1, "name", "sku", "imageUri", "productName")
  ];

  List<String> toppings = [
    "Caramel Syrup",
    "Honey",
    "Cinamon",
    "Butter",
    "Cardamom"
  ];
  String currentmilk = 'Soy Milk';
  List<String> milks = [
    "Soy Milk",
    "Almond Milk",
    "Rice Milk",
    "Coconut Milk",
    "Skim Milk"
  ];

  void increaseCount() {
    ++this.userOrder.value.qty;
    updatePrice();
    // this.userOrder.refresh();
  }

  void decreaseCount() {
    if (this.userOrder.value.qty > 1) {
      --this.userOrder.value.qty;
    }
    updatePrice();

    // this.userOrder.refresh();
  }

  set variants(List<Variant> vl) {
    _variants = vl;
    update();
  }

  List<Variant> get variants {
    return this._variants;
  }

  set selectedVariant(int i) {
    _selectedVariant = i;
    update();
    updatePrice();
  }

  int get selectedVariant {
    return _selectedVariant;
  }

  set selectedTemprature(int t) {
    _selectedTemprature = t;
    update();
  }

  int get selectedTemprature {
    return _selectedTemprature;
  }

  setcuttentmilk(String milk) {
    currentmilk = milk;
    update();
  }

  setcurrenttopping(String topping) {
    currenttopping = topping;
    // print('set toppings:$topping');
    update();
  }

  set productDetail(ProductDetail pd) {
    _productDetail = pd;
    update();
  }

  ProductDetail get productDetail {
    return this._productDetail;
  }

  set dataState(DataState ds) {
    dataState = ds;
    update();
  }

  DataState get dataState {
    return this._dataState;
  }

  Future addProductToCart() async {
    var vId = productDetail.allVariants?.elementAt(selectedVariant).id;
    //implement add product to cart
    var cartData = CartModel(
        productId: productDetail.id ?? -1,
        variantId: vId ?? -1,
        qty: userOrder.value.qty,
        price: userOrder.value.amount ?? 0.0,
        addons: userOrder.value.orderProductAddons ?? [],
        imageUri: productDetail.imageUri ?? "",
        options: userOrder.value.orderProductOptions ?? [],
        name: productDetail.name ?? "");

    var message = await cartController.addProductToCart(cartData.toJson());
    print(cartData.toJson());
    return message;
  }

  Future retrieveProductDetails({required int id}) async {
    // print("received id: $id");
    _dataState = DataState.loading;
    var prodObj = await locator<ProductService>().handleProductDetail(id: id);
    if (prodObj != null) {
      this._productDetail = prodObj;
      await getProductTempOption();
      await getSizeOptions();
      await getToppingsOption();
      await getMilkOptions();
      await setPrice();
      _dataState = DataState.loaded;
    } else {
      _dataState = DataState.error;
    }
  }

/*updates the final price of the product*/
  Future updatePrice() async {
    var selectedVariantPrice = variants[selectedVariant].price;
    var selectedAddonsPrice = 0.0;

    productDetail.addons?.forEach((element) {
      if (userOrder.value.orderProductAddons!.contains(element.id)) {
        selectedAddonsPrice += element.cost;
      }
    });
    var totalPrice = selectedVariantPrice + selectedAddonsPrice;
    userOrder.value.amount = totalPrice * userOrder.value.qty;
    userOrder.refresh();
  }

  Future setPrice() async {
    userOrder.value.amount = variants[selectedVariant].price;
    userOrder.refresh();
  }

  Future getProductTempOption() async {
    List<ProductOption>? poList = productDetail.options;
    if (poList != null) {
      for (var i = 0; i < poList.length; i++) {
        if (poList[i].name == ProductOptionName.temp) {
          tempOptions = poList[i];
        }
      }
    }
  }

  Future getToppingsOption() async {
    List<ProductOption>? poList = productDetail.options;
    if (poList != null) {
      for (var i = 0; i < poList.length; i++) {
        if (poList[i].name == ProductOptionName.toppings) {
          toppings = poList[i].options;
        }
      }
    }
  }

  Future getMilkOptions() async {
    List<ProductOption>? poList = productDetail.options;
    if (poList != null) {
      for (var i = 0; i < poList.length; i++) {
        if (poList[i].name == ProductOptionName.milk) {
          milks = poList[i].options;
        }
      }
    }
  }

  Future getSizeOptions() async {
    // variants = productDetail.allVariants!;
    var variants = this._variants;
    if (productDetail.allVariants != null) {
      for (int i = 0; i < productDetail.allVariants!.length; i++) {
        if (productDetail.allVariants![i].name == VariantType.small) {
          variants.insert(0, productDetail.allVariants![i]);
        } else if (productDetail.allVariants![i].name == VariantType.medium) {
          variants.insert(1, productDetail.allVariants![i]);
        } else {
          variants.insert(2, productDetail.allVariants![i]);
        }
        // selectedVariant = i;
      }
      this.variants = variants;
    }
  }

  Future toogleAddonSelection(int index) async {
    var element = productDetail.addons!.elementAt(index);
    element.selected = !element.selected;
    if (element.selected) {
      print("selected: ${element.id}");
      userOrder.value.orderProductAddons!.add(element.id ?? -1);
      print(" addons: ${userOrder.value.orderProductAddons}");
    } else {
      print("un selected:c${element.id}");
      userOrder.value.orderProductAddons!.remove(element.id ?? -1);
    }
    update();
    await updatePrice();
    // updatePriceWithAddons(element.cost, element.selected);
  }
}
