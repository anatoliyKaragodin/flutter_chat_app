import 'dart:convert';
import 'dart:io';

import 'package:api_rest/src/services/chat/chat_service_impl.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/get_all_chats', _getAllChatsHandler);

// UserId userIdFromJson(String str) => UserId.fromJson(json.decode(str));

// String userIdToJson(UserId data) => json.encode(data.toJson());

// List<UserId> userIdsFromJson(String str) =>
//     List<UserId>.from(json.decode(str).map((x) => UserId.fromJson(x)));

// String userIdsToJson(List<UserId> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class UserId {
//   final int id;
//   UserId({required this.id});

//   factory UserId.fromJson(Map<String, dynamic> json) => UserId(id: json['id']);

//   Map<String, dynamic> toJson() => {'id': id};
// }

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
