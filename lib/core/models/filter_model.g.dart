// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterProduct _$FilterProductFromJson(Map<String, dynamic> json) {
  return FilterProduct(
    products: (json['products'] as List<dynamic>)
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$FilterProductToJson(FilterProduct instance) =>
    <String, dynamic>{
      'products': instance.products,
    };
