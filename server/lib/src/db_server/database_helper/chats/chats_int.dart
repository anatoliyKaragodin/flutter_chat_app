import '../../../library/library_server.dart';

abstract class IChatsServices {
  factory IChatsServices() => ChatsServices();

  createChat(
      {required int friend1Id,
      required int friend2Id,
      required String createdDate,
      String? deletedDate,
      required String updatedDate});

  getChatById({required int id});

  updateChat({required String newValues, required String condition});

  deleteChat({required int id});

  getChatsByUserId({required int userId});

  getChatByTwoIds({required int friend1Id, required int friend2Id});

  getAllChats();
}

final chatsServices = IChatsServices();
