abstract class SendMoneyRepository {
  Future<void> sendMoney({
    required double amount,
  });
}