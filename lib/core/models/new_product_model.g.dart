// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewProduct _$NewProductFromJson(Map<String, dynamic> json) {
  return NewProduct(
    products: (json['products'] as List<dynamic>)
        .map((e) => SingleProduct.fromJson(e as Map<String, dynamic>))
        .toList(),
    mostPopular: (json['most_popular'] as List<dynamic>?)
        ?.map((e) => SingleProduct.fromJson(e as Map<String, dynamic>))
        .toList(),
    recommendation: (json['recommendation'] as List<dynamic>?)
        ?.map((e) => SingleProduct.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NewProductToJson(NewProduct instance) {
  final val = <String, dynamic>{
    'products': instance.products,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('most_popular', instance.mostPopular);
  writeNotNull('recommendation', instance.recommendation);
  return val;
}

SingleProduct _$SingleProductFromJson(Map<String, dynamic> json) {
  return SingleProduct(
    id: json['id'] as int,
    name: json['name'] as String,
    price: (json['price'] as num).toDouble(),
    isFavorite: json['is_favourite'] as bool,
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$SingleProductToJson(SingleProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'is_favourite': instance.isFavorite,
    };
