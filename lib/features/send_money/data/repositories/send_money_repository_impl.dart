import '../../domain/repositories/send_money_repository.dart';

import '../datasources/send_money_remote_datasource.dart';

class SendMoneyRepositoryImpl
    implements SendMoneyRepository {
  final SendMoneyRemoteDataSource
  remoteDataSource;

  SendMoneyRepositoryImpl(
      this.remoteDataSource,
      );

  @override
  Future<void> sendMoney({
    required double amount,
  }) {
    return remoteDataSource.sendMoney(
      amount: amount,
    );
  }
}