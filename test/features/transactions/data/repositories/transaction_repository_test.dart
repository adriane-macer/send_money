import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:send_money/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:send_money/features/transactions/domain/entities/transaction_entity.dart';

class MockRepo extends Mock implements TransactionRepository {}

void main() {
  late MockRepo repo;

  setUp(() {
    repo = MockRepo();
  });

  test('should return list of transactions', () async {
    when(() => repo.getTransactions()).thenAnswer(
      (_) async => [TransactionEntity(id: 1, title: 'Send Money', amount: 100)],
    );

    final result = await repo.getTransactions();

    expect(result.length, 1);
    expect(result.first.amount, 100);
  });

  test('should throw exception on failure', () {
    when(() => repo.getTransactions()).thenThrow(Exception('Failed'));

    expect(() => repo.getTransactions(), throwsException);
  });
}
