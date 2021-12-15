// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_instance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartInstance _$CartInstanceFromJson(Map<String, dynamic> json) {
  return CartInstance(
    productId: json['product_id'] as int,
    totalPrice: (json['total_price'] as num).toDouble(),
    qty: json['qty'] as int,
    name: json['name'] as String,
    imageUri: json['image_uri'] as String,
    selectedVariants:
        Variant.fromJson(json['selected_variants'] as Map<String, dynamic>),
    selectedProductType: ProductType.fromJson(
        json['selected_product_type'] as Map<String, dynamic>),
    toppingsList: (json['toppings_list'] as List<dynamic>)
        .map((e) => Topping.fromJson(e as Map<String, dynamic>))
        .toList(),
    addons: (json['addons'] as List<dynamic>)
        .map((e) => Addon.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CartInstanceToJson(CartInstance instance) =>
    <String, dynamic>{
      'total_price': instance.totalPrice,
      'product_id': instance.productId,
      'name': instance.name,
      'qty': instance.qty,
      'selected_variants': instance.selectedVariants,
      'selected_product_type': instance.selectedProductType,
      'toppings_list': instance.toppingsList,
      'addons': instance.addons,
      'image_uri': instance.imageUri,
    };
