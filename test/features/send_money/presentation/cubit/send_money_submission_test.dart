import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:send_money/features/send_money/domain/usecases/send_money_usecase.dart';

import 'package:send_money/features/send_money/presentation/cubit/send_money_cubit.dart';

class MockSendMoneyUseCase extends Mock implements SendMoneyUseCase {}

void main() {
  late SendMoneyCubit cubit;
  late MockSendMoneyUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockSendMoneyUseCase();

    cubit = SendMoneyCubit(sendMoneyUseCase: mockUseCase);
  });

  tearDown(() {
    cubit.close();
  });

  blocTest<SendMoneyCubit, SendMoneyState>(
    'emits loading then success when API succeeds',
    build: () {
      when(() => mockUseCase(amount: 100)).thenAnswer((_) async {});

      return cubit;
    },
    act: (cubit) => cubit.submitMoney(100),
    expect: () => [SendMoneyLoading(), SendMoneySuccess()],
  );

  blocTest<SendMoneyCubit, SendMoneyState>(
    'emits loading then failure when API fails',
    build: () {
      when(() => mockUseCase(amount: 100)).thenThrow(Exception('API Error'));

      return cubit;
    },
    act: (cubit) => cubit.submitMoney(100),
    expect: () => [
      SendMoneyLoading(),
      const SendMoneyFailure('Failed to send money'),
    ],
  );
}
