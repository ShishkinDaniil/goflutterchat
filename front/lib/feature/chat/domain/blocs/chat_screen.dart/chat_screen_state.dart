part of 'chat_screen_bloc.dart';

@immutable
abstract class ChatScreenState extends Equatable {
  const ChatScreenState();

  @override
  bool get stringify => true;
}

final class ChatScreenInitial extends ChatScreenState {
  const ChatScreenInitial();

  @override
  List<Object> get props => [];
}

final class ChatScreenLoadSuccess extends ChatScreenState {
  final List<Message> messages;
  const ChatScreenLoadSuccess(this.messages);

  @override
  List<Object> get props => [messages];
}

final class ChatScreenError extends ChatScreenState {
  const ChatScreenError();

  @override
  List<Object> get props => [];
}

final class ChatScreenLoadInProgress extends ChatScreenState {
  const ChatScreenLoadInProgress();

  @override
  List<Object> get props => [];
}

final class ChatScreenUpdated extends ChatScreenState {
  const ChatScreenUpdated();

  @override
  List<Object> get props => [];
}

final class ChatScreenDone extends ChatScreenState {
  const ChatScreenDone();
  @override
  List<Object?> get props => [];
}
