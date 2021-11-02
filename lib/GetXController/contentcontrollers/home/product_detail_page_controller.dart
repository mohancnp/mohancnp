import 'package:expandable/expandable.dart';
import 'package:get/get.dart';

class ProductDetailPageController extends GetxController {
  ExpandableController toppingsexpandableController = ExpandableController();
  ExpandableController milksexpandableController = ExpandableController();

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
  List<Addon> addons = [];
  setcuttentmilk(String milk) {
    currentmilk = milk;
    update();
  }

  setcurrenttopping(String topping) {
    currenttopping = topping;
    // print('set toppings:$topping');
    update();
  }
}

class Addon {}
