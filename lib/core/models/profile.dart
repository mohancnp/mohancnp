import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class ProfileUpdate {
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;
  String email;
  String mobile;
  ProfileUpdate({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
  });
  factory ProfileUpdate.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileUpdateToJson(this);
}
