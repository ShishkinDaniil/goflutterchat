abstract class AuthRepository {
  Future<dynamic> signUp({
    required String password,
    required String email,
    required String name,
  });
  Future<dynamic> signIn({
    required String password,
    required String email,
  });
  Future<dynamic> getProfile();

  Future<dynamic> userUpdate({
    String name,
    String email,
  });

  Future<dynamic> passwordUpdate({
    required String oldPassword,
    required String newPassword,
  });

  Future<dynamic> refreshToken({
    required String? refreshToken,
  });
}
