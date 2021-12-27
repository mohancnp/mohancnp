// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MapLocation _$MapLocationFromJson(Map<String, dynamic> json) {
  return MapLocation(
    lat: (json['lat'] as num).toDouble(),
    long: (json['long'] as num).toDouble(),
  );
}

Map<String, dynamic> _$MapLocationToJson(MapLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'long': instance.long,
    };
