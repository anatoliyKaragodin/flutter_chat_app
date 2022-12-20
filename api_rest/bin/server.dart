import 'dart:convert';
import 'dart:io';

import 'package:api_rest/src/models/chat.dart';
import 'package:api_rest/src/services/chat/chat_service_impl.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..post('/create_chat', _createChat)
  ..get('/get_all_chats', _getAllChatsHandler);

Future<Response> _createChat(Request request) async {
  String body = await request.readAsString();
  var usersIdsJson = jsonDecode(body)['users'];
  List<int>? usersIds = usersIdsJson != null ? List.from(usersIdsJson) : null;
  if (usersIds == null || usersIds.length != 2) {
    return Response(400);
  }
  var friend1Id = usersIds[0];
  var friend2Id = usersIds[1];
  try {
    await ChatService().createChat(friend1Id: friend1Id, friend2Id: friend2Id);
    return Response.ok('OK');
  } catch (e) {
    return Response(400);
  }
}

Future<Response> _getAllChatsHandler(Request request) async {
  try {
    var allChats = await ChatService().getAllChats();
    return Response.ok(allChats.toString());
  } catch (e) {
    return Response(400);
  }
}

Response _rootHandler(Request req) {
  return Response.ok('Connection!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

void main(List<String> args) async {
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
