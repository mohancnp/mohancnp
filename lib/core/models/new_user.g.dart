// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewUser _$NewUserFromJson(Map<String, dynamic> json) {
  return NewUser(
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    passwordConfirmation: json['password_confirmation'] as String,
  );
}

Map<String, dynamic> _$NewUserToJson(NewUser instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) {
  return SignupResponse(
    accessToken: json['access_token'] as String,
    tokenType: json['token_type'] as String,
    expiresIn: json['expires_in'] as int,
    customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'customer': instance.customer,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    id: json['id'] as int,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    email: json['email'] as String,
    mobile: json['mobile'] as String,
    image: json['image'] as String,
    passwordResetCount: json['password_reset_count'] as int,
    lastLoginDatetime: json['last_login_datetime'] as String,
    lastUpdatedDate: json['last_updated_date'] as String,
    createdAt: json['created_at'] as String,
    createdBy: json['created_by'] as int,
    updatedAt: json['updated_at'] as String,
    updatedBy: json['updated_by'] as int,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'mobile': instance.mobile,
      'image': instance.image,
      'password_reset_count': instance.passwordResetCount,
      'last_login_datetime': instance.lastLoginDatetime,
      'last_updated_date': instance.lastUpdatedDate,
      'created_at': instance.createdAt,
      'created_by': instance.createdBy,
      'updated_at': instance.updatedAt,
      'updated_by': instance.updatedBy,
      'status': instance.status,
    };

SignupError _$SignupErrorFromJson(Map<String, dynamic> json) {
  return SignupError(
    email: (json['email'] as List<dynamic>).map((e) => e as String).toList(),
    password:
        (json['password'] as List<dynamic>).map((e) => e as String).toList(),
    passwordConfirmation: (json['password_confirmation'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    firstName:
        (json['first_name'] as List<dynamic>).map((e) => e as String).toList(),
    lastName:
        (json['last_name'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$SignupErrorToJson(SignupError instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };
