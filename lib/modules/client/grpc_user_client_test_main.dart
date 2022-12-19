import 'package:chat_app/modules/client/grpc_client.dart';
import 'package:chat_app/modules/client/grpc_user_client.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_user_lib.dart';

import '../../domain/data/dto/user_dto/user_dto.dart';

Future<void> main() async {
  final _channel = GrpcClient().channel;
    var user = GetUserRequest(
    id: 1,
    name: 'test1',
    email: 't1@t1.t1',
    createdDate: '2022-12-02T21:36:32.653712'
  );

  var r = await UserClient().getUser(user: user);
  print(r);
  // var createUser = CreateUserRequest(
    
  // );
  // UserClient().createUser(user: user);
}