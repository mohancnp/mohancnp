import 'package:metrocoffee/models/order.dart';

class CartData {
  OrderProducts orderProducts;
  String? name;
  String? imageUri;

  CartData({required this.orderProducts, this.name, this.imageUri});
}
