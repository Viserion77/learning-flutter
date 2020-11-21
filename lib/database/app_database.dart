import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void createDatabase (){
  getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'byteback.db');
    openDatabase(path, onCreate: (db, version){
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY,'
          'name TEXT,'
          'account)number INTEGER');
    }, version: 1);
  });
}