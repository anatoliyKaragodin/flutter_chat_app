import 'package:chat_app/src/constants/db_constants.dart';
import 'package:chat_app/domain/data/library/library_data.dart';
import 'package:chat_app/modules/sending_manager/library/library_sending_manager.dart';
import 'package:chat_app/modules/storage_manager/library/library_storage_manager.dart';

class LocalUsersServices implements ILocalUsersServices {
  LocalUsersServices();

  @override
  Future<int> createUser(
      {required String name,
      required String email,
      required String registrationDate,
      required String profilePicUrl,
      required int mainUserId}) async {
    var db = await DBHelper.instanse.database;

    return await db.insert(DatabaseConst.userTable, {
      DatabaseConst.usersColumnName: name,
      DatabaseConst.usersColumnEmail: email,
      DatabaseConst.usersColumnRegistrationDate: registrationDate,
      DatabaseConst.usersColumnProfilePicLink: profilePicUrl,
      DatabaseConst.usersColumnMainUsersId: mainUserId,
    });
  }

  @override
  Future<int> deleteUser({required int id}) async {
    var db = await DBHelper.instanse.database;
    return await db.rawDelete(
        'DELETE FROM ${DatabaseConst.userTable} WHERE ${DatabaseConst.usersColumnId}=$id');
  }

  @override
  Future<List<UserDto>> getAllUsers() async {
    var db = await DBHelper.instanse.database;
    var users = await db.rawQuery('''
              SELECT *
              FROM ${DatabaseConst.userTable}
              ''');
    return users
        .map((item) => UserDto(
            localUserId: item[DatabaseConst.usersColumnId] as int,
            name: item[DatabaseConst.usersColumnName] as String,
            email: item[DatabaseConst.usersColumnEmail] as String,
            registrationDate:
                item[DatabaseConst.usersColumnRegistrationDate] as String,
            profilePicLink:
                item[DatabaseConst.usersColumnProfilePicLink] as String,
            mainUsersId: item[DatabaseConst.usersColumnMainUsersId] as int))
        .toList();
  }

  @override
  Future<List<Map<String, Object?>>> getUserByField(
      {required String field, required String fieldValue}) async {
    var db = await DBHelper.instanse.database;

    return await db.rawQuery('''
              SELECT *
              FROM ${DatabaseConst.userTable}
              WHERE $field = $fieldValue
              ''');
  }

  @override
  Future<int> getMainIdUserByLocalId({required int localId}) async {
    var db = await DBHelper.instanse.database;

    var user = await db.rawQuery('''
              SELECT ${DatabaseConst.usersColumnMainUsersId}
              FROM ${DatabaseConst.userTable}
              WHERE ${DatabaseConst.usersColumnId} = $localId
              ''');
    return user[0]['main_users_id'] as int;
  }

  @override
  Future<UserDto> getUserByLocalId({required int localId}) async {
    var db = await DBHelper.instanse.database;

    var user = await db.rawQuery('''
              SELECT ${DatabaseConst.usersColumnMainUsersId}
              FROM ${DatabaseConst.userTable}
              WHERE ${DatabaseConst.usersColumnId} = $localId
              ''');
    return user[0] as UserDto;
  }

  @override
  Future<int> updateUser(
      {required String newValues, required String condition}) async {
    var db = await DBHelper.instanse.database;
    return await db.rawUpdate(
        'UPDATE ${DatabaseConst.userTable} SET $newValues WHERE $condition');
  }
}
