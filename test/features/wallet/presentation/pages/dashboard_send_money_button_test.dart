import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:send_money/core/di/injection.dart';
import 'package:send_money/features/auth/domain/repositories/auth_repository.dart';
import 'package:send_money/features/auth/domain/usecases/logout_usecase.dart';
import 'package:send_money/features/auth/presentation/cubit/auth_cubit.dart';

import 'package:send_money/features/send_money/presentation/pages/send_money_page.dart';

import 'package:send_money/features/wallet/presentation/cubit/wallet_cubit.dart';
import 'package:send_money/features/wallet/presentation/pages/dashboard_page.dart';


void main() {
  setUpAll(() async {
    await initDependencies();
  });

  testWidgets(
    'renders Send Money button',
        (tester) async {
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (_, __) =>
                BlocProvider(
                  create: (_) =>
                      WalletCubit(),
                  child:
                  const DashboardPage(),
                ),
          ),
          GoRoute(
            path: '/send-money',
            builder: (_, __) =>
            const SendMoneyPage(),
          ),
        ],
      );

      await tester.pumpWidget(
        BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );

      expect(
        find.text('Send Money'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'navigates to send money page when button tapped',
        (tester) async {
      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (_, __) =>
                BlocProvider(
                  create: (_) =>
                      WalletCubit(),
                  child:
                  const DashboardPage(),
                ),
          ),
          GoRoute(
            path: '/send-money',
            builder: (_, __) =>
            const SendMoneyPage(),
          ),
        ],
      );

      await tester.pumpWidget(
        BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );

      await tester.tap(
        find.text('Send Money'),
      );

      await tester.pumpAndSettle();

      expect(
        find.text('Send Money'),
        findsWidgets,
      );

      expect(
        find.byType(
          SendMoneyPage,
        ),
        findsOneWidget,
      );
    },
  );
}