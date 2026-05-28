import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:send_money/features/send_money/presentation/cubit/send_money_cubit.dart';

import 'package:send_money/features/send_money/presentation/pages/send_money_page.dart';

void main() {
  testWidgets(
    'shows loading indicator while submitting',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) =>
                SendMoneyCubit(),
            child:
            const SendMoneyPage(),
          ),
        ),
      );

      expect(
        find.text('Submit'),
        findsOneWidget,
      );
    },
  );
}