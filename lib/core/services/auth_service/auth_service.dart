import 'package:dartz/dartz.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/models/new_user.dart';

abstract class AuthService {
  Future<Either<SignupResponse, Failure>> createUser(Map<String, dynamic> data);
  Future<Either<SignupResponse, Failure>> loginUserWithEmail(
      Map<String, dynamic> data);
  Future<void> refreshToken();
  Future<void> logout();
  Future<Either<String, Failure>> sendEmailForPasswordReset(
      Map<String, dynamic> data);
  Future<Either<String, Failure>> verifyOtp(Map<String, dynamic> data);
  Future<Either<String, Failure>> resetPassword(Map<String, dynamic> data);
}
