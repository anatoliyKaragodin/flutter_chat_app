import 'dart:convert';
import 'dart:io';
import 'package:grpc/grpc.dart';
import 'package:server/src/generated/grpc_manager.pbgrpc.dart';

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    print('Id= ');
    return;
  }

  final channel = ClientChannel(
    'localhost',
    port: 50000,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );

  final client = GrpcChatClient(channel);
  int id = int.tryParse(args[0])!;
  final responses = client.connecting(postStream(id));

  try {
    await for (final res in responses) {
      print('[${res.chatIdMain}] ${res.content}');
    }
  } catch (e) {
    print(e);
  } finally {
    await channel.shutdown();
    exit(0);
  }
}

Stream<ConnectRequest> postStream(int id) async* {
  while (true) {
    final lines = stdin.transform(utf8.decoder).transform(const LineSplitter());

    await for (final line in lines) {
      yield ConnectRequest(id: int.tryParse(line));
    }
  }
}
