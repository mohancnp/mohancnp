// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingAddress _$ShippingAddressFromJson(Map<String, dynamic> json) {
  return ShippingAddress(
    id: json['id'] as int?,
    lattitude: (json['lattitude'] as num).toDouble(),
    longitude: (json['longitude'] as num).toDouble(),
    title: json['title'] as String,
    subtitle: json['subtitle'] as String,
  );
}

Map<String, dynamic> _$ShippingAddressToJson(ShippingAddress instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['lattitude'] = instance.lattitude;
  val['longitude'] = instance.longitude;
  val['title'] = instance.title;
  val['subtitle'] = instance.subtitle;
  return val;
}
