import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class sqldb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'tasks.db');
    Database mydb = await openDatabase(path, version: 1, onCreate: createDb);
    return mydb;
  }

  createDb(Database db, int version) async {
    await db.execute(
      '''CREATE TABLE tasks(
        "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        "title" TEXT NOT NULL, 
        "content" TEXT NOT NULL
        )''',
    );
  }


  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }


  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }


  Future<int> insertData(String sql, List<dynamic> arguments) async {
    Database? mydb = await db;
    // استخدام placeholders لإدخال القيم
    int response = await mydb!.rawInsert(sql, arguments);
    return response;
  }


  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'tasks.db');
    await deleteDatabase(path);
  }


}