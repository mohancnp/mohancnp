import 'package:json_annotation/json_annotation.dart';

import 'product_detail.dart';

part 'order_detail.g.dart';

@JsonSerializable()
class OrderDetail {
  Order order;
  @JsonKey(name: 'order_items')
  List<OrderItem> orderItems;
  OrderDetail({
    required this.order,
    required this.orderItems,
  });
  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailToJson(this);

  @override
  String toString() => 'OrderDetail(order: $order, orderItems: $orderItems)';
}

@JsonSerializable()
class OrderItem {
  int id;
  @JsonKey(name: "order_id")
  int orderId;
  @JsonKey(name: "product_id")
  int productId;
  @JsonKey(name: "product_name")
  String productName;
  @JsonKey(name: "product_qty")
  int productQty;
  @JsonKey(name: "product_price")
  double productPrice;
  @JsonKey(name: "product_attribute_id")
  int productAttributeId;
  @JsonKey(name: "product_size")
  String productSize;
  @JsonKey(name: "product_image")
  String productImage;
  @JsonKey(name: "product_type_id")
  int? productTypeId;
  @JsonKey(name: "product_type_name")
  String? productTypeName;
  @JsonKey(name: "product_type_price")
  double? productTypePrice;
  List<Topping> toppings;
  List<Addon> addons;

  OrderItem({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.productName,
    required this.productQty,
    required this.productPrice,
    required this.productAttributeId,
    required this.productSize,
    required this.productImage,
    required this.productTypeId,
    required this.productTypeName,
    required this.productTypePrice,
    required this.toppings,
    required this.addons,
  });
  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
}

@JsonSerializable()
class Order {
  int id;
  @JsonKey(name: "txn_id")
  String txnId;
  @JsonKey(name: "customer_id")
  int customerId;
  @JsonKey(name: "orders_no")
  int ordersNo;
  @JsonKey(name: "shipping_id")
  int? shippingId;
  String title;
  String subtitle;
  double lattitude;
  double longitude;
  @JsonKey(name: "shipping_time")
  String shippingTime;
  @JsonKey(name: "items_count")
  int itemsCount;
  @JsonKey(name: "total_amount")
  int totalAmount;
  int status;
  @JsonKey(name: "request_at")
  String requestAt;
  Order({
    required this.id,
    required this.txnId,
    required this.customerId,
    required this.ordersNo,
    required this.shippingId,
    required this.title,
    required this.subtitle,
    required this.lattitude,
    required this.longitude,
    required this.shippingTime,
    required this.itemsCount,
    required this.totalAmount,
    required this.status,
    required this.requestAt,
  });
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
