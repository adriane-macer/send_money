import 'package:flutter_test/flutter_test.dart';
import 'package:send_money_app/features/transactions/data/models/transaction_model.dart';

void main() {
  test('should parse JSON correctly', () {
    final json = {
      'id': 1,
      'title': 'Send Money',
      'body': '100'
    };

    final model = TransactionModel.fromJson(json);

    expect(model.id, 1);
    expect(model.title, 'Send Money');
    expect(model.amount, 100.0);
  });
}