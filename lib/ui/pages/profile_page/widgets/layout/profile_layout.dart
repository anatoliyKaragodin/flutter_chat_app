﻿part of '../../profile_page.dart';

class _ProfileLayout extends StatelessWidget {
  const _ProfileLayout({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var userPod = ref.read(River.userPod.notifier);
      var chatPod = ref.read(River.chatPod.notifier);
      var users = ref.watch(River.userPod).users;
      var userMain;
      for (var user in users!) {
        if (user.userId == UserPref.getUserId) {
          userMain = user;
          break;
        }
      }
      return userMain == null
          ? const Center(
              widthFactor: 100,
              heightFactor: 100,
              child: CircularProgressIndicator())
          : ListView(
              children: [
                // Фон и аватарка
                Stack(
                  children: [
                    const SizedBox(height: 205),
                    // Фон
                    _AppBluredImage(image: userMain.profilePicLink),
                    // Аватарка
                    _UserPic(userPic: userMain.profilePicLink),
                    // Кнопка изменение аву
                    const _ChangeUserPic(),
                    ExitButton(userPod: userPod, chatPod: chatPod),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            userMain.name ?? 'unknow',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          // Кнопка смены имени
                          ButtonChangeName(userMain: userMain)
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Email',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            userMain.email ?? '???',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          ButtonChangeEmail(userMain: userMain)
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ))),
                              onPressed: () {
                                userPod.deleteUser(userMain.userId);

                                print(userMain.userId);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      final userIsDeleted =
                                          userPod.state.isDeleted;
                                      ;
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: SizedBox(
                                          height: 80,
                                          width: 50,
                                          child: Column(
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: userIsDeleted == false
                                                      ? Text(
                                                          'User ${userMain.name} is not deleted')
                                                      : Text(
                                                          'User ${userMain.name} is deleted')),
                                              const DeleteDialogWidget()
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: const Text('Delete user')),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
    });
    // return BlocConsumer<UserBloc, UserState>(
    //   listener: (context, state) {},
    //   builder: (context, state) {
    //     var userMain;
    //     for (var user in state.users!) {
    //       if (user.userId == UserPref.getUserId) {
    //         userMain = user;
    //         break;
    //       }
    //     }

    //     return userMain == null
    //         ? const Center(
    //             widthFactor: 100,
    //             heightFactor: 100,
    //             child: CircularProgressIndicator())
    //         : ListView(
    //             children: [
    //               // Фон и аватарка
    //               Stack(
    //                 children: [
    //                   const SizedBox(height: 205),
    //                   // Фон
    //                   _AppBluredImage(image: userMain.profilePicLink),
    //                   // Аватарка
    //                   _UserPic(userPic: userMain.profilePicLink),
    //                   // Кнопка изменение аву
    //                   const _ChangeUserPic(),
    //                   IconButton(
    //                     onPressed: () async {
    //                       // context.read<ChatBloc>().close();
    //                       //закрыть базу
    //                       context
    //                           .read<UserBloc>()
    //                           .add(ChangeUserEvent(isStartDB: true));
    //                       context.read<UserBloc>().add(ReadUsersEvent());
    //                       context.read<ChatBloc>().add(GetChatIdEvent(-1));
    //                       await DBHelper.instanse.close();
    //                       Future.delayed(const Duration(seconds: 1),
    //                           () => Navigator.of(context).pushNamed('/'));
    //                     },
    //                     icon: const Icon(Icons.arrow_back),
    //                   ),
    //                 ],
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.all(15.0),
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       'Username',
    //                       style: Theme.of(context).textTheme.headline6,
    //                     ),
    //                     const SizedBox(height: 2),
    //                     Row(
    //                       children: [
    //                         Text(
    //                           userMain.name ?? 'unknow',
    //                           style: Theme.of(context).textTheme.bodyText2,
    //                         ),
    //                         // Кнопка смены имени
    //                         ButtonChangeName(userMain: userMain)
    //                       ],
    //                     ),
    //                     const SizedBox(height: 10),
    //                     Text(
    //                       'Email',
    //                       style: Theme.of(context).textTheme.headline6,
    //                     ),
    //                     const SizedBox(height: 2),
    //                     Row(
    //                       children: [
    //                         Text(
    //                           userMain.email ?? '???',
    //                           style: Theme.of(context).textTheme.bodyText2,
    //                         ),
    //                         ButtonChangeEmail(userMain: userMain)
    //                       ],
    //                     ),
    //                     const SizedBox(
    //                       height: 20,
    //                     ),
    //                     Row(
    //                       children: [
    //                         ElevatedButton(
    //                             style: ButtonStyle(
    //                                 shape: MaterialStateProperty.all<
    //                                         RoundedRectangleBorder>(
    //                                     RoundedRectangleBorder(
    //                               borderRadius: BorderRadius.circular(20.0),
    //                             ))),
    //                             onPressed: () {
    //                               context.read<UserBloc>().add(
    //                                   DeleteUserEvent(userId: userMain.userId));
    //                               print(userMain.userId);
    //                               showDialog(
    //                                   context: context,
    //                                   builder: (BuildContext context) {
    //                                     final userIsDeleted = context
    //                                         .watch<UserBloc>()
    //                                         .state
    //                                         .isDeleted;
    //                                     return Dialog(
    //                                       shape: RoundedRectangleBorder(
    //                                         borderRadius:
    //                                             BorderRadius.circular(20.0),
    //                                       ),
    //                                       child: SizedBox(
    //                                         height: 80,
    //                                         width: 50,
    //                                         child: Column(
    //                                           children: [
    //                                             Padding(
    //                                                 padding:
    //                                                     const EdgeInsets.all(8.0),
    //                                                 child: userIsDeleted ==
    //                                                         false
    //                                                     ? Text(
    //                                                         'User ${userMain.name} is not deleted')
    //                                                     : Text(
    //                                                         'User ${userMain.name} is deleted')),
    //                                             const DeleteDialogWidget()
    //                                           ],
    //                                         ),
    //                                       ),
    //                                     );
    //                                   });
    //                             },
    //                             child: const Text('Delete user')),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           );
    //   },
    // );
  }
}
