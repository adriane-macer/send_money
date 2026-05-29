import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:send_money/core/di/injection.dart';
import 'package:send_money/features/auth/auth_di.dart';
import 'package:send_money/features/auth/presentation/cubit/auth_cubit.dart';

import 'package:send_money/features/wallet/presentation/cubit/wallet_cubit.dart';
import 'package:send_money/features/wallet/presentation/pages/dashboard_page.dart';
import 'package:send_money/features/wallet/wallet_di.dart';

void main() {
  setUpAll((){
    setupAuthDI();
    setupWalletDI();
  });

  testWidgets('shows visible balance initially', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => WalletCubit()),
            BlocProvider(create: (_) => sl<AuthCubit>()),
          ],

          child: const DashboardPage(),
        ),
      ),
    );

    expect(find.text('₱500.00'), findsOneWidget);
  });

  testWidgets('hides balance when icon tapped', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => WalletCubit()),
            BlocProvider(create: (_) => sl<AuthCubit>()),
          ],

          child: const DashboardPage(),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.visibility));

    await tester.pump();

    expect(find.text('******'), findsOneWidget);
  });

  testWidgets('shows balance again when icon tapped twice', (tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => WalletCubit()),
            BlocProvider(create: (_) => sl<AuthCubit>()),
          ],

          child: const DashboardPage(),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.visibility));

    await tester.pump();

    await tester.tap(find.byIcon(Icons.visibility_off));

    await tester.pump();

    expect(find.text('₱500.00'), findsOneWidget);
  });
}
