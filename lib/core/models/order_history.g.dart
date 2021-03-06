// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderInstance _$OrderInstanceFromJson(Map<String, dynamic> json) {
  return OrderInstance(
    id: json['id'] as int,
    customerId: json['customer_id'] as int,
    ordersNo: json['orders_no'] as int,
    itemsCount: json['items_count'] as int,
    txnId: json['txn_id'] as String,
    totalAmount: (json['total_amount'] as num).toDouble(),
    requestAt: json['request_at'] as String,
    status: json['status'] as int,
    productId: json['product_id'] as int,
    productName: json['product_name'] as String,
    productImage: json['product_image'] as String,
    title: json['title'] as String?,
    subtitle: json['subtitle'] as String?,
  );
}

Map<String, dynamic> _$OrderInstanceToJson(OrderInstance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'txn_id': instance.txnId,
      'customer_id': instance.customerId,
      'orders_no': instance.ordersNo,
      'items_count': instance.itemsCount,
      'total_amount': instance.totalAmount,
      'request_at': instance.requestAt,
      'status': instance.status,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_image': instance.productImage,
      'title': instance.title,
      'subtitle': instance.subtitle,
    };
