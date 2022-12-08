﻿part of '../asap_page.dart';

class _ChatListLayout extends StatefulWidget {
  const _ChatListLayout({
    Key? key,
    required this.chatModel,
    required this.messageModel,
  }) : super(key: key);

  final List<ChatModel> chatModel;
  final List<MessageModel> messageModel;
  @override
  State<_ChatListLayout> createState() => _ChatListLayoutState();
}

class _ChatListLayoutState extends State<_ChatListLayout> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: Border.all(),
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.chatModel.isEmpty || widget.chatModel == []
                ? const Center(
                    child: Text('Oops...\nno chats'),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        _SearchField(controller: _searchController),
                        const SizedBox(height: 5),
                        ListView.separated(
                          itemCount: widget.chatModel.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 25),
                          itemBuilder: (context, index) {
                            var friendId = widget.chatModel[index].friendId - 1;
                            var lastMessageId = widget.messageModel.isEmpty
                                ? 0
                                : widget.messageModel.length - 1;
                            return UserCard(
                              selected: false,
                              onTap: () {
                                context.read<ChatBloc>().add(GetChatIdEvent(
                                    friendId,
                                    widget.chatModel[index].localChatId));
                              },
                              name: context
                                  .read<UserBloc>()
                                  .state
                                  .users![friendId]
                                  .name,
                              image: context
                                  .read<UserBloc>()
                                  .state
                                  .users![friendId]
                                  .profilePicLink,
                              message: widget.messageModel.isNotEmpty
                                  ? widget.messageModel[lastMessageId].content
                                  : '',
                            );
                          },
                        )
                      ],
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed:
                    () {}, //=>context.read<ChatBloc>().add(CreateChatEvent(
                //chat: ChatModel(
                //localChatId: 1, chatIdMain: 2, friendId: 2),
                // )),
                icon: const Icon(Icons.add),
                label: const Text('Add Chat'),
              ),
            )
          ],
        ));
  }
}
