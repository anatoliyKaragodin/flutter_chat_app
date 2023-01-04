﻿import 'package:chat_app/modules/signal_service/river/chat_state.ref.dart';
import 'package:chat_app/modules/signal_service/river/river.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../src/libraries/library_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layouts/chat_list_layout.dart';
import 'layouts/default_user_chat_layout.dart';
import 'layouts/user_chat_layout.dart';

class AsapPage extends StatelessWidget {
  const AsapPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // context.read<ChatBloc>().add(ReadChatEvent());
    context.read<MessageBloc>().add(ReadMessageEvent());
    // print("ChatBloc: ${context.read<ChatBloc>().state.chats}");
    print("MessageBloc: ${context.read<MessageBloc>().state.messages}");
    // TODO: implement listener
    return Consumer(builder: (context, ref, _) {
      var chatPod = ref.watch(River.chatPod);

      return BlocConsumer<MessageBloc, MessageState>(
        listener: (context, messageState) {},
        builder: (context, messageState) {
          // print("chatState: ${chatState.chats}");
          print("messageState: ${messageState.messages}");

          return Row(
            children: [
              // Список чатов
              Expanded(
                child: ref.watch(River.futureChatPod).when(
                      data: (data) => messageState.messages != null
                          ? ChatListLayout(
                              chatModel: data.chats!,
                              messageModel: messageState.messages!)
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
              ),
              //  chats == null
              //     ? const Text('Sorry')
              //     : messageState.messages != null
              //         ? ChatListLayout(
              //             chatModel: ref
              //                 .watch(River.chatPod.notifier)
              //                 .state
              //                 .chats!,
              //             messageModel: messageState.messages!)
              //         : const Center(
              //             child: CircularProgressIndicator(),
              //           )),
              // Чат
              Expanded(
                  flex: 3,
                  child: chatPod.chatId == null || chatPod.chatId == -1
                      ? const DefaultUserChatLayout()
                      : messageState.messages != null
                          ? UserChatLayout(chatId: chatPod.chatId!)
                          : const Center(child: CircularProgressIndicator())),
              // Профиль
              // Expanded(
              //   flex: 2,
              //   child: Container(
              //     height: MediaQuery.of(context).size.height,
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //       color: AppColor.colorFFFFFF,
              //       border: Border.all(
              //         color: AppColor.color9E9E9E.withOpacity(0.5),
              //       ),
              //     ),
              //     child: Text(
              //       'профиль',
              //       style: AppTextStyle.s36Abel,
              //     ),
              //   ),
              // ),
            ],
          );
        },
      );
    });
  }
}
