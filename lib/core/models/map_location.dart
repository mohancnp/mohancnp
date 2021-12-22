import 'package:json_annotation/json_annotation.dart';
part 'map_location.g.dart';

@JsonSerializable()
class MapLocation {
  double lat;
  double long;
  MapLocation({required this.lat, required this.long});
  factory MapLocation.fromJson(Map<String, dynamic> json) =>
      _$MapLocationFromJson(json);

  Map<String, dynamic> toJson() => _$MapLocationToJson(this);
}
