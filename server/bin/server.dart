import 'dart:async';

import 'package:grpc/grpc.dart';

import '../lib/src/generated/grpc_manager.pbgrpc.dart';
import '../lib/src/library/library_server.dart';

///
///Заполняем все методы как и в Protoc файле
///
class GrpcChat extends GrpcChatServiceBase {
  final _controllers = <StreamController<Message>, void>{};
  var messagesService = MessagesServices();
  var chatsService = ChatsServices();
  var usersService = UsersServices();

  @override
  Future<MessageBase> createMessage(ServiceCall call, Message request) async {
    var src = await messagesService.addNewMessage(
        chatId: request.chatId,
        senderId: request.senderId,
        content: request.content,
        createdDate: request.createdDate,
        updatedDate: request.updatedDate,
        deletedDate: request.deletedDate);

    var message = MessageBase();

    if (src != 0) {
      message.ok = true;
      message.messageId = src;
    } else {
      message.ok = false;
    }
    return message;
  }

  @override
  Stream<MessageBase> createMessages(
      ServiceCall call, Stream<Message> request) {
    // TODO: implement createNessages
    throw UnimplementedError();
  }

  @override
  Stream<MessageFromBase> synchronization(
      ServiceCall call, LastMessage request) async* {
    if (request.messageId == 0) {
      MessageFromBase lastMessage = MessageFromBase();
      yield lastMessage;
    } else {
      var messages = await messagesService.getRecentMessages(message: request);
      MessageFromBase lastMessage = MessageFromBase();
      if (messages.length == 0) {
        MessageFromBase lastMessage = MessageFromBase();
        yield lastMessage;
      } else {
        for (int i = 0; i < messages.length; i++) {
          MessageFromBase lastMessage = MessageFromBase();
          lastMessage.senderId = messages[i]['sender_id'];
          lastMessage.chatId = messages[i]['chat_id'];
          lastMessage.content = messages[i]['content'];
          lastMessage.createdDate = messages[i]['created_date'];
          lastMessage.updatedDate = messages[i]['updated_date'];
          lastMessage.deletedDate = messages[i]['deleted_date'];
          yield lastMessage;
        }
      }
    }
  }

  @override
  Future<Empty> connecting(ServiceCall call, Empty request) {
    // TODO: implement connecting
    throw UnimplementedError();
  }
}

///
///Настройка
///
Future<void> main() async {
  final server = Server(
    [GrpcChat()], //

    const <Interceptor>[], //Перехватчик

    //Реестр кодеков, отслеживает чем будем пользоваться
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );

  await server.serve(port: 50000);
  await dbServerServices.openDatabase();
  print('✅ Server listening on port ${server.port}...');
}
