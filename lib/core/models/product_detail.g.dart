// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetail _$ProductDetailFromJson(Map<String, dynamic> json) {
  return ProductDetail(
    variants: (json['varients'] as List<dynamic>)
        .map((e) => Variant.fromJson(e as Map<String, dynamic>))
        .toList(),
    toppings: (json['toppings'] as List<dynamic>)
        .map((e) => Topping.fromJson(e as Map<String, dynamic>))
        .toList(),
    addons: (json['addons_extras'] as List<dynamic>)
        .map((e) => Addon.fromJson(e as Map<String, dynamic>))
        .toList(),
    product: Product.fromJson(json['product'] as Map<String, dynamic>),
    productTypes: (json['product_type'] as List<dynamic>)
        .map((e) => ProductType.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProductDetailToJson(ProductDetail instance) =>
    <String, dynamic>{
      'product': instance.product,
      'varients': instance.variants,
      'toppings': instance.toppings,
      'product_type': instance.productTypes,
      'addons_extras': instance.addons,
    };

ProductType _$ProductTypeFromJson(Map<String, dynamic> json) {
  return ProductType(
    id: json['product_type_id'] as int,
    name: json['name'] as String,
    price: (json['price'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ProductTypeToJson(ProductType instance) =>
    <String, dynamic>{
      'product_type_id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['product_id'] as int,
    name: json['product_name'] as String,
    description: json['short_description'] as String,
    image: json['features_image'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'product_id': instance.id,
      'product_name': instance.name,
      'short_description': instance.description,
      'features_image': instance.image,
    };

Variant _$VariantFromJson(Map<String, dynamic> json) {
  return Variant(
    productId: json['product_id'] as int,
    price: (json['price'] as num).toDouble(),
    productAttributeId: json['product_attribute_id'] as int,
    size: json['product_size'] as String,
  );
}

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
      'product_id': instance.productId,
      'price': instance.price,
      'product_attribute_id': instance.productAttributeId,
      'product_size': instance.size,
    };

Topping _$ToppingFromJson(Map<String, dynamic> json) {
  return Topping(
    id: json['topping_id'] as int,
    name: json['name'] as String,
    price: (json['price'] as num).toDouble(),
  );
}

Map<String, dynamic> _$ToppingToJson(Topping instance) => <String, dynamic>{
      'topping_id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };

Addon _$AddonFromJson(Map<String, dynamic> json) {
  return Addon(
    id: json['addons_extra_id'] as int,
    name: json['name'] as String,
    image: json['image'] as String,
    price: (json['price'] as num).toDouble(),
  );
}

Map<String, dynamic> _$AddonToJson(Addon instance) => <String, dynamic>{
      'addons_extra_id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
    };
