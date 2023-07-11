import 'package:sqflite/sqflite.dart';

class DataProvider {
  late Database db;

  late String path;

  Future open() async {
    String databasesPath = await getDatabasesPath();

    String path = '${databasesPath}/simply_private.db';
    print(path);

    // db = await openDatabase(path);

    db = await openDatabase(path, version: 1, onCreate: (Database db, _) async {
      await db.execute(
          'CREATE TABLE Messages (id INTEGER PRIMARY KEY, message TEXT)');
    });
  }

  Future delete() async {
    await deleteDatabase(path);
  }

  Future dummyData() async {
    await db.rawInsert(
        'INSERT INTO Messages(id, message) VALUES(?, ?)', [0, 'test_message']);
  }

  Future<int> count() async {
    return Sqflite.firstIntValue(
            await db.rawQuery('SELECT COUNT(*) FROM Messages')) ??
        0;
  }

  Future<List<String>> getMessages() async {
    var messages = (await db.rawQuery('SELECT * FROM Messages'));
    return messages.map((e) => e['message'].toString()).toList();
  }

  Future<List<String>> getMessagePreviews() async {
    var messages = (await db.rawQuery('SELECT * FROM Messages'));
    return messages.map((e) => e['message'].toString()).toList();
  }
}
