import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    return username == 'admin' &&
        password == '1234';
  }
}