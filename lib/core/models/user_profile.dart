import 'package:json_annotation/json_annotation.dart';
part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  int id;
  @JsonKey(name: 'security_key')
  String securityKey;
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'mobile')
  String mobile;
  @JsonKey(name: 'image')
  String image;
  UserProfile({
    required this.id,
    required this.securityKey,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.image,
  });
  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
