import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:send_money/features/send_money/presentation/cubit/send_money_cubit.dart';
import 'package:send_money/features/send_money/presentation/cubit/send_money_state.dart';

void main() {
  late SendMoneyCubit cubit;

  setUp(() {
    cubit = SendMoneyCubit();
  });

  tearDown(() {
    cubit.close();
  });

  blocTest<SendMoneyCubit, SendMoneyState>(
    'emits validation error for empty amount',
    build: () => cubit,
    act: (cubit) => cubit.validateAmount(''),
    expect: () => [
      const SendMoneyValidationError(
        'Amount is required',
      ),
    ],
  );

  blocTest<SendMoneyCubit, SendMoneyState>(
    'emits validation error for zero amount',
    build: () => cubit,
    act: (cubit) => cubit.validateAmount('0'),
    expect: () => [
      const SendMoneyValidationError(
        'Amount must be greater than zero',
      ),
    ],
  );

  blocTest<SendMoneyCubit, SendMoneyState>(
    'emits validation error for negative amount',
    build: () => cubit,
    act: (cubit) => cubit.validateAmount('-100'),
    expect: () => [
      const SendMoneyValidationError(
        'Amount must be greater than zero',
      ),
    ],
  );

  blocTest<SendMoneyCubit, SendMoneyState>(
    'emits insufficient balance error',
    build: () => cubit,
    act: (cubit) => cubit.validateAmount('1000'),
    expect: () => [
      const SendMoneyValidationError(
        'Insufficient balance',
      ),
    ],
  );

  blocTest<SendMoneyCubit, SendMoneyState>(
    'emits valid state for correct amount',
    build: () => cubit,
    act: (cubit) => cubit.validateAmount('100'),
    expect: () => [
      const SendMoneyValid(),
    ],
  );
}