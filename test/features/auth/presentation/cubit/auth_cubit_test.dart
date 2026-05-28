import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:send_money/features/auth/domain/usecases/logout_usecase.dart';
import 'package:send_money/features/auth/presentation/cubit/auth_cubit.dart';

class MockLogoutUseCase extends Mock
    implements LogoutUseCase {}

void main() {
  late AuthCubit cubit;
  late MockLogoutUseCase mockLogoutUseCase;

  setUp(() {
    mockLogoutUseCase =
        MockLogoutUseCase();

    cubit = AuthCubit(
      logoutUseCase:
      mockLogoutUseCase,
    );
  });

  tearDown(() {
    cubit.close();
  });

  blocTest<AuthCubit, AuthState>(
    'emits unauthenticated when logout succeeds',
    build: () {
      when(
            () => mockLogoutUseCase(),
      ).thenAnswer((_) async {});

      return cubit;
    },
    act: (cubit) => cubit.logout(),
    expect: () => [
      AuthLoading(),
      Unauthenticated(),
    ],
  );
}