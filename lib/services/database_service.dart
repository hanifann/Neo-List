import 'package:neo_list/models/todo_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database _database;
  static final int _version = 1;
  static final String _tableName = 'db_todo';

  static Future<void> initDb() async {
    if (_database != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'db_todo.db';
      _database =
          await openDatabase(_path, version: _version, onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, todo STRING, date TEXT, done INTEGER, kategori STRING, jam TEXT)",
        );
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(TodoModel todoModel) async {
    var res = await _database.insert(_tableName, todoModel.toJson());
    return res;
  }

  static Future<int> delete(TodoModel todoModel) async {
    return await _database
        .delete(_tableName, where: 'id = ?', whereArgs: [todoModel.id]);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return _database.query(_tableName);
  }

  static Future<List<Map<String, dynamic>>> queryClause(
      var where, String clause) async {
    return _database
        .query(_tableName, where: '$where = ?', whereArgs: [clause]);
  }

  static Future<int> getCount() async {
    var x = await _database.rawQuery('SELECT COUNT (*) FROM $_tableName');
    int count = Sqflite.firstIntValue(x);
    return count;
  }

  static Future<int> update(TodoModel todoModel) async {
    return _database.update(_tableName, todoModel.toJson(),
        where: 'id = ?', whereArgs: [todoModel.id]);
  }
}
