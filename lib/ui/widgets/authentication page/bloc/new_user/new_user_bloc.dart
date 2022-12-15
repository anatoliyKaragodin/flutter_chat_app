import 'package:bloc/bloc.dart';
import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/client/users_client.dart';

import 'new_user_event.dart';
import 'new_user_state.dart';

class NewUserBloc extends Bloc<NewUserEvent, NewUserState> {
  NewUserBloc()
      : super(NewUserState(
            newUser: UserDto(
                name: '',
                email: "",
                password: "",
                updatedDate: "",
                registrationDate: "",
                profilePicLink: ''))) {
    on<SetNewUserEvent>(_setNewUserEvent);
  }

  void _setNewUserEvent(
      SetNewUserEvent event, Emitter<NewUserState> emit) async {
    UserDto newCreatedUser = await UserClient().createUser(user: event.user);
    emit(NewUserState(newUser: newCreatedUser));
  }
}