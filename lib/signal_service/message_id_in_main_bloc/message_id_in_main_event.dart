part of 'message_id_in_main_bloc.dart';

abstract class MessageIdInMainEvent {}

class CreateMessageIdInMainEvent extends MessageIdInMainEvent {
  final MessageIdInMainModel messageIdInMain;

  CreateMessageIdInMainEvent({
    required this.messageIdInMain,
  });
}

