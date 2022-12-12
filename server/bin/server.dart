import 'dart:async';

import 'package:grpc/grpc.dart';

import '../lib/src/generated/grpc_manager.pbgrpc.dart';
import '../lib/src/library/library_server.dart';

///
///Заполняем все методы как и в Protoc файле
///
class GrpcChat extends GrpcChatServiceBase {
  var messagesService = MessagesServices();
  var chatsService = ChatsServices();
  var usersService = UsersServices();

  //toDO!!!
  @override
  Future<CreateMessageResponse> createMessage(
      ServiceCall call, CreateMessageRequest request) async {
    var src = await messagesService.addNewMessage(
      chatId: request.chatIdMain,
      senderId: request.senderMainId,
      content: request.content,
    );

    var message = MessageBase();

    if (src != 0) {
      message.ok = true;
      message.mainMessagesId = src;
    } else {
      message.ok = false;
    }
    return CreateMessageResponse(
        mainMessagesId: message.mainMessagesId,
        dateCreate: '2022-12-02T21:36:32.653712'); //toDo!!!
  }

  //toDO!!!
  @override
  Stream<MessageFromBase> synchronization(
      ServiceCall call, LastMessage request) async* {
    if (request.mainIdMessage == 0) {
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
          lastMessage.senderMainId = messages[i]['sender_id'];
          lastMessage.chatIdMain = messages[i]['chat_id'];
          lastMessage.content = messages[i]['content'];
          lastMessage.date = messages[i]['created_date'];
          yield lastMessage;
        }
      }
    }
  }

  //ToDO!!!
  @override
  Future<DeleteMessageResponse> deleteMessage(
      ServiceCall call, DeleteMessageRequest request) {
    // TODO: implement deleteMessage
    throw UnimplementedError();
  }

  //ToDO!!!
  @override
  Future<UpdateMessageResponse> updateMessage(
      ServiceCall call, UpdateMessageRequest request) {
    // TODO: implement updateMessage
    throw UnimplementedError();
  }

  @override
  Future<ConnectResponse> connecting(
      ServiceCall call, ConnectRequest request) async {
    //save to db
    print('Connect: id: ${request.id}  hashcode: ${request.hashCode}');

    return ConnectResponse(id: request.id, hashConnect: request.hashCode);
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
