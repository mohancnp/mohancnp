import 'package:json_annotation/json_annotation.dart';

part 'checkout_order.g.dart';

@JsonSerializable()
class TimeInterval {
  int id;
  @JsonKey(name: "min_delivery_time")
  int minDeliveryTime;

  @JsonKey(name: "min_takeaway_time")
  int minTakeawayTime;
  TimeInterval({
    required this.id,
    required this.minDeliveryTime,
    required this.minTakeawayTime,
  });
  factory TimeInterval.fromJson(Map<String, dynamic> json) =>
      _$TimeIntervalFromJson(json);

  Map<String, dynamic> toJson() => _$TimeIntervalToJson(this);
}
