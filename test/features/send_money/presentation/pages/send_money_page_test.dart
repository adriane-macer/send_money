import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:send_money/core/di/injection.dart';

import 'package:send_money/features/send_money/presentation/cubit/send_money_cubit.dart';
import 'package:send_money/features/send_money/presentation/pages/send_money_page.dart';
import 'package:send_money/features/send_money/send_money_di.dart';

void main() {
  setUpAll((){
    setupSendMoneyDI();
  });

  testWidgets(
    'renders amount field and submit button',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) =>
                sl<SendMoneyCubit>(),
            child:
            const SendMoneyPage(),
          ),
        ),
      );

      expect(
        find.text('Amount'),
        findsOneWidget,
      );

      expect(
        find.text('Submit'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'shows validation error for empty amount',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) =>
                sl<SendMoneyCubit>(),
            child:
            const SendMoneyPage(),
          ),
        ),
      );

      await tester.tap(
        find.text('Submit'),
      );

      await tester.pump();

      expect(
        find.text('Amount is required'),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'shows insufficient balance error',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) =>
                sl<SendMoneyCubit>(),
            child:
            const SendMoneyPage(),
          ),
        ),
      );

      await tester.enterText(
        find.byType(TextField),
        '1000',
      );

      await tester.tap(
        find.text('Submit'),
      );

      await tester.pump();

      expect(
        find.text('Insufficient balance'),
        findsOneWidget,
      );
    },
  );
}