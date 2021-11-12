import 'package:learning_flutter/database/app_database.dart';
import 'package:learning_flutter/models/contacts.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactsMap = _toMap(contact);

    return db.insert(_tableName, contactsMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);

    List<Contact> contacts = _queryToList(result);
    return contacts;
  }

  Contact _toContact(Map<String, dynamic> row) {
    final Contact contact = Contact(
      id: row[_id],
      name: row[_name],
      accountNumber: row[_accountNumber],
    );
    return contact;
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactsMap = {};

    contactsMap[_name] = contact.name;
    contactsMap[_accountNumber] = contact.accountNumber;
    return contactsMap;
  }

  List<Contact> _queryToList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      Contact contact = _toContact(row);
      contacts.add(contact);
    }

    return contacts;
  }
}
