import 'package:learning_flutter/database/dao/contacts_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'learningFlutter.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(
        ContactDao.tableSql,
      );
    },
    version: 1,
  );
}
