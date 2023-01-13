import 'package:chat_app/modules/client/custom_exception.dart';
import 'package:chat_app/modules/sending_manager/services/validator_service/validator_service.dart';
import 'package:chat_app/modules/signal_service/river/user_ref/user_state_ref.dart';
import 'package:chat_app/modules/storage_manager/db_helper/db_helper_start.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:chat_app/src/constants/db_constants.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_message_lib.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_sync_lib.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

import '../../../../src/generated/grpc_lib/grpc_user_lib.dart';

class UserNotifier extends StateNotifier<UserStateRef> {
  late MainUserServices _mainUserServices;

  late LocalUsersServices _usersServices;
  late LocalChatServices _chatServices;
  late LocalMessagesServices _messagesServices;
  UserNotifier() : super(const UserStateRef()) {
    _usersServices = LocalUsersServices();
    _mainUserServices = MainUserServices();
    _messagesServices = LocalMessagesServices();
    _chatServices = LocalChatServices();
    DBHelper.instanse.updateListenController.stream.listen((event) {
      if (event == DbListener.isUser) {
        if (!mounted) {
          return;
        }

        localReadUser();
      }
    });
  }

  UserStateRef setUsers(List<UserDto>? users) =>
      state = state.copyWith(users: users);

  Future<UserStateRef> localReadUser() {
    List<UserDto> users = [];

    return _usersServices.getAllUsers().then((value) {
      return state = state.copyWith(users: value);
    });
    // return state = state.copyWith(users: users);
  }

  Future<UserStateRef> readUser() async {
    //Получаем всех юзеров из локальной базы
    var users = <UserDto>[];
    //делаем синхронизацию
    ///
    ///Юзеры
    ///
    final mainUserId = await _usersServices.getMainUserId();
    //Юзера для обновления данных
    final usersUp = await _usersServices.getAllUserIdAndUpdated();
    final usersRequest = <UserRequest>[];
    if (usersUp.isNotEmpty) {
      print("lastID ${usersUp.last['user_id']}");
      for (var user in usersUp) {
        usersRequest.add(UserRequest(
            userId: user['user_id'] as int,
            updatedDate: user['updated_date'] as String));
      }
    }

    ///
    ///Чаты
    ///
    final maxChatId = await _chatServices.getMaxId();
    final chatsForUpdate = await _chatServices.getAllChats();
    final chatsRequest = <ChatRequest>[];
    if (chatsForUpdate.isNotEmpty) {
      for (var chat in chatsForUpdate) {
        chatsRequest.add(
            ChatRequest(chatId: chat.chatId, updatedDate: chat.updatedDate));
      }
    }

    ///
    ///Сообщения
    ///
    var maxMessageId = await _messagesServices.getMaxMessageId();
    var messagesForUpdate = await _messagesServices.getAllMessagesNotNull();
    var messagesRequest = <MessageRequest>[];
    if (messagesForUpdate.isNotEmpty) {
      for (var message in messagesForUpdate) {
        messagesRequest.add(MessageRequest(
            messageId: message.messageId, updatedDate: message.updatedDate));
      }
    }

    var stub = GrpcSynchronizationClient(GrpcClient().channel);

    //запрос на сервер
    var response = DataDBResponse();
    print('maxUserId: $mainUserId');
    print('chatId: $maxChatId');
    print('messageId: $maxMessageId');
    try {
      response = await stub.getUsersSynh(MainUserRequest(
        users: UsersRequest(mainUser: mainUserId, usersForUpdate: usersRequest),
        chats: ChatsRequest(maxChatId: maxChatId, chatsForUpdate: chatsRequest),
        messages: MessagesRequest(
            maxMessageId: maxMessageId, messageForUpdate: messagesRequest),
      ));
    } catch (e) {
      print(e);
    }
    print("NEWUSERS: ${response.users.usersNew}");

    ///
    ///ДОБАВЛЯЕМ НОВЫХ ЮЗЕРОВ
    ///
    for (var user in response.users.usersNew) {
      await ValidatorService.validUser(user: user);
    }

    ///
    ///ДОБАВЛЯЕМ НОВЫЕ ЧАТЫ
    ///
    print('NEW_CHATS: ${response.chats.chatsNew}');
    for (var chat in response.chats.chatsNew) {
      await ValidatorService.validChat(chat: chat);
      print('\\\\\\\\\\\\\\NEW CHATS DONE\\\\\\\\\\\\\\');
    }

    ///
    ///ОБНОВЛЯЕМ СТАРЫХ ЮЗЕРОВ
    ///
    print('REPSONSE_UPDATEUSERS: ${response.users.usersUpdated}');
    for (var user in response.users.usersUpdated) {
      print(
          "deleted date is empty? ${user.deletedDate} ${user.deletedDate.isEmpty}");
      String userAvatar = (user.deletedDate == "" || user.deletedDate.isEmpty)
          ? user.picture
          : """https://www.iconsdb.com/icons/preview/red/cancel-xxl.png""";
      await _usersServices.updateUser(
          newValues: '''name = "${user.name}",
                          email = "${user.email}",
                          created_date = "${user.createdDate}",
                          updated_date = "${user.updateDate}",
                          deleted_date = "${user.deletedDate}",
                          profile_pic_link = "$userAvatar"''',
          condition: 'user_id = ${user.userId}');
    }

    ///
    ///ДОБАВЛЯЕМ НОВЫЕ СООБЩЕНИЯ
    ///
    print("RESPONSE_MESSAGES NEW: ${response.messages.messagesNew}");
    for (var message in response.messages.messagesNew) {
      await ValidatorService.validMessage(message: message);
      // await _messagesServices.addNewMessageFromBase(message: msg);
      await _chatServices.updateChatDateUpdated(
          chatId: message.chatId, dateUpdated: message.updatedDate);
    }

    ///
    ///ОБНОВЛЯЕМ ЧАТЫ
    ///
    print("RESPONSE_UPDATED_CHATS: ${response.chats.chatsUpdated}");
    for (var chats in response.chats.chatsUpdated) {
            print('\\\\\\\\\\\\\\CHATS UPDATED DONE $chats\\\\\\\\\\\\\\');

    }

    ///
    ///ОБНОВЛЯЕМ СООБЩЕНИЯ
    ///
    print("RESPONSE_UPDATED_MESSAGE: ${response.messages.messagesUpdated}");
    for (var message in response.messages.messagesUpdated) {
      final type = ContentType.isText.name == message.contentType.name
          ? ContentType.isText
          : ContentType.isMedia.name == message.contentType.name
              ? ContentType.isMedia
              : ContentType.isMediaText.name == message.contentType.name
                  ? ContentType.isMediaText
                  : ContentType.isText;
      final msg = MessageDto(
        messageId: message.messageId,
        chatId: message.chatId,
        senderId: message.senderId,
        content: message.content,
        createdDate: message.createdDate,
        updatedDate: message.updatedDate,
        deletedDate: message.deletedDate,
        contentType: type,
        attachId: message.attachmentId,
        isRead: message.isRead,
      );
      print("UPDATEMESSAGE START");
      if (msg.deletedDate != null && msg.deletedDate != '') {
        await _messagesServices.deleteMessageByMessageId(id: msg.messageId!);
      } else {
        await _messagesServices.updateMessageSynh(msg: msg);
      }
      print("UPDATEMESSAGE END");
    }
    users = await _usersServices.getAllUsers();

    for (var userServ in users) {
      print('USERS IN Base: $userServ');
    }

    //Добавляем всех юзеров в state
    return state = state.copyWith(users: users);

    // emit(state.copyWith(users: users));
    // print(users);
    // }
  }

  Future<void> createUser(UserDto user) async {
    //Принимаем данные юзера во время создания по ивенту

    //отправляем запрос на создание юзера на сервер
//после успешного создания юзера на сервере
    //создаем юзера на локальном бд

    await _usersServices.createUser(
      userId: user.userId!,
      name: user.name,
      email: user.email,
      createdDate: user.createdDate,
      updatedDate: user.updatedDate,
      profilePicUrl: user.profilePicLink,
    );
//Добавляем в main_user table main_id, date_sync and key

    // var stub = await GrpcUsersClient(Locator.getIt<GrpcClient>().channel)
    //     .createUser(user.mainUsersId);
  }

  void changeUser(bool isStartDB) {
    print('GET USER PREF: ${UserPref.getUserDbPref} ');
    UserPref.setUserDbPref = isStartDB;
    print('GET USER PREF: ${UserPref.getUserDbPref} ');
  }

  void deleteUser(int userId) {
    var result;
    try {
      GrpcClient().deleteUser(userId: userId).then((value) => result = value);
    } catch (e) {
      throw CustomException(e.toString());
    }
    print('event: $userId');
    print(result.isDeleted);
    state = state.copyWith(isDeleted: result.isDeleted);
  }

  Future<void> updateMainUser(UserDto user) async {
    var result = UpdateUserResponse();
    try {
      result = await GrpcClient().updateUser(updatedUser: user);
      print('RESULT: $result');
    } catch (e) {
      print(e);
    }
    await _usersServices.updateUser(
        newValues: '''${DatabaseConst.usersColumnName} = "${result.name}",
            ${DatabaseConst.usersColumnEmail} = "${result.email}",
            ${DatabaseConst.usersColumnProfilePicLink} = "${result.profilePicUrl}",
            ${DatabaseConst.usersColumnUpdatedDate} = "${result.dateUpdated}"''',
        condition: '${DatabaseConst.usersColumnUserId} = ${result.userId}');
    //TODO:Артур добавил стрим на изменения состояний при изменении локальной базы у себя в ветке
    final users = await _usersServices.getUserById(id: UserPref.getUserId);
    late UserDto newMainUser;
    if (users.isNotEmpty) {
      newMainUser = users.map((user) => UserDto.fromMap(user)).toList()[0];
    }
    state = state.copyWith(mainUser: newMainUser);
  }

  Future<bool> confirmPassword(
      {required int userId, required String password}) async {
    PasswordResponse response;
    GrpcUsersClient stub = GrpcUsersClient(GrpcClient().channel);
    try {
      response = await stub.confirmPassword(
          PasswordConfirmRequest(userId: userId, password: password));
      print('RESULT: $response');
    } on GrpcError catch (e) {
      print('ERROR CONFIRM PASSWORD GRPC_CLIENT: $e');
      throw CustomException(e.message.toString());
    }
    return response.ok;
  }

  Future<bool> changePassword(
      {required int userId,
      required String newPassword,
      required String oldPassword}) async {
    PasswordResponse response = PasswordResponse();
    GrpcUsersClient stub = GrpcUsersClient(GrpcClient().channel);
    try {
      response = await stub.changePassword(PasswordChangeRequest(
          userId: userId, oldPassword: oldPassword, newPassword: newPassword));
      //TODO: Убрать принт
      print('RESULT CHANGE PASSWORD: $response');
    } on GrpcError catch (e) {
      //TODO: Убрать принт
      print('ERROR CHANGE PASSWORD GRPC_CLIENT: $e');
      throw CustomException(e.message.toString());
    }
    return response.ok;
  }

  Future<void> setMainUser() async {
    late UserDto user;
    List<Map<String, Object?>> users =
        await localUsersServices.getUserById(id: UserPref.getUserId);
    if (users.isNotEmpty) {
      user = users.map((user) => UserDto.fromMap(user)).toList()[0];
    }
    state = state.copyWith(mainUser: user);
  }
}
