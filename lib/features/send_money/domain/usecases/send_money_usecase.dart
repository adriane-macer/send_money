import '../repositories/send_money_repository.dart';

class SendMoneyUseCase {
  final SendMoneyRepository
  repository;

  SendMoneyUseCase(this.repository);

  Future<void> call({
    required double amount,
  }) {
    return repository.sendMoney(
      amount: amount,
    );
  }
}