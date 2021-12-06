import 'package:json_annotation/json_annotation.dart';
import 'package:metrocoffee/core/models/product_model.dart';
part 'filter_model.g.dart';

@JsonSerializable()
class FilterProduct {
  List<Product> products;
  FilterProduct(this.products);
  factory FilterProduct.fromJson(Map<String, dynamic> json) =>
      _$FilterProductFromJson(json);

  Map<String, dynamic> toJson() => _$FilterProductToJson(this);
}
