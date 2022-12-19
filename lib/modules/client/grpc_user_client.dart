import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/client/grpc_client.dart';
import 'package:chat_app/src/generated/grpc_lib/grpc_user_lib.dart';
import 'package:chat_app/src/generated/messages/messages.pbgrpc.dart';
import 'package:grpc/service_api.dart';

class UserClient extends GrpcClient {
  Future getUser({required GetUserRequest user}) async {
    late GrpcUsersClient stub;
    stub = GrpcUsersClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));

    var request = GetUserRequest()
      ..id = user.id
      ..name = user.name
      ..email = user.email
      ..createdDate = user.createdDate;
    var response = await stub.getUser(request);
    print(response);
    return response;
  }

  Future createUser({required GetUserRequest user}) async {
    late GrpcUsersClient stub;
    stub = GrpcUsersClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));
    var request = CreateUserRequest()
      ..name = user.name
      ..email = user.email
      ..email = user.email
      ..createdDate = user.createdDate;
    var response = await stub.createUser(request);
    print(response);
    return response;
  }
}