import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'generated/number_model.dart';

class DatabaseHelper {
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;
  static const table = 'my_table';
  static const table2 = 'numbers';
  static const columnId = '_id';
  static const columnName = 'name';
  static const columnReg = 'reg';
  static const columnPhone = 'phone';
  static const columnEmail = 'email';
  static const columnGender = 'gender';
  static const columnStatus = 'status';
  static late Database _db;

  // this opens the database (and creates it if it doesn't exist)
  Future<void> mydb() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    String sql2 = "CREATE TABLE numbers(id INTEGER PRIMARY KEY,num INTEGER)";

    await db.execute(sql2);
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnReg TEXT NOT NULL,
            $columnEmail TEXT NOT NULL,
            $columnPhone TEXT NOT NULL,
            $columnGender TEXT NOT NULL,
            $columnStatus INTEGER NOT NULL
          )
          ''');
  }

  SaveNumber(modelnumber user) async {
    return await _db.insert('numbers', user.passwordMap());
  }

  Future<int> insert(Map<String, dynamic> row) async {
    return await _db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllnumber() async {
    return await _db.query('numbers');
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    return await _db.query(table);
  }

  Future<int> queryRowCount() async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> queryRowMale() async {
    final results = await _db
        .rawQuery('SELECT COUNT(*) FROM $table WHERE $columnGender = "Male"');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> queryRowFemale() async {
    final results = await _db
        .rawQuery('SELECT COUNT(*) FROM $table WHERE $columnGender = "Female"');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> queryRowPaid() async {
    final results = await _db
        .rawQuery('SELECT COUNT(*) FROM $table WHERE $columnStatus = "0"');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> queryRowUnPaid() async {
    final results = await _db
        .rawQuery('SELECT COUNT(*) FROM $table WHERE $columnStatus = "1"');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    int id = row[columnId];
    return await _db.update(
      table,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    return await _db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
