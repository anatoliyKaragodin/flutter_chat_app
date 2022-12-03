import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'IMessages.dart';

class MessagesHelper extends IMessages {

  MessagesHelper();
  
  @override
  addNewMessage({required int friendsChatId, required int senderId, required String content, required String date}) async {
    var db = await openDatabase();

    await db.execute('''
      INSERT INTO friends_chat (friend1_id, friend2_id) VALUES (
        $friendsChatId,
        $senderId,
        $content,
        $date
      )
      ''');

    return  await db.rawQuery('''
      SELECT main_friends_chat_id FROM friends_chat 
      WHERE (
        (friends_chat_id = $friendsChatId) 
        AND 
        (sender_id = $senderId)
        AND
        (content = $content)
        AND
        (date = $date))
    ''');
  }
  
  @override
  deleteMessage({required int id}) async {
    var db = await openDatabase();

    return await db.rawDelete('''DELETE FROM messages WHERE (main_messages_id = $id)''');
  }
  
  @override
  getAllMessages() async {
    var db = await openDatabase();

    return await db.rawQuery('''SELECT * FROM messages''');
  }
  
  @override
  getMessageById({required int id}) async {
    var db = await openDatabase();

    return await db.rawQuery('''SELECT * FROM messages 
        WHERE (main_messages_id = $id)''');
  }
  
  @override
  getMessagesByChatId({required int chatID}) async {
    var db = await openDatabase();

    return await db.rawQuery('''SELECT * FROM messages WHERE (friends_chat_id = $chatID)''');
  }
  
  @override
  getMessagesBySenderId({required int senderID}) async {
    var db = await openDatabase();

    return await db.rawQuery('''SELECT * FROM messages WHERE (sender_id = $senderID)''');
  }
  
  @override
  updateMessage({required String newValues, required String condition}) async {
    var db = await openDatabase();

    return await db.rawUpdate('''UPDATE messages SET $newValues WHERE ($condition)''');
  }
}