import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/logout_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LogoutUseCase logoutUseCase;

  AuthCubit({
    required this.logoutUseCase,
  }) : super(AuthInitial());

  Future<void> logout() async {
    emit(AuthLoading());

    await logoutUseCase();

    emit(Unauthenticated());
  }
}