import 'package:grpc/grpc.dart';
import 'package:server/src/generated/users.pbgrpc.dart';

Future<void> main() async {
  // final _channel = GrpcClient().channel;
  var user = GetUserRequest(
    id: 3,
    name: 'asdf',
    email: 'asdfasdf',
    createdDate: 'asdfasdfasdfasdfasdfasdfasrewrew'
  );

  var r = await UserClient().getUser(user: user);
  print(r);

  var createUser = CreateUserRequest(
    name: 'asdfasdf',
    email: 'adsfasdf',
    profilePicUrl: 'asdfasdfasdfasdf',
    password: 'asdfasdf',
    createdDate: 'asdfasdfasdfasdfasdfasdfasrewrew'
  );
  var a = await UserClient().createUser(user: createUser);
  print (a);
}

class GrpcClient {
  final ClientChannel _channel;

  GrpcClient()
      : _channel = ClientChannel('localhost',
            port: 50000,
            options: const ChannelOptions(
              credentials: ChannelCredentials.insecure(),
            ));

  ClientChannel get channel => _channel;
  Stream<ConnectionState> get channelState => _channel.onConnectionStateChanged;
}

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
    
    var result = await UserModel(
      id: response.id,
      name: request.name,
      email: request.email,
      profilePicUrl: request.
    );

    return response;
  }

  Future createUser({required CreateUserRequest user}) async {
    late GrpcUsersClient stub;
    stub = GrpcUsersClient(channel,
        options: CallOptions(timeout: Duration(seconds: 30)));
    var request = CreateUserRequest()
      ..name = user.name
      ..email = user.email
      ..profilePicUrl = user.profilePicUrl
      ..password = user.password
      ..createdDate = user.createdDate;
    var response = await stub.createUser(request);
    print(response);
    return response;
  }
}