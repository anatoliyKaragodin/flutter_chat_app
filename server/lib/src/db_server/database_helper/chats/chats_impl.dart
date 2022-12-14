import '../../../library/library_server.dart';

class ChatsServices implements IChatsServices {
  @override
  createChat({required int friend1_id, required int friend2_id}) async {
    var db = await dbServerServices.openDatabase();

    await db.execute('''
      INSERT INTO chats (friend1_id, friend2_id) VALUES (
        $friend1_id,
        $friend2_id
      );
      ''');

    return await db.rawQuery('''
      SELECT main_friends_chat_id FROM chats 
      WHERE (
        (friend1_id = $friend1_id) 
        AND 
        (friend2_id = $friend2_id));
    ''');
  }

  @override
  getAllChats() async {
    var db = await dbServerServices.openDatabase();

    return await db.rawQuery('''SELECT * FROM chats''');
  }

  @override
  getChatById({required int id}) async {
    var db = await dbServerServices.openDatabase();

    return await db.rawQuery('''
      SELECT * FROM chats 
        WHERE (main_friends_chat_id = $id)
    ''');
  }

  @override
  updateChat({required String newValues, required String condition}) async {
    var db = await dbServerServices.openDatabase();
    return await db
        .rawUpdate('''UPDATE chats SET $newValues WHERE ($condition)''');
  }

  @override
  deleteChat({required int id}) async {
    var db = await dbServerServices.openDatabase();

    return await db
        .rawDelete('''DELETE FROM chats WHERE (main_friends_chat_id = $id)''');
  }

  @override
  getChatByTwoIds({required int friend1_id, required int friend2_id}) async {
    var db = await dbServerServices.openDatabase();

    var id_chat = await db.rawQuery('''
      SELECT f.main_friends_chat_id FROM chats f 
	      WHERE 
        (((f.friend1_id = $friend1_id) AND (f.friend2_id = $friend2_id)) 
        OR 
        ((f.friend1_id = $friend2_id) AND (f.friend2_id = $friend1_id)))''');
    return id_chat[0]['main_friends_chat_id'];
  }

  @override
  getChatsByUserId({required int userID}) async {
    var db = await dbServerServices.openDatabase();

    return await db.rawQuery('''SELECT * FROM chats f 
	    WHERE ((f.friend1_id = $userID) OR (f.friend2_id = $userID))''');
  }
}
