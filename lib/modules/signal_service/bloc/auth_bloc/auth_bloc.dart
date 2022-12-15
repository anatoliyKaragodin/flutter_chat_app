// import 'dart:async';

// import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'auth_event.dart';
// part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc() : super(const AuthState()) {
//     on<ChangeAuthEvent>(_changeAuthEvent);
//   }

//   FutureOr<void> _changeAuthEvent(
//       ChangeAuthEvent event, Emitter<AuthState> emit) async {
//     emit(state.copyWith(name: event.name));
//     UserPath().setPath(state.name!);
//   }
// }
