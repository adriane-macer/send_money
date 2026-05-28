import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/login_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase)
      : super(LoginInitial());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(LoginLoading());

    final result = await loginUseCase(
      username: username,
      password: password,
    );

    if (result) {
      emit(LoginSuccess());
    } else {
      emit(const LoginFailure('Invalid credentials'));
    }
  }
}