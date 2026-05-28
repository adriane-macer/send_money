import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:send_money/app/router/app_router.dart';
import 'package:send_money/core/di/injection.dart';
import 'package:send_money/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:send_money/features/wallet/presentation/cubit/wallet_cubit.dart';

void main() {
  testWidgets('navigates to dashboard', (tester) async {
    await initDependencies();
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => WalletCubit()),
          BlocProvider(create: (_) => sl<AuthCubit>()),
        ],
        child: MaterialApp.router(routerConfig: AppRouter.router),
      ),
    );

    AppRouter.router.go('/dashboard');

    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsOneWidget);
  });
}
