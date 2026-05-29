import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:send_money/app/router/route_paths.dart';
import 'package:send_money/core/di/injection.dart';
import 'package:send_money/features/auth/auth_di.dart';
import 'package:send_money/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:send_money/features/transactions/presentation/pages/transactions_page.dart';
import 'package:send_money/features/transactions/transaction_di.dart';

import 'package:send_money/features/wallet/presentation/cubit/wallet_cubit.dart';
import 'package:send_money/features/wallet/presentation/pages/dashboard_page.dart';
import 'package:send_money/features/wallet/wallet_di.dart';

void main() {
  setUpAll((){
    setupAuthDI();
    setupWalletDI();
    setupTransactionDI();
  });

  testWidgets('renders View Transactions button', (tester) async {
    final router = GoRouter(
      initialLocation: RoutePaths.dashboard,
      routes: [
        GoRoute(
          path: RoutePaths.dashboard,
          builder: (_, __) =>
              BlocProvider(
                create: (_) => sl<WalletCubit>(),
                child: const DashboardPage(),
              ),
        ),
      ],
    );

    await tester.pumpWidget(BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: MaterialApp.router(routerConfig: router),
    ));

    expect(find.text('View Transactions'), findsOneWidget);
  });

  testWidgets(
      'navigates to transactions page when button tapped', (tester,) async {
    final router = GoRouter(
      initialLocation: RoutePaths.dashboard,
      routes: [
        GoRoute(
          path: RoutePaths.dashboard,
          builder: (_, __) =>
              BlocProvider(
                create: (_) => sl<WalletCubit>(),
                child: const DashboardPage(),
              ),
          routes: [
            GoRoute(
              path: RoutePaths.transactions,
              builder: (_, __) => const TransactionsPage(),
            )
          ]
        ),
      ],
    );

    await tester.pumpWidget(BlocProvider(
      create: (context) => sl<AuthCubit>(),
      child: MaterialApp.router(routerConfig: router),
    ));

    await tester.tap(find.text('View Transactions'));

    await tester.pumpAndSettle();

    expect(find.byType(TransactionsPage), findsOneWidget);
  });
}
