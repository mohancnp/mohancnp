// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    json['id'] as int,
    json['product_name'] as String,
    (json['product_price'] as num).toDouble(),
    json['features_image'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'product_price': instance.productPrice,
      'features_image': instance.productImage,
    };
