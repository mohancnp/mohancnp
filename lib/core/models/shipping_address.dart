import 'package:json_annotation/json_annotation.dart';
part 'shipping_address.g.dart';

@JsonSerializable()
class ShippingAddress {
  @JsonKey(includeIfNull: false)
  int? id;
  double lattitude;
  double longitude;
  String title;
  String subtitle;
  ShippingAddress({
    this.id,
    required this.lattitude,
    required this.longitude,
    required this.title,
    required this.subtitle,
  });
  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
        _$ShippingAddressFromJson(json);
  
    Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}
