import 'package:chat_app/domain/data/dto/user_dto/user_dto.dart';
import 'package:chat_app/modules/storage_manager/db_helper/user_path.dart';
import 'package:equatable/equatable.dart';

class UserStateRef extends Equatable {
  final List<UserDto>? users;
  final bool? userDb;
  final bool? isDeleted;
  const UserStateRef({
    this.users,
    this.userDb,
    this.isDeleted,
  });

  UserStateRef copyWith({
    List<UserDto>? users,
    bool? isDeleted,
  }) {
    return UserStateRef(
      users: users ?? this.users,
      isDeleted: isDeleted,
    );
  }

  bool get userDbthis => UserPref.getUserDbPref;

  @override
  List<Object?> get props => [users, isDeleted];
}
