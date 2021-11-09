import 'package:expandable/expandable.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/product_detail_model.dart';
import 'package:metrocoffee/core/services/product_service/product_service.dart';

class ProductDetailPageController extends GetxController {
  ExpandableController toppingsexpandableController = ExpandableController();
  ExpandableController milksexpandableController = ExpandableController();
  ProductDetail _productDetail = ProductDetail.empty();

  String currenttopping = 'Caramel Syrup';
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

  Future retrieveProductDetails({required int id}) async {
    // print("received id: $id");
    locator<ProductService>().handleProductDetail(id: id);
  }

  @override
  void onInit() {
    print("in oninit");
    // retrieveProductDetails();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    print("disposed");
    // TODO: implement dispose
    super.dispose();
  }
}
