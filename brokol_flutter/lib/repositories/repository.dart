import 'package:brokol_flutter/repositories/database_connection.dart';
import 'package:flutter/gestures.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  DatabaseConnection? _databaseConnection;

  Repository() {
    // initialize database connection
    _databaseConnection = DatabaseConnection();
  }

  static Database? _database;

  // check if database exists
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _databaseConnection?.setDatabase();
    return _database;
  }

  // inserting data to table
  insertData(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }

  // read data from table
  readData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }

  // read data from table by id
  readDataById(table, itemId) async {
    var connection = await database;
    return await connection?.query(table, where: 'id=?', whereArgs: [itemId]);
  }

  // update data
  updateData(table, data) async {
    var connection = await database;
    return await connection
        ?.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  // delete data
  deleteData(table, itemId) async {
    var connection = await database;
    return await connection!.rawDelete("DELETE FROM $table WHERE id = $itemId");
  }

  // Read data from table by Column value
  readDataByColumnName(table, columnName, columnValue) async {
    var connection = await database;
    return await connection!
        .query(table, where: columnName + "=?", whereArgs: [columnValue]);
  }
}
