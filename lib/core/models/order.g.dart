// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    orderItems: (json['order_items'] as List<dynamic>)
        .map((e) => CartInstance.fromJson(e as Map<String, dynamic>))
        .toList(),
    selectedAddress:
        Address.fromJson(json['selected_address'] as Map<String, dynamic>),
    totalAmount: (json['total_amount'] as num).toDouble(),
    selectedTime: json['selected_time'] as String,
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'order_items': instance.orderItems,
      'selected_address': instance.selectedAddress,
      'total_amount': instance.totalAmount,
      'selected_time': instance.selectedTime,
    };

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
    mapLocation:
        MapLocation.fromJson(json['map_location'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'map_location': instance.mapLocation,
    };
