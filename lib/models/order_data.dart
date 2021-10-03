import 'package:metrocoffee/models/order.dart';
import 'package:metrocoffee/models/profile.dart';
import 'package:metrocoffee/models/variants.dart';

class OrderData {
  int orderCount;
  String orderImage;
  String createdAt;
  int id;
  dynamic cost;
  int userId;

  OrderData.create(
      {required this.orderCount,
      required this.orderImage,
      required this.cost,
      required this.createdAt,
      required this.id,
      required this.userId});

  factory OrderData.fromJson(Map<dynamic, dynamic> data) {
    return OrderData.create(
        orderCount: data['order_products_count'],
        orderImage: data["order_image"],
        cost: data['cost'] as num,
        createdAt: data['created_at'],
        id: data['id'],
        userId: data['user_id']);
  }
}

class OrderDetail {
  int? id;
  int? addressId;
  String? deliveryTimeFrom;
  String? deliveryTimeEnd;
  dynamic cost;
  String? createdAt;
  String? status;
  Address? address;
  List<UserOrder>? orderProductList;
  OrderDetail(
      {this.id,
      this.addressId,
      this.deliveryTimeFrom,
      this.deliveryTimeEnd,
      this.cost,
      this.createdAt,
      this.status,
      this.orderProductList,
      this.address});

  factory OrderDetail.fromJson(Map<dynamic, dynamic> map) {
    Address newAddress = Address.fromJson(map['address']);
    List<UserOrder> userOrder = [];
    List<dynamic> opds = map['order_products'];
    List<UserOrder> usl = [];
    opds.forEach((element) {
      usl.add(UserOrder.fromJson(element));
    });

    return OrderDetail(
      id: map['id'],
      addressId: map['address_id'],
      deliveryTimeEnd: map['delivery_time_end'],
      deliveryTimeFrom: map['delivery_time_from'],
      cost: map['cost'],
      createdAt: map['created_at'],
      status: map['status'],
      address: newAddress,
      orderProductList: usl,
    );
  }
}

class UserOrder {
  int? id;
  int? variantId;
  int? orderId;
  dynamic cost;
  int? qty;
  Variant? variant;
  UserOrder(
      {this.id,
      this.variant,
      this.variantId,
      this.cost,
      this.qty,
      this.orderId});

  factory UserOrder.fromJson(Map<dynamic, dynamic> map) {
    return UserOrder(
      id: map['id'],
      orderId: map['order_id'],
      cost: map['cost'],
      qty: map['qty'],
      variantId: map['product_variant_id'],
      variant: Variant.fromJson(map['product_variant']),
    );
  }
}
