import 'package:simply_private/types/ChatPreviewData.dart';
import 'package:simply_private/types/MessageData.dart';
import 'package:simply_private/types/UserData.dart';
import 'package:sqflite/sqflite.dart';

class DataProvider {
  late Database db;

  late String path;

  static const String no_name_message = 'no_name_error';

  Future init() async {
    String databasesPath = await getDatabasesPath();

    path = '${databasesPath}/simply_private.db';
  }

  Future open() async {
    // db = await openDatabase(path);

    db = await openDatabase(path, version: 1, onCreate: (Database db, _) async {
      await db.execute(
          "CREATE TABLE Users (user_id INTEGER PRIMARY KEY, name TEXT)");
      await db.execute(
          "CREATE TABLE Messages (message_id INTEGER PRIMARY KEY, message TEXT, time INTEGER, user_id INTEGER, FOREIGN KEY(user_id) REFERENCES Users(user_id))");
    });
  }

  Future delete() async {
    await deleteDatabase(path);
  }

  Future dummyDataScott() async {
    await db.rawInsert(
        'INSERT INTO Users(user_id, name) VALUES(?, ?)', [0, 'Scott']);
    await db.rawInsert(
        'INSERT INTO Messages(message_id, message, time, user_id) VALUES(?, ?, ?, ?)',
        [0, 'Scott_Msg_1', 1689106599, 0]);
    await db.rawInsert(
        'INSERT INTO Messages(message_id, message, time, user_id) VALUES(?, ?, ?, ?)',
        [1, 'Scott_Msg_2', 1689106600, 0]);
  }

  Future dummyDataFredrick() async {
    await db.rawInsert(
        'INSERT INTO Users(user_id, name) VALUES(?, ?)', [1, 'Fredrick']);
    await db.rawInsert(
        'INSERT INTO Messages(message_id, message, time, user_id) VALUES(?, ?, ?, ?)',
        [2, 'Fredrick_Msg_1', 1689106601, 1]);
    await db.rawInsert(
        'INSERT INTO Messages(message_id, message, time, user_id) VALUES(?, ?, ?, ?)',
        [3, 'Fredrick_Msg_2', 1689106602, 1]);
  }

  Future dummyDataBrice() async {
    await db.rawInsert(
        'INSERT INTO Users(user_id, name) VALUES(?, ?)', [2, 'Brice']);
    await db.rawInsert(
        'INSERT INTO Messages(message_id, message, time, user_id) VALUES(?, ?, ?, ?)',
        [4, 'Brice_Msg_1', 1689106603, 2]);
    await db.rawInsert(
        'INSERT INTO Messages(message_id, message, time, user_id) VALUES(?, ?, ?, ?)',
        [5, 'Brice_Msg_2', 1689106604, 2]);
  }

  Future<int> count() async {
    return Sqflite.firstIntValue(
            await db.rawQuery('SELECT COUNT(*) FROM Messages')) ??
        0;
  }

  Future<UserData> getUserByUserId(int userId) async {
    // var messages = (await db.rawQuery('SELECT message, time, user_id FROM Messages WHERE user_id = '));
    var userData = (await db.query(
      'Users',
      columns: ['"user_id"', '"name"'],
      where: '"user_id" = ?',
      whereArgs: [userId],
    ))
        .firstOrNull;

    return UserData(
      userId: userId,
      name: userData?['name'].toString() ?? no_name_message,
    );
  }

  Future<List<MessageData>> getMessagesByUserId(int userId) async {
    // var messages = (await db.rawQuery('SELECT message, time, user_id FROM Messages WHERE user_id = '));
    var messages = (await db.query(
      'Messages',
      columns: ['"message_id"', '"message"', '"time"', '"user_id"'],
      where: '"user_id" = ?',
      whereArgs: [userId],
    ));

    return messages
        .map((msg) => MessageData(
              messageId: int.parse(msg['message_id'].toString()),
              // messageId: int.tryParse(msg['message_id'].toString()) ?? -1,
              message: msg['message'].toString(),
              time: int.parse(msg['time'].toString()),
              // time: int.tryParse(msg['time'].toString()) ?? 0,
              userId: userId,
            ))
        .toList()
        .reversed
        .toList();
  }

  // Future<List<MessageData>> getMessagesByThread(int threadId) async {
  //   var messages = (await db.query(
  //     'Messages',
  //     columns: ['"message_id"', '"message"', '"time"', '"user_id"'],
  //     where: '"user_id" = ?',
  //     whereArgs: [threadId],
  //   ));

  //   return messages
  //       .map((e) => MessageData(
  //             messageId: int.parse(['message_id'].toString()),
  //             message: ['message'].toString(),
  //             time: int.parse(['time'].toString()),
  //             userId: threadId,
  //           ))
  //       .toList();
  // }

  Future<List<String>> getUsers() async {
    var messages = (await db.rawQuery('SELECT name FROM Users'));
    return messages.map((e) => e['name'].toString()).toList();
  }

  Future<List<ChatPreviewData>> getChatPreviews() async {
    List<ChatPreviewData> chatPreviews = (await db.rawQuery('''
SELECT Users.user_id, Users.name, Messages.message, Messages.time
FROM Users
JOIN Messages ON Users.user_id = Messages.user_id
WHERE Messages.time = (
    SELECT MAX(time)
    FROM Messages
    WHERE user_id = Users.user_id
    )
ORDER BY Messages.time DESC;
'''))
        .map((data) => ChatPreviewData(
              userId: int.parse(data['user_id'].toString()),
              // userId: int.tryParse(data['user_id'].toString()) ?? -1,
              name: data['name']?.toString() ?? 'no_name',
              messageText: data['message']?.toString(),
              // messageTime: int.parse(data['latest_message_time'].toString()),
              messageTime:
                  int.tryParse(data['latest_message_time'].toString()) ?? 0,
            ))
        .toList();

    return chatPreviews;
  }
}
