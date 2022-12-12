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
  Stream<Message> connecting(ServiceCall call, Stream<Message> request) async* {
    print('Connecting: ${request.hashCode}');

    final clientController = StreamController<Message>();
    _controllers[clientController] = null;

    request.listen((req) {
      print(
          'Request ${req.content} + from sender: ${req.senderMainId} in chat: ${req.chatIdMain} with haschcode: (#${request.hashCode})');

      _controllers.forEach((controller, _) {
        if (controller != clientController) {
          controller.sink.add(req);
        }
      });
    }).onError((dynamic e) {
      print(e);
      _controllers.remove(clientController);
      clientController.close();
      print('Disconnected: #${request.hashCode}');
    });

    await for (final req in clientController.stream) {
      print('  -> piped to #${request.hashCode}');

      yield Message(
          chatIdMain: req.chatIdMain,
          senderMainId: req.senderMainId,
          content: req.content,
          hashcode: req.hashcode,
          date: req.date);
    }
  }

  @override
  Future<MessageBase> createMessage(ServiceCall call, Message request) async {
    var src = await messagesService.addNewMessage(
        friendsChatId: request.chatIdMain,
        senderId: request.senderMainId,
        content: request.content,
        date: request.date);

    var message = MessageBase();

    if (src != 0) {
      message.ok = true;
      message.mainMessagesId = src;
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
          lastMessage.mainIdMessage = messages[i]['main_messages_id'];
          lastMessage.chatIdMain = messages[i]['friends_chat_id'];
          lastMessage.senderMainId = messages[i]['sender_id'];
          lastMessage.content = messages[i]['content'];
          lastMessage.date = messages[i]['date'];
          yield lastMessage;
        }
      }
    }
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
