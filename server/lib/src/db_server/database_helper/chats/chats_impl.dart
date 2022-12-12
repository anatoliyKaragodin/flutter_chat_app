import '../../../library/library_server.dart';

class ChatsServices implements IChatsServices {
  @override
  createChat({
    required int friend1Id,
    required int friend2Id,
    required String createdDate,
    String? deletedDate,
    required String updatedDate,
  }) async {
    var db = await dbServerServices.openDatabase();

    await db.execute('''
      INSERT INTO friends_chat (friend1_id, friend2_id, created_date, deleted_date, updated_date) VALUES (
        $friend1Id,
        $friend2Id,
        "$createdDate",
        "$deletedDate",
        "$updatedDate"
      );
      ''');

    return await db.rawQuery('''
      SELECT chat_id FROM friends_chat 
      WHERE (
        (friend1_id = $friend1Id) 
        AND 
        (friend2_id = $friend2Id)
        AND
        (created_date = $createdDate)
        AND
        (deleted_date = $deletedDate)
        AND
        (update_date = $updatedDate) 
        );
    ''');
  }

  @override
  getAllChats() async {
    var db = await dbServerServices.openDatabase();

    return await db.rawQuery('''SELECT * FROM friends_chat''');
  }

  @override
  getChatById({required int id}) async {
    var db = await dbServerServices.openDatabase();

    return await db.rawQuery('''
      SELECT * FROM friends_chat 
        WHERE (chat_id = $id)
    ''');
  }

  @override
  updateChat({required String newValues, required String condition}) async {
    var db = await dbServerServices.openDatabase();
    return await db
        .rawUpdate('''UPDATE friends_chat SET $newValues WHERE ($condition)''');
  }

  @override
  deleteChat({required int id}) async {
    var db = await dbServerServices.openDatabase();

    return await db
        .rawDelete('''DELETE FROM friends_chat WHERE (chat_id = $id)''');
  }

  @override
  getChatByTwoIds({required int friend1Id, required int friend2Id}) async {
    var db = await dbServerServices.openDatabase();

    var id_chat = await db.rawQuery('''
      SELECT f.chat_id FROM friends_chat f 
	      WHERE 
        (((f.friend1_id = $friend1Id) AND (f.friend2_id = $friend2Id)) 
        OR 
        ((f.friend1_id = $friend2Id) AND (f.friend2_id = $friend1Id)))''');
    return id_chat[0]['main_friends_chat_id'];
  }

  @override
  getChatsByUserId({required int userId}) async {
    var db = await dbServerServices.openDatabase();

    return await db.rawQuery('''SELECT * FROM friends_chat f 
	    WHERE ((f.friend1_id = $userId) OR (f.friend2_id = $userId))''');
  }
}
