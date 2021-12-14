import 'package:json_annotation/json_annotation.dart';
import 'package:metrocoffee/core/models/product_detail.dart';
import 'package:metrocoffee/core/services/storage/db/dbconst.dart';
part 'cart_instance.g.dart';

@JsonSerializable()
class CartInstance {
  @JsonKey(name: ProductCartFeild.totalPrice)
  double totalPrice;
  @JsonKey(name: ProductCartFeild.productId)
  int productId;
  String name;
  int qty;
  @JsonKey(name: ProductCartFeild.selectedVariants)
  Variant selectedVariants;
  @JsonKey(name: ProductCartFeild.selectedProductType)
  ProductType selectedProductType;
  @JsonKey(name: ProductCartFeild.toppingsList)
  List<Topping> toppingsList;
  List<Addon> addons;
  @JsonKey(name: ProductCartFeild.imageUri)
  String imageUri;
  CartInstance({
    required this.productId,
    required this.totalPrice,
    required this.qty,
    required this.name,
    required this.imageUri,
    required this.selectedVariants,
    required this.selectedProductType,
    required this.toppingsList,
    required this.addons,
  });
  factory CartInstance.fromJson(Map<String, dynamic> json) =>
      _$CartInstanceFromJson(json);

  Map<String, dynamic> toJson() => _$CartInstanceToJson(this);
}
