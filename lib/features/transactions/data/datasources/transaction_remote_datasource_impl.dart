import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:send_money/features/transactions/data/datasources/transaction_remote_datasource.dart';

import '../models/transaction_model.dart';

class TransactionRemoteDataSourceImpl
    implements TransactionRemoteDataSource {
  final http.Client client;

  TransactionRemoteDataSourceImpl(this.client);

  @override
  Future<List<TransactionModel>> getTransactions() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load');
    }

    final List data = jsonDecode(response.body);

    return data
        .map((e) => TransactionModel.fromJson(e))
        .toList();
  }
}