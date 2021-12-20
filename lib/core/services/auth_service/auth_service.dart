abstract class AuthService {
  Future<void> createUser(Map<String, dynamic> data);
  Future<void> loginUserWithEmail(Map<String, dynamic> data);
  Future<void> refreshToken();
  Future<void> logout();
  Future<void> sendEmailForPasswordReset();
}
