part of 'chat_screen_bloc.dart';

@immutable
abstract class ChatScreenEvent extends Equatable {
  const ChatScreenEvent();

  @override
  bool get stringify => true;
}

final class ChatScreenShown extends ChatScreenEvent {
  const ChatScreenShown();
  @override
  List<Object?> get props => [];
}

final class ChatScreenAddMessage extends ChatScreenEvent {
  final String message;
  const ChatScreenAddMessage(this.message);
  @override
  List<Object?> get props => [message];
}

final class ChatScreenChanged extends ChatScreenEvent {
  const ChatScreenChanged();
  @override
  List<Object?> get props => [];
}
