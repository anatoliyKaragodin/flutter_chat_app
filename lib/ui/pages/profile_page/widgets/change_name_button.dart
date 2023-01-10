﻿part of '../profile_page.dart';

class ButtonChangeName extends ConsumerWidget {
  const ButtonChangeName({
    Key? key,
    required this.userMain,
  }) : super(key: key);

  final UserDto userMain;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var userPod = ref.read(River.userPod.notifier);

    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController newNameController = TextEditingController();
              return TextFieldDialog(
                controller: newNameController,
                userMain: userMain,
                userPod: userPod,
                text: 'Insert new name',
                onPressed: () {
                  if (newNameController.text.isNotEmpty) {
                    String updatedDate = DateTime.now().toIso8601String();
                    late String newName = newNameController.text;
                    var updatedUser = UserDto(
                        userId: userMain.userId,
                        name: newName,
                        email: userMain.email,
                        createdDate: userMain.createdDate,
                        profilePicLink: userMain.profilePicLink,
                        updatedDate: updatedDate);
                    userPod.updateUser(updatedUser);
                    userPod.readUser();

                    print(newName);
                    Navigator.pop(context);
                  }
                },
              );
            });
      },
      icon: const Icon(Icons.create_outlined),
      iconSize: 15,
    );
  }
}
