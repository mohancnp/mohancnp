import 'package:json_annotation/json_annotation.dart';
part 'order_history.g.dart';

@JsonSerializable()
class OrderInstance {
  int id;
  @JsonKey(name: 'txn_id')
  String txnId;
  @JsonKey(name: 'customer_id')
  int customerId;
  @JsonKey(name: 'orders_no')
  int ordersNo;
  @JsonKey(name: 'items_count')
  int itemsCount;
  @JsonKey(name: 'total_amount')
  double totalAmount;
  @JsonKey(name: 'request_at')
  String requestAt;
  int status;
  @JsonKey(name: 'product_id')
  int productId;
  @JsonKey(name: 'product_name')
  String productName;
  @JsonKey(name: 'product_image')
  String productImage;
  @JsonKey(includeIfNull: true)
  String? title;
  @JsonKey(includeIfNull: true)
  String? subtitle;
  OrderInstance({
    required this.id,
    required this.customerId,
    required this.ordersNo,
    required this.itemsCount,
    required this.txnId,
    required this.totalAmount,
    required this.requestAt,
    required this.status,
    required this.productId,
    required this.productName,
    required this.productImage,
    this.title,
    this.subtitle,
  });
  factory OrderInstance.fromJson(Map<String, dynamic> json) =>
      _$OrderInstanceFromJson(json);

  Map<String, dynamic> toJson() => _$OrderInstanceToJson(this);
}
