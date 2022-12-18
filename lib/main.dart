import 'dart:io';

import 'package:chat_app/modules/signal_service/bloc/grpc_connection_bloc/grpc_connection_bloc.dart';
import 'package:chat_app/ui/auth/authorization_page.dart';
import 'package:chat_app/ui/pages/authentication_page/authentication_page.dart';
import 'modules/storage_manager/db_helper/db_helper_start.dart';
import 'ui/pages/library/library_pages.dart';
import 'src/libraries/library_all.dart';
import 'modules/signal_service/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:window_size/window_size.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(960, 480));
  }
  Locator.setUp();

  await UserPref.init();
  await UserPref.restore();
  print("UserPref: ${UserPref.getUserPref}");
  UserPref.getUserPref
      ? await DBHelperStart.instanse.initDB()
      : await DBHelper.instanse.initDB();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GrpcClient grpcClient = GrpcClient();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectionBloc>(
          create: (context) => ConnectionBloc(),
          // lazy: false,
        ),
        BlocProvider(
          create: (_) => GrpcConnectionBloc(grpcClient, ConnectionBloc())
            ..add(
              const GrpcConnectionStarted(),
            ),
          // lazy: false,
        ),
        BlocProvider<UserBloc>(
          create: (context) =>
              UserBloc()..add(ReadUsersEvent(userDb: UserPref.getUserPref)),
        ),
        BlocProvider<ChatBloc>(
          create: (context) => ChatBloc(userBloc: UserBloc())..add(ReadChatEvent()),
        ),
        BlocProvider<MessageBloc>(
          create: (context) => MessageBloc(
              grpcClient: grpcClient,
              grpcConnection: context.read<GrpcConnectionBloc>())
            ..add(ReadMessageEvent()),
        ),
        BlocProvider(
          create: (context) => ChangeThemeBloc(),
        ),
      ],
      child: BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
        builder: (context, state) {
          final ThemeData? theme = state.theme;
          return buildMaterialApp(theme!);
        },
      ),
    );
  }

  MaterialApp buildMaterialApp(ThemeData theme) {
    return MaterialApp(
      theme: theme,
      title: 'Flutter chat app',
      debugShowCheckedModeBanner: false,
      initialRoute:
          !UserPref.getUserPref ? MainLayout.routeName : AuthPage.routeName,
      routes: {
        AuthPage.routeName: (context) => const AuthPage(),
        '/authentication page': (context) => const AuthenticationPage(),
        MainLayout.routeName: (context) => const MainLayout(),
        '/Settings page': (context) => const SettingsPage(),
      },
    );
  }
}
