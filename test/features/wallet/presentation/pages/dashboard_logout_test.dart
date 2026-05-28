import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:send_money/features/auth/domain/repositories/auth_repository.dart';

import 'package:send_money/features/auth/domain/usecases/logout_usecase.dart';
import 'package:send_money/features/auth/presentation/cubit/auth_cubit.dart';

import 'package:send_money/features/wallet/presentation/cubit/wallet_cubit.dart';
import 'package:send_money/features/wallet/presentation/pages/dashboard_page.dart';

class FakeLogoutUseCase
    extends LogoutUseCase {
  FakeLogoutUseCase()
      : super(FakeRepository());
}

class FakeRepository
    implements AuthRepository {
  @override
  noSuchMethod(Invocation invocation) =>
      super.noSuchMethod(invocation);
}

void main() {
  testWidgets(
    'logout button exists',
        (tester) async {
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) =>
                  WalletCubit(),
            ),
            BlocProvider(
              create: (_) => AuthCubit(
                logoutUseCase:
                FakeLogoutUseCase(),
              ),
            ),
          ],
          child: const MaterialApp(
            home: DashboardPage(),
          ),
        ),
      );

      expect(
        find.text('Logout'),
        findsOneWidget,
      );
    },
  );
}