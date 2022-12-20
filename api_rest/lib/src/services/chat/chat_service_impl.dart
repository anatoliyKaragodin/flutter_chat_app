import 'package:api_rest/src/db/db_service.dart';
import 'package:api_rest/src/services/chat/chat_service_int.dart';
import 'package:sqflite_common/sqlite_api.dart';

class ChatService implements IChatService {
  @override
  createChat({required int friend1Id, required int friend2Id}) async {
    Database db = await DbServerServices.instanse.database;

    await db.insert('chats', {
      'friend1_id': friend1Id,
      'friend2_id': friend2Id,
      'created_date': DateTime.now().toIso8601String(),
      'updated_date': DateTime.now().toIso8601String()
    });

    return await db.query('chats',
        columns: ['chat_id'],
        where: '(friend1_id = $friend1Id) AND (friend2_id = $friend2Id)');

    // await db.execute('''
    //   INSERT INTO chats (friend1_id, friend2_id) VALUES (
    //     $friend1Id,
    //     $friend1Id
    //   );
    //   ''');

    // return await db.rawQuery('''
    //   SELECT chat_id FROM chats
    //   WHERE (
    //     (friend1_id = $friend1Id)
    //     AND
    //     (friend2_id = $friend2Id));
    // ''');
  }

  @override
  deleteChat({required int id}) async {
    Database db = await DbServerServices.instanse.database;

    return await db
        .rawDelete('''DELETE FROM chats WHERE (main_friends_chat_id = $id)''');
  }

  @override
  getAllChats() async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery('''SELECT * FROM chats''');
  }

  @override
  getChatByTwoIds({required int friend1Id, required int friend2Id}) async {
    Database db = await DbServerServices.instanse.database;

    var id_chat = await db.rawQuery('''
      SELECT f.main_friends_chat_id FROM chats f 
	      WHERE 
        (((f.friend1_id = $friend1Id) AND (f.friend2_id = $friend2Id)) 
        OR 
        ((f.friend1_id = $friend2Id) AND (f.friend2_id = $friend1Id)))''');
    return id_chat[0]['main_friends_chat_id'];
  }

  @override
  getChatsByUserId({required int userId}) async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery('''SELECT * FROM chats f 
	    WHERE ((f.friend1_id = $userId) OR (f.friend2_id = $userId))''');
  }

  @override
  updateChat({required String newValues, required String condition}) async {
    Database db = await DbServerServices.instanse.database;
    return await db
        .rawUpdate('''UPDATE chats SET $newValues WHERE ($condition)''');
  }

  @override
  getChatById({required int id}) async {
    Database db = await DbServerServices.instanse.database;

    return await db.rawQuery('''
      SELECT * FROM chats 
        WHERE (main_friends_chat_id = $id)
    ''');
  }
}
