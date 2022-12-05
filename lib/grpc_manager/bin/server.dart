import 'package:grpc/grpc.dart' as grpc;
import 'package:flutter_chat_app/grpc_manager/lib/proto/generated/grpc_connection_exports.dart';
import 'package:flutter_chat_app/grpc_manager/lib/services/grpc_connection/conection_service_int.dart';

class ConnectionService extends ConnectionServiceBase {
  @override
  Future<Message> checkConnection(
          grpc.ServiceCall call, Message request) async =>
      connectionServices.checkConnection(request)!;
}

Future<void> main(List<String> args) async {
  final server = grpc.Server([ConnectionService()]);
  await server.serve(port: 5000);
  print('Server listening...');
}
