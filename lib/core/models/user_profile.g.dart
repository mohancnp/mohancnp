// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile(
    id: json['id'] as int,
    securityKey: json['security_key'] as String,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    email: json['email'] as String,
    mobile: json['mobile'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'security_key': instance.securityKey,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'mobile': instance.mobile,
      'image': instance.image,
    };
