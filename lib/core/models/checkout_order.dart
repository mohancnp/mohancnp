import 'package:json_annotation/json_annotation.dart';

import 'package:metrocoffee/core/models/product_detail.dart';
import 'package:metrocoffee/core/models/shipping_address.dart';

part 'checkout_order.g.dart';

@JsonSerializable()
class TimeInterval {
  int id;
  @JsonKey(name: "min_delivery_time")
  int minDeliveryTime;

  @JsonKey(name: "min_takeaway_time")
  int minTakeawayTime;
  TimeInterval({
    required this.id,
    required this.minDeliveryTime,
    required this.minTakeawayTime,
  });
  factory TimeInterval.fromJson(Map<String, dynamic> json) =>
      _$TimeIntervalFromJson(json);

  Map<String, dynamic> toJson() => _$TimeIntervalToJson(this);
}

@JsonSerializable()
class OrderData {
  @JsonKey(name: "order_items")
  List<OrderItem> orderItems;
  @JsonKey(name: "txn_id")
  String txnId;
  @JsonKey(name: "items_count")
  int itemsCount;
  @JsonKey(name: "shipping_address")
  ShippingAddress shippingAddress;
  @JsonKey(name: "total_amount")
  double totalAmount;
  @JsonKey(name: "shipping_time")
  String shipppingTime;
  OrderData({
    required this.orderItems,
    required this.txnId,
    required this.itemsCount,
    required this.shippingAddress,
    required this.totalAmount,
    required this.shipppingTime,
  });
  factory OrderData.fromJson(Map<String, dynamic> json) =>
      _$OrderDataFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDataToJson(this);
}

@JsonSerializable()
class OrderItem {
  @JsonKey(name: "sub_total_price")
  double subTotalPrice;
  @JsonKey(name: "product_id")
  int productId;
  String name;
  int qty;
  @JsonKey(name: "image_uri")
  String imageUri;
  @JsonKey(name: "product_variants")
  Variant productVariants;
  @JsonKey(name: "product_type")
  ProductType? productType;
  @JsonKey(name: "topping_list")
  List<Topping> toppingList;
  List<Addon> addons;

  OrderItem({
    required this.subTotalPrice,
    required this.productId,
    required this.name,
    required this.qty,
    required this.imageUri,
    required this.productVariants,
    required this.productType,
    required this.toppingList,
    required this.addons,
  });
  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);

  @override
  String toString() {
    return 'OrderItem(subTotalPrice: $subTotalPrice, productId: $productId, name: $name, qty: $qty, imageUri: $imageUri, productVariants: $productVariants, productType: $productType, toppingList: $toppingList, addons: $addons)';
  }
}
