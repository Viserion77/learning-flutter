import 'dart:convert';

import 'package:http/http.dart';
import 'package:learning_flutter/http/webclient.dart';
import 'package:learning_flutter/models/transaction.dart';

class TransactionWebclient {
  final Uri uri =
      Uri.parse('https://61882c35057b9b00177f9be8.mockapi.io/transactions');

  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(uri).timeout(
          const Duration(
            seconds: 30,
          ),
        );

    final List<dynamic> decodedJson = jsonDecode(response.body);

    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction newTransaction) async {
    final Response response = await client
        .post(
          uri,
          headers: {
            'Content-type': 'application/json',
          },
          body: jsonEncode(newTransaction.toJson()),
        )
        .timeout(
          const Duration(
            seconds: 30,
          ),
        );
    final Map<String, dynamic> transactionJson = jsonDecode(response.body);

    return Transaction.fromJson(transactionJson);
  }
}
