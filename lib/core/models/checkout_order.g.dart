// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeInterval _$TimeIntervalFromJson(Map<String, dynamic> json) {
  return TimeInterval(
    id: json['id'] as int,
    minDeliveryTime: json['min_delivery_time'] as int,
    minTakeawayTime: json['min_takeaway_time'] as int,
  );
}

Map<String, dynamic> _$TimeIntervalToJson(TimeInterval instance) =>
    <String, dynamic>{
      'id': instance.id,
      'min_delivery_time': instance.minDeliveryTime,
      'min_takeaway_time': instance.minTakeawayTime,
    };

OrderData _$OrderDataFromJson(Map<String, dynamic> json) {
  return OrderData(
    orderItems: (json['order_items'] as List<dynamic>)
        .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    txnId: json['txn_id'] as String,
    itemsCount: json['items_count'] as int,
    shippingAddress: ShippingAddress.fromJson(
        json['shipping_address'] as Map<String, dynamic>),
    totalAmount: (json['total_amount'] as num).toDouble(),
    shipppingTime: json['shipping_time'] as String,
  );
}

Map<String, dynamic> _$OrderDataToJson(OrderData instance) => <String, dynamic>{
      'order_items': instance.orderItems,
      'txn_id': instance.txnId,
      'items_count': instance.itemsCount,
      'shipping_address': instance.shippingAddress,
      'total_amount': instance.totalAmount,
      'shipping_time': instance.shipppingTime,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return OrderItem(
    subTotalPrice: (json['sub_total_price'] as num).toDouble(),
    productId: json['product_id'] as int,
    name: json['name'] as String,
    qty: json['qty'] as int,
    imageUri: json['image_uri'] as String,
    productVariants:
        Variant.fromJson(json['product_variants'] as Map<String, dynamic>),
    productType: json['product_type'] == null
        ? null
        : ProductType.fromJson(json['product_type'] as Map<String, dynamic>),
    toppingList: (json['topping_list'] as List<dynamic>)
        .map((e) => Topping.fromJson(e as Map<String, dynamic>))
        .toList(),
    addons: (json['addons'] as List<dynamic>)
        .map((e) => Addon.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'sub_total_price': instance.subTotalPrice,
      'product_id': instance.productId,
      'name': instance.name,
      'qty': instance.qty,
      'image_uri': instance.imageUri,
      'product_variants': instance.productVariants,
      'product_type': instance.productType,
      'topping_list': instance.toppingList,
      'addons': instance.addons,
    };
