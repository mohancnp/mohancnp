// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) {
  return OrderDetail(
    order: Order.fromJson(json['order'] as Map<String, dynamic>),
    orderItems: (json['order_items'] as List<dynamic>)
        .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OrderDetailToJson(OrderDetail instance) =>
    <String, dynamic>{
      'order': instance.order,
      'order_items': instance.orderItems,
    };

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return OrderItem(
    id: json['id'] as int,
    orderId: json['order_id'] as int,
    productId: json['product_id'] as int,
    productName: json['product_name'] as String,
    productQty: json['product_qty'] as int,
    productPrice: (json['product_price'] as num).toDouble(),
    productAttributeId: json['product_attribute_id'] as int,
    productSize: json['product_size'] as String,
    productImage: json['product_image'] as String,
    productTypeId: json['product_type_id'] as int?,
    productTypeName: json['product_type_name'] as String?,
    productTypePrice: (json['product_type_price'] as num?)?.toDouble(),
    toppings: (json['toppings'] as List<dynamic>)
        .map((e) => Topping.fromJson(e as Map<String, dynamic>))
        .toList(),
    addons: (json['addons'] as List<dynamic>)
        .map((e) => Addon.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_qty': instance.productQty,
      'product_price': instance.productPrice,
      'product_attribute_id': instance.productAttributeId,
      'product_size': instance.productSize,
      'product_image': instance.productImage,
      'product_type_id': instance.productTypeId,
      'product_type_name': instance.productTypeName,
      'product_type_price': instance.productTypePrice,
      'toppings': instance.toppings,
      'addons': instance.addons,
    };

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    id: json['id'] as int,
    txnId: json['txn_id'] as String,
    customerId: json['customer_id'] as int,
    ordersNo: json['orders_no'] as int,
    shippingId: json['shipping_id'] as int?,
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    lattitude: (json['lattitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
    shippingTime: json['shipping_time'] as String,
    itemsCount: json['items_count'] as int,
    totalAmount: json['total_amount'] as int,
    status: json['status'] as int,
    requestAt: json['request_at'] as String,
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'txn_id': instance.txnId,
      'customer_id': instance.customerId,
      'orders_no': instance.ordersNo,
      'shipping_id': instance.shippingId,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'lattitude': instance.lattitude,
      'longitude': instance.longitude,
      'shipping_time': instance.shippingTime,
      'items_count': instance.itemsCount,
      'total_amount': instance.totalAmount,
      'status': instance.status,
      'request_at': instance.requestAt,
    };
