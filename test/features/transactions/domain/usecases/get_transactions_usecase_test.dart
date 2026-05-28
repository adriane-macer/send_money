import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:send_money/features/transactions/domain/entities/transaction_entity.dart';
import 'package:send_money/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:send_money/features/transactions/domain/usecases/get_transactions_usecase.dart';

class MockTransactionRepository extends Mock
    implements TransactionRepository {}

void main() {
  late GetTransactionsUseCase useCase;
  late MockTransactionRepository repo;

  setUp(() {
    repo = MockTransactionRepository();
    useCase = GetTransactionsUseCase(repo);
  });

  test('should return list of transactions from repository', () async {
    final mockData = [
      TransactionEntity(
        id: 1,
        title: 'Send Money',
        amount: 100,
      ),
    ];

    when(() => repo.getTransactions())
        .thenAnswer((_) async => mockData);

    final result = await useCase();

    expect(result, mockData);
    verify(() => repo.getTransactions()).called(1);
  });

  test('should throw exception when repository fails', () {
    when(() => repo.getTransactions())
        .thenThrow(Exception('error'));

    expect(
          () => useCase(),
      throwsException,
    );
  });
}