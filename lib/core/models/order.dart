import 'package:json_annotation/json_annotation.dart';

import 'package:metrocoffee/core/models/cart_instance.dart';

import 'map_location.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  @JsonKey(name: "order_items")
  List<CartInstance> orderItems;
  @JsonKey(name: "selected_address")
  Address selectedAddress;
  @JsonKey(name: "total_amount")
  double totalAmount;
  @JsonKey(name: "selected_time")
  String selectedTime;
  Order({
    required this.orderItems,
    required this.selectedAddress,
    required this.totalAmount,
    required this.selectedTime,
  });
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class Address {
  String title;
  String subtitle;
  @JsonKey(name: "map_location")
  MapLocation mapLocation;
  Address({
    required this.title,
    required this.subtitle,
    required this.mapLocation,
  });
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
