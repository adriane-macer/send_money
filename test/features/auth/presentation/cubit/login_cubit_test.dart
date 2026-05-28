import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:send_money/features/auth/domain/usecases/login_usecase.dart';
import 'package:send_money/features/auth/presentation/cubit/login_cubit.dart';
import 'package:send_money/features/auth/presentation/cubit/login_state.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

void main() {
  late LoginCubit cubit;
  late MockLoginUseCase mockLoginUseCase;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    cubit = LoginCubit(mockLoginUseCase);
  });

  tearDown(() {
    cubit.close();
  });

  blocTest<LoginCubit, LoginState>(
    'emits loading then success when login succeeds',
    build: () {
      when(
            () => mockLoginUseCase(
          username: 'admin',
          password: '1234',
        ),
      ).thenAnswer((_) async => true);

      return cubit;
    },
    act: (cubit) {
      cubit.login(
        username: 'admin',
        password: '1234',
      );
    },
    expect: () => [
      LoginLoading(),
      LoginSuccess(),
    ],
  );

  blocTest<LoginCubit, LoginState>(
    'emits loading then failure when login fails',
    build: () {
      when(
            () => mockLoginUseCase(
          username: 'wrong',
          password: 'wrong',
        ),
      ).thenAnswer((_) async => false);

      return cubit;
    },
    act: (cubit) {
      cubit.login(
        username: 'wrong',
        password: 'wrong',
      );
    },
    expect: () => [
      LoginLoading(),
      const LoginFailure('Invalid credentials'),
    ],
  );
}