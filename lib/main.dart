import 'dart:io';

import 'ui/pages/library/library_pages.dart';
import 'package:chat_app/src/libraries/library_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:window_size/window_size.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(960, 480));
  }
  await DBHelper.instanse.initDB();
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
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc()..add(ReadUsersEvent()),
        ),
        BlocProvider<ChatBloc>(
          create: (context) =>
              ChatBloc(userBloc: UserBloc())..add(ReadChatEvent()),
        ),
        BlocProvider<MessageBloc>(
          create: (context) =>
              MessageBloc(grpcClient: grpcClient)..add(ReadMessageEvent()),
        ),
        BlocProvider<MessageIdInMainBloc>(
          create: (context) => MessageIdInMainBloc(),
        ),
        BlocProvider(
          create: (context) => ChangeThemeBloc(),
        ),
      ],
      child: BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
        builder: (context, state) {
          if (state.theme == 'lightThemeDeepPurple') {
            final theme = CustomTheme().lightThemeDeepPurple;
            return buildMaterialApp(theme);
          } else if (state.theme == 'lightThemeLightBlue') {
            final theme = CustomTheme().lightThemeLightBlue;
            return buildMaterialApp(theme);
          } else if (state.theme == 'lightThemeOrange') {
            final theme = CustomTheme().lightThemeOrange;
            return buildMaterialApp(theme);
          } else if (state.theme == 'darkThemeLightBlue') {
            final theme = CustomTheme().darkThemeLightBlue;
            return buildMaterialApp(theme);
          } else if (state.theme == 'darkThemeOrange') {
            final theme = CustomTheme().darkThemeOrange;
            return buildMaterialApp(theme);
          } else {
            final theme = CustomTheme().darkThemeDeepPurple;
            return buildMaterialApp(theme);
          }
        },
      ),
    );
  }

  MaterialApp buildMaterialApp(ThemeData theme) {
    return MaterialApp(
      theme: theme,
      title: 'Flutter chat app',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainLayout(),
        '/mainLayout': (context) => const MainLayout(),
        '/Settings page': (context) => const SettingsPage(),
      },
    );
  }
}
