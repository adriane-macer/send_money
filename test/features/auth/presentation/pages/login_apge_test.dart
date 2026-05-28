import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:send_money/core/di/injection.dart';

import 'package:send_money/features/auth/presentation/pages/login_page.dart';

void main() {
  // setUp(()async{
  //   await initDependencies();
  // });

  testWidgets(
    'renders username and password fields',
        (tester) async {
      await initDependencies();
      await tester.pumpWidget(
        const MaterialApp(
          home: LoginPage(),
        ),
      );

      expect(find.text('Username'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Login'), findsWidgets);
    },
  );
}