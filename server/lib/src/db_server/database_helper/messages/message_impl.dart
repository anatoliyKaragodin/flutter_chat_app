import '../../../generated/grpc_manager.pb.dart';
import '../../../library/library_server.dart';

class MessagesServices implements IMessagesServices {
  @override
  addNewMessage({
    required int chatId,
    required int senderId,
    required String content,
  }) async {
    var db = await dbServerServices.openDatabase();

    //toDo
    await db.execute('''
      INSERT INTO messages (chat_id, sender_id, content, created_date, updated_date, deleted_date) VALUES (
        $chatId,
        $senderId,
        "$content",
        "2022-12-02T21:36:32.653712",
        "2022-12-02T21:36:32.653712",
        ""
      )
      ''');

    //toDO
    var id = await db.rawQuery('''
      SELECT message_id FROM messages
      WHERE (
        (chat_id = $chatId) 
        AND 
        (sender_id = $senderId)
        AND
        (content = '$content')
        AND
        (created_date = '2022-12-02T21:36:32.653712')
        AND
        (updated_date = '2022-12-02T21:36:32.653712')
        AND
        (deleted_date = '')
        )
    ''');
    return id[0]['message_id'];
  }

  @override
  deleteMessage({required int id}) async {
    var db = await dbServerServices.openDatabase();

    return await db
        .rawDelete('''DELETE FROM messages WHERE (messages_id = $id)''');
  }

  @override
  getAllMessages() async {
    var db = await dbServerServices.openDatabase();

    return await db.rawQuery('''SELECT * FROM messages''');
  }

  @override
  getMessageById({required int id}) async {
    var db = await dbServerServices.openDatabase();

    return await db.rawQuery('''SELECT * FROM messages 
        WHERE (message_id = $id)''');
  }

  @override
  getMessagesByChatId({required int chatId}) async {
    var db = await dbServerServices.openDatabase();

    return await db.rawQuery(
        '''SELECT * FROM messages WHERE (friends_chat_id = $chatId)''');
  }

  @override
  getMessagesBySenderId({required int senderId}) async {
    var db = await dbServerServices.openDatabase();

    return await db
        .rawQuery('''SELECT * FROM messages WHERE (sender_id = $senderId)''');
  }

  @override
  updateMessage({required String newValues, required String condition}) async {
    var db = await dbServerServices.openDatabase();

    return await db
        .rawUpdate('''UPDATE messages SET $newValues WHERE ($condition)''');
  }

  @override
  getRecentMessages({required LastMessage message}) async {
    var db = await dbServerServices.openDatabase();
    var messages = await db.rawQuery('''SELECT *
      FROM messages, friends_chat AS friend
      WHERE (messages_id > ${message.mainIdMessage} AND
        (friend.friend1_id = ${message.mainIdUser} OR 
        friend.friend2_id = ${message.mainIdUser}))''');
    return messages;
  }
}
