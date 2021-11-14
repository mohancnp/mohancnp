abstract class ProfileService {
  Future getUserDetail();
  Future updateProfile({required Map<String, dynamic> profileData});
  Future changeUserPassword({
    required String currentPassword,
    required String newPassword,
    required String passwordConfirmation,
  });
  Future updateDbUser(Map<String, dynamic> user);
}
