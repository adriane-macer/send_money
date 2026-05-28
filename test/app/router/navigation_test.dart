import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:send_money/app/router/app_router.dart';

void main() {
  testWidgets(
    'navigates to dashboard',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: AppRouter.router,
        ),
      );

      AppRouter.router.go('/dashboard');

      await tester.pumpAndSettle();

      expect(find.text('Dashboard Page'), findsOneWidget);
    },
  );
}