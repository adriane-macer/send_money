abstract class AuthRepository {
  Future<bool> login({
    required String username,
    required String password,
  });
  Future<void> logout();
}