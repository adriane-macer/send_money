import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:send_money/app/router/app_router.dart';
import 'package:send_money/app/router/route_paths.dart';
import 'package:send_money/core/di/injection.dart';
import 'package:send_money/features/auth/auth_di.dart';
import 'package:send_money/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:send_money/features/wallet/presentation/cubit/wallet_cubit.dart';
import 'package:send_money/features/wallet/wallet_di.dart';

void main() {
  setUpAll((){
    setupAuthDI();
    setupWalletDI();
  });

  testWidgets('navigates to dashboard', (tester) async {
    await tester.pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<WalletCubit>()),
          BlocProvider(create: (_) => sl<AuthCubit>()),
        ],
        child: MaterialApp.router(routerConfig: AppRouter.router),
      ),
    );

    AppRouter.router.go(RoutePaths.dashboard);

    await tester.pumpAndSettle();

    expect(find.text('Dashboard'), findsOneWidget);
  });
}
