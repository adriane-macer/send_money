import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../datasources/transaction_remote_datasource.dart';

class TransactionRepositoryImpl
    implements TransactionRepository {
  final TransactionRemoteDataSource remote;

  TransactionRepositoryImpl(this.remote);

  @override
  Future<List<TransactionEntity>> getTransactions() async {
    final models = await remote.getTransactions();

    return models
        .map(
          (e) => TransactionEntity(
        id: e.id,
        title: e.title,
        amount: e.amount,
      ),
    )
        .toList();
  }
}