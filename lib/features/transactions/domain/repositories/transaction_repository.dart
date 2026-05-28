import 'package:send_money/features/transactions/domain/entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<List<TransactionEntity>> getTransactions();
}