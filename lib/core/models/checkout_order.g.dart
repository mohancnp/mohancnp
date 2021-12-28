// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeInterval _$TimeIntervalFromJson(Map<String, dynamic> json) {
  return TimeInterval(
    id: json['id'] as int,
    minDeliveryTime: json['min_delivery_time'] as int,
    minTakeawayTime: json['min_takeaway_time'] as int,
  );
}

Map<String, dynamic> _$TimeIntervalToJson(TimeInterval instance) =>
    <String, dynamic>{
      'id': instance.id,
      'min_delivery_time': instance.minDeliveryTime,
      'min_takeaway_time': instance.minTakeawayTime,
    };
