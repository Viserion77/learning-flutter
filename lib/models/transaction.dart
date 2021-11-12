import 'package:learning_flutter/models/contacts.dart';

class Transaction {
  final double value;
  final Contact contact;

  Transaction(this.contact, this.value);

  @override
  String toString() {
    return 'Transfer{value: $value, numberAccount: $contact}';
  }

  Transaction.fromJson(Map<String, dynamic> json)
      : value = double.tryParse(json['value'].toString()) ?? 0.0,
        contact = Contact.fromJson(json['contact']);

  Map<String, dynamic> toJson() => {
        'value': value,
        'contact': contact.toJson(),
      };
}
