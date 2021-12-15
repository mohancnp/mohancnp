// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryProduct _$CategoryProductFromJson(Map<String, dynamic> json) {
  return CategoryProduct(
    products: (json['products'] as List<dynamic>)
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList(),
    mostPopularProducts: (json['most_popular_products'] as List<dynamic>)
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CategoryProductToJson(CategoryProduct instance) =>
    <String, dynamic>{
      'products': instance.products,
      'most_popular_products': instance.mostPopularProducts,
    };

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as int,
    productName: json['product_name'] as String,
    productPrice: (json['product_price'] as num).toDouble(),
    featuresImage: json['features_image'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'product_price': instance.productPrice,
      'features_image': instance.featuresImage,
    };
