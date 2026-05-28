import 'dart:convert';

import 'package:http/http.dart' as http;

import 'send_money_remote_datasource.dart';

class SendMoneyRemoteDataSourceImpl implements SendMoneyRemoteDataSource {
  final http.Client client;

  SendMoneyRemoteDataSourceImpl(this.client);

  @override
  Future<void> sendMoney({required double amount}) async {
    final response = await client.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      body: jsonEncode({'amount': amount}),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to send money');
    }
  }
}
