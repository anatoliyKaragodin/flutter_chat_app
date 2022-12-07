﻿part of '../asap_page.dart';

class _AllUsersLayout extends StatefulWidget {
  const _AllUsersLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<_AllUsersLayout> createState() => _AllUsersLayoutState();
}

class _AllUsersLayoutState extends State<_AllUsersLayout> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.colorFFFFFF,
      shape: Border.all(
        color: AppColor.color9E9E9E.withOpacity(0.5),
      ),
      elevation: 0,
      child: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {
          // if (state.chats == null) {}
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              state.chats == null || state.chats == []
                  ? const Center(
                      child: Text('Oops...\nno chats'),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          _SearchField(controller: _searchController),
                          const SizedBox(height: 5),
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 25),
                            itemBuilder: (context, _) => UserCard(
                              selected: false,
                              onTap: () {},
                              name: 'Tony',
                              image:
                                  'https://music.mathwatha.com/wp-content/uploads/2017/08/tonyprofile-300x300.jpg',
                              message:
                                  'This is the long text for example, long text',
                            ),
                            itemCount: state.chats!.length,
                          )
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {}, //=>context.read<ChatBloc>().add(CreateChatEvent(
                        //chat: ChatModel(
                            //localChatId: 1, chatIdMain: 2, friendId: 2),
                     // )),
                  icon: const Icon(Icons.add),
                  label: const Text('Add Chat'),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
