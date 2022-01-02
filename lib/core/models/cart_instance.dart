import 'package:json_annotation/json_annotation.dart';

import 'package:metrocoffee/core/models/product_detail.dart';
import 'package:metrocoffee/core/services/storage/db/dbconst.dart';

part 'cart_instance.g.dart';

@JsonSerializable()
class CartInstance {
  @JsonKey(name: ProductCartField.totalPrice)
  double totalPrice;
  @JsonKey(name: ProductCartField.productId)
  int productId;
  String name;
  int qty;
  @JsonKey(name: ProductCartField.selectedVariants)
  Variant selectedVariants;
  @JsonKey(name: ProductCartField.selectedProductType)
  ProductType? selectedProductType;
  @JsonKey(name: ProductCartField.toppingsList)
  List<Topping> toppingsList;
  List<Addon> addons;
  @JsonKey(name: ProductCartField.imageUri)
  String imageUri;
  CartInstance({
    required this.productId,
    required this.totalPrice,
    required this.qty,
    required this.name,
    required this.imageUri,
    required this.selectedVariants,
    this.selectedProductType,
    required this.toppingsList,
    required this.addons,
  });
  factory CartInstance.fromJson(Map<String, dynamic> json) =>
      _$CartInstanceFromJson(json);

  Map<String, dynamic> toJson() => _$CartInstanceToJson(this);
}
