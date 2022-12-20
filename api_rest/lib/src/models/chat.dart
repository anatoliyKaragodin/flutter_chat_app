import 'dart:convert';

import 'package:api_rest/src/db/db_constants.dart';

Chat articleFromJson(String str) => Chat.fromJson(json.decode(str));

String articleToJson(Chat data) => json.encode(data.toJson());

List<Chat> articlesFromJson(String str) =>
    List<Chat>.from(json.decode(str).map((x) => Chat.fromJson(x)));

String articlesToJson(List<Chat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chat {
  final int chatId;
  final int friend1Id;
  final int friend2Id;
  final String createdDate;
  final String updatedDate;
  final String? deletedDate;
  Chat({
    required this.chatId,
    required this.friend1Id,
    required this.friend2Id,
    required this.createdDate,
    required this.updatedDate,
    this.deletedDate,
  });

  Chat copyWith({
    int? chatId,
    int? friend1Id,
    int? friend2Id,
    String? createdDate,
    String? updatedDate,
    String? deletedDate,
  }) {
    return Chat(
      chatId: chatId ?? this.chatId,
      friend1Id: friend1Id ?? this.friend1Id,
      friend2Id: friend2Id ?? this.friend2Id,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
      deletedDate: deletedDate ?? this.deletedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      DatabaseConstants.chatsColumnChatId: chatId,
      DatabaseConstants.chatsColumnUser1Id: friend1Id,
      DatabaseConstants.chatsColumnUser2Id: friend2Id,
      DatabaseConstants.chatsColumnCreatedDate: createdDate,
      DatabaseConstants.chatsColumnUpdatedDate: updatedDate,
      DatabaseConstants.chatsColumnDeletedDate: deletedDate,
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      chatId: map[DatabaseConstants.chatsColumnChatId] as int,
      friend1Id: map[DatabaseConstants.chatsColumnUser1Id] as int,
      friend2Id: map[DatabaseConstants.chatsColumnUser2Id] as int,
      createdDate: map[DatabaseConstants.chatsColumnCreatedDate] as String,
      updatedDate: map[DatabaseConstants.chatsColumnUpdatedDate] as String,
      deletedDate: map[DatabaseConstants.chatsColumnDeletedDate] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Chat.fromJson(String source) => Chat.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatDto(localChatId: $chatId, friend1Id: $friend1Id, friend2Id: $friend2Id, createdDate: $createdDate, updatedDate: $updatedDate, deletedDate: $deletedDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chat &&
        other.chatId == chatId &&
        other.friend1Id == friend1Id &&
        other.friend2Id == friend2Id &&
        other.createdDate == createdDate &&
        other.updatedDate == updatedDate &&
        other.deletedDate == deletedDate;
  }

  @override
  int get hashCode =>
      chatId.hashCode ^
      friend1Id.hashCode ^
      friend2Id.hashCode ^
      createdDate.hashCode ^
      updatedDate.hashCode ^
      deletedDate.hashCode;
}
