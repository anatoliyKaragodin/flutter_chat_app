part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final List<ChatDto>? chats;
  final int? chatId;
  final int? localChatId;

  const ChatState({this.chats, this.chatId, this.localChatId});

  ChatState copyWith({List<ChatDto>? chats, int? chatId, int? localChatId}) {
    return ChatState(
      chats: chats ?? this.chats,
      chatId: chatId ?? this.chatId,
      localChatId: localChatId ?? this.localChatId,
    );
  }

  @override
  List<Object?> get props => [chats, chatId, localChatId];
}
