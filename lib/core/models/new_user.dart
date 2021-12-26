import 'package:json_annotation/json_annotation.dart';

part 'new_user.g.dart';

@JsonSerializable()
class NewUser {
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;
  String email;
  String password;
  @JsonKey(name: 'password_confirmation')
  String passwordConfirmation;
  NewUser({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });
  Map<String, dynamic> toJson() => _$NewUserToJson(this);
}

@JsonSerializable()
class SignupResponse {
  @JsonKey(name: "access_token")
  String accessToken;
  @JsonKey(name: "token_type")
  String tokenType;
  @JsonKey(name: "expires_in")
  int expiresIn;
  Customer customer;
  SignupResponse({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.customer,
  });
  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}

@JsonSerializable()
class Customer {
  int id;
  @JsonKey(name: "first_name")
  String firstName;
  @JsonKey(name: "last_name")
  String lastName;
  String email;
  String mobile;
  String image;
  @JsonKey(name: "password_reset_count")
  int passwordResetCount;
  @JsonKey(name: "last_login_datetime")
  String lastLoginDatetime;
  @JsonKey(name: "last_updated_date")
  String lastUpdatedDate;
  @JsonKey(name: "created_at")
  String createdAt;
  @JsonKey(name: "created_by")
  int createdBy;
  @JsonKey(name: "updated_at")
  String updatedAt;
  @JsonKey(name: "updated_by")
  int updatedBy;
  Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.image,
    required this.passwordResetCount,
    required this.lastLoginDatetime,
    required this.lastUpdatedDate,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
  });
  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}

@JsonSerializable()
class SignupError {
  @JsonKey(includeIfNull: true)
  List<String> email;
  @JsonKey(includeIfNull: true)
  List<String> password;
  @JsonKey(name: "password_confirmation", includeIfNull: true)
  List<String> passwordConfirmation;
  @JsonKey(name: "first_name", includeIfNull: true)
  List<String> firstName;
  @JsonKey(name: "last_name", includeIfNull: true)
  List<String> lastName;
  SignupError({
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.firstName,
    required this.lastName,
  });
  factory SignupError.fromJson(Map<String, dynamic> json) =>
      _$SignupErrorFromJson(json);

  Map<String, dynamic> toJson() => _$SignupErrorToJson(this);

  @override
  String toString() {
    return 'SignupError(email: $email, password: $password, passwordConfirmation: $passwordConfirmation, firstName: $firstName, lastName: $lastName)';
  }
}
