import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<bool> call({
    required String username,
    required String password,
  }) {
    return repository.login(
      username: username,
      password: password,
    );
  }
}