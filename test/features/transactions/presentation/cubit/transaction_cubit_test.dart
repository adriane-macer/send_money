import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:send_money/features/transactions/domain/usecases/get_transactions_usecase.dart';
import 'package:send_money/features/transactions/presentation/cubit/transaction_cubit.dart';

class MockUseCase extends Mock implements GetTransactionsUseCase {}

void main() {
  late MockUseCase useCase;
  late TransactionCubit cubit;

  setUp(() {
    useCase = MockUseCase();
    cubit = TransactionCubit(useCase);
  });

  blocTest<TransactionCubit, TransactionState>(
    'emits loading then success',
    build: () {
      when(() => useCase())
          .thenAnswer((_) async => []);
      return cubit;
    },
    act: (cubit) => cubit.fetch(),
    expect: () => [
      TransactionLoading(),
      TransactionSuccess([]),
    ],
  );

  blocTest<TransactionCubit, TransactionState>(
    'emits failure when error occurs',
    build: () {
      when(() => useCase())
          .thenThrow(Exception('error'));
      return cubit;
    },
    act: (cubit) => cubit.fetch(),
    expect: () => [
      TransactionLoading(),
      TransactionFailure('Failed to load transactions'),
    ],
  );
}