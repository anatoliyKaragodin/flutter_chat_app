import '../../../library/library_server.dart';

abstract class IUsersServices {
  factory IUsersServices() => UsersServices();

  createUser(
      {required String name,
      required String email,
      required String registrationDate,
      required String profilePicUrl,
      required String password});

  getUserByField({required String field, required Object fieldValue});

  getUserIdByChat({required int senderId, required int chatId});

  getHashCodeById({required int id});

  updateUser({required String newValues, required String condition});

  deleteUser({required int id});

  getAllUsers();
}

final usersServices = IUsersServices();
