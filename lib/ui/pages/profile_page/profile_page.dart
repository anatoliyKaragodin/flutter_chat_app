import 'package:blur/blur.dart';
import 'package:chat_app/modules/signal_service/river/chat_ref/chat_notifier.dart';
import 'package:chat_app/modules/signal_service/river/user_ref/user_notifier.dart';
import 'package:chat_app/src/constants/user_constants.dart';
import 'package:chat_app/ui/auth/authorization_page.dart';
import 'package:chat_app/ui/pages/profile_page/repositiry/show_text_field_dialog.dart';
import 'package:chat_app/ui/widgets/custom_dialogs/error_dialog.dart';
import 'package:chat_app/ui/widgets/custom_dialogs/textfield_dialog.dart';
import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import '../../../modules/signal_service/river/river.dart';
import '../../../modules/storage_manager/db_helper/user_path.dart';
import '../../../src/libraries/library_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'widgets/change_user_pic.dart';
part 'widgets/load_method.dart';
part 'widgets/app_blured_image.dart';
part 'widgets/user_picture.dart';
part 'widgets/app_dialog.dart';
part 'widgets/layout/profile_layout.dart';
part 'widgets/exit_button.dart';
part 'widgets/change_user_button.dart';

part 'widgets/delete_dialog_widget.dart';
part 'widgets/avatar_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, _) =>
            ref.read(River.userPod).users?[0].name != null &&
                    ref.read(River.userPod).users?[0].name != ''
                ? const ProfileLayout(key: Key("ProfileLayout"))
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
    );
  }
}
