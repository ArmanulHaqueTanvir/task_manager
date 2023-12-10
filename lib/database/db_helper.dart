import 'package:sqflite/sqflite.dart';
import 'package:task_manager/model/task_model.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = "tasks";
  static String id = "id";
  static String name = "title";
  static String description = "description";
  static String selectedDate = "selectedDate";
  static String startTime = "startTime";
  static String remind = "remind";
  static String isCompleted = "isCompleted";
  static String upcomingDate = "upcomingDate";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }

    try {
      String path = '${await getDatabasesPath()}tasks.db';
      _db = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE $_tableName("
            "$id INTEGER PRIMARY KEY, "
            "$name STRING, "
            "$description TEXT, "
            "$startTime TEXT, "
            "$isCompleted INTEGER NOT NULL, "
            "$remind INTEGER NOT NULL ,"
            "$selectedDate TEXT NOT NULL ,"
            "ALTER TABLE $_tableName ADD COLUMN $upcomingDate TEXT)",
          );
        },
        // "$selectedDate TEXT NOT NULL ,"
      );
      // addColumnToTable(_db!);
    } catch (e) {
      print("$e error from database: ");
    }
  }

  static addColumnToTable(Database db) async {
    // Execute SQL query to add a new column to your table
    // await db.execute('ALTER TABLE $_tableName ADD COLUMN $upcomingDate TEXT' args[]);
  }

  static Future<int?> insert(Task task) async {
    DBHelper.initDb();
    return await _db?.insert(_tableName, task.toJson());
  }

  static Future<List<Map<String, Object?>>?> query() async {
    return await _db?.query(_tableName);
  }

  static delete(Task task) async {
    return await _db?.delete(
      _tableName,
      where: 'id=?',
      whereArgs: [task.id],
    );
  }

  static update(int id) async {
    return await _db?.rawUpdate('''
     UPDATE tasks
     SET isCompleted = ?
     WHERE id=?
     ''', [1, id]);
  }
}
