abstract class AuthService {
  Future<Map<String, dynamic>> performMemberShipLogin(
      String memberNo, String password);
}
