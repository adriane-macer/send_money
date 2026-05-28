import 'package:send_money/features/transactions/data/models/transaction_model.dart';

abstract class TransactionRemoteDataSource {
  Future<List<TransactionModel>> getTransactions();
}