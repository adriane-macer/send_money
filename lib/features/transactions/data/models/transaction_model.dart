class TransactionModel {
  final int id;
  final String title;
  final double amount;

  TransactionModel({
    required this.id,
    required this.title,
    required this.amount,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      title: json['title'],
      amount: double.tryParse(json['body'].toString()) ?? 0,
    );
  }
}