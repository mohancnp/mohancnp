import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  int id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "image")
  String imageUri;
  @JsonKey(ignore: true)
  bool? selected;
  Category({
    required this.id,
    required this.title,
    required this.imageUri,
    this.selected,
  });
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
