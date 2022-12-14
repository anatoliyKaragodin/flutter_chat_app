import '../../../library/library_server.dart';

class UsersServices implements IUsersServices {
  @override
  createUser(
      {required String name,
      required String email,
      required String registrationDate,
      required String profilePicUrl,
      required String password}) async {
    var db = await dbServerServices.openDatabase();

    await db.execute('''
      INSERT INTO users (name, email) VALUES (
        $name,
        $email,
        $registrationDate,
        $profilePicUrl
      );
      ''');

    return await db.rawQuery('''
      SELECT main_users_id FROM users 
      WHERE (
        (name = $name) 
        AND 
        (email = $email)
        AND
        (registration_date = $registrationDate)
        AND
        (profile_pic_url = $profilePicUrl));
    ''');
  }

  @override
  deleteUser({required int id}) async {
    var db = await dbServerServices.openDatabase();

    return await db
        .rawDelete('''SELETE FROM users WHERE (main_users_id = id)''');
  }

  @override
  getAllUsers() async {
    var db = await dbServerServices.openDatabase();

    return await db.rawQuery('''SELECT * FROM users''');
  }

  @override
  getUserByField({required String field, required Object fieldValue}) async {
    var db = await dbServerServices.openDatabase();

    return await db
        .rawQuery('''SELECT * FROM users WHERE ($field = $fieldValue)''');
  }

  @override
  updateUser({required String newValues, required String condition}) async {
    var db = await dbServerServices.openDatabase();

    return await db
        .rawUpdate('''UPDATE users SET $newValues WHERE ($condition)''');
  }

  @override
  getUserIdByChat({required int senderId, required int chatId}) async {
    var db = await dbServerServices.openDatabase();

    var users = await db.rawQuery(
        '''SELECT friend1_id, friend2_id FROM chats WHERE (chat_id = $chatId)''');

    return await users[0]['friend1_id'] == senderId
        ? users[0]['friend2_id']
        : users[0]['friend1_id'];
  }

  @override
  getHashCodeById({required int id}) async {
    var db = await dbServerServices.openDatabase();

    var hashConnect = await db
        .rawQuery('''SELECT hash_connect FROM users WHERE (user_id = $id)''');

    return hashConnect[0]['hash_connect'];
  }
}
