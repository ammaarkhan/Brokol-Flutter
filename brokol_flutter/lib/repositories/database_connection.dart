import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_categories');
    var database =
        await openDatabase(path, version: 1, onCreate: _onCreatingDatatbase);
    return database;
  }

  _onCreatingDatatbase(Database database, int version) async {
    await database.execute(
        "CREATE TABLE categories(id INTEGER PRIMARY KEY, name TEXT, description TEXT)");

    // create item table
    await database.execute(
        'CREATE TABLE items(id INTEGER PRIMARY KEY, title TEXT, category TEXT, expDate TEXT, isFinished INT)');
  }
}
