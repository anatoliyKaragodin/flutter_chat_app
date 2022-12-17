import 'package:chat_app/modules/signal_service/bloc/grpc_connection_bloc/grpc_connection_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../src/libraries/library_all.dart';
import '../widgets/library/library_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebarx/sidebarx.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});
  static const routeName = '/';

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final _sideBarController =
      SidebarXController(selectedIndex: 0, extended: true);

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    var isConnected = false;
    return Scaffold(
      body: BlocListener<ConnectionBloc, ConnectionStatusState>(
        listener: (context, state) {
          if (state is InActiveConnectionState) {
            showDialogBox(
              context,
              state.message,
              isConnected,
            );
          }
        },
        child: BlocListener<GrpcConnectionBloc, GrpcConnectionState>(
          listener: (context, state) {
            switch (state.connectState) {
              case GrpcConnectState.connecting:
                print('connecting: ${state.connectState} ');
                break;
              case GrpcConnectState.ready:
                print('ready: ${state.connectState} ');
                break;
              case GrpcConnectState.idle:
                print('idle: ${state.connectState} ');
                break;
              case GrpcConnectState.shutdown:
                print('shutdown: ${state.connectState} ');
                break;
              case GrpcConnectState.transientFailure:
                print('transientFailure: ${state.connectState} ');
                break;
              default:
                print('default: ${state.connectState} ');
            }
          },
          child: SafeArea(
            child: Row(
              children: [
                // Боковое меню
                currentWidth > 1276
                    ? Expanded(
                        child: SideMenuWidget(controller: _sideBarController))
                    : SideMenuWidget(controller: _sideBarController),
                // Экраны
                Expanded(
                  flex: 7,
                  child: PageControllerWidget(controller: _sideBarController),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

showDialogBox(BuildContext context, String message, isConnected) {
  return showCupertinoDialog<dynamic>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('No Connection'),
      content: Text(message),
      actions: [
        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size.fromHeight(30)),
          ),
          onPressed: () async {
            Navigator.pop(context, 'Cancel');
            isConnected = await InternetConnectionChecker().hasConnection;
            if (!isConnected) {
              showDialogBox(context, message, isConnected);
            }
          },
          child: Text('Ok'.toUpperCase()),
        ),
      ],
    ),
  );
}
