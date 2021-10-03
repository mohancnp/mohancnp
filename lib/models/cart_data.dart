import 'package:metrocoffee/models/order.dart';

class CartData {
  OrderProducts orderProducts;
  String? name;
  String? imageUri;
  double? price;

  CartData({required this.orderProducts, this.name, this.imageUri, this.price});
}
