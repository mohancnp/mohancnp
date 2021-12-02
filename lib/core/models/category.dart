import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  int id;
  @JsonKey(name: "title")
  String name;
  @JsonKey(name: "image")
  String imageUri;
  @JsonKey(ignore: true)
  bool? selected;
  Category(this.id, this.name, this.imageUri, [this.selected]);
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
