import 'dart:convert';
import 'dart:math';
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

    // on success just return the dummy data for demo purpose only
    // due to fake api implementation only
    return _dummyTransactionData();

    // return data
    //     .map((e) => TransactionModel.fromJson(e))
    //     .toList();
  }
}



// provide only dummy data for transactions
List<TransactionModel> _dummyTransactionData() {


  Random rnd = Random();
  final list = List.generate(20, (i){
    final value = rnd.nextDouble() * 500.0;
    return TransactionModel(id: i+1, title: "Sent Money", amount: value);
  });

  return list;
}