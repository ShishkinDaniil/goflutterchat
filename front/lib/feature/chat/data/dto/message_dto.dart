import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/feature/chat/domain/entities/message/message.dart';

part 'message_dto.g.dart';

@JsonSerializable()
class MessageDto {
  final dynamic content;
  final dynamic roomId;
  final dynamic username;
  final dynamic chatId;

  MessageDto(
    this.content,
    this.roomId,
    this.username,
    this.chatId,
  );

  factory MessageDto.fromJson(Map<String, dynamic> json) =>
      _$MessageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MessageDtoToJson(this);

  Message toMessage(String userChatId) {
    return Message(
        content: content,
        username: username,
        type: _getType(content, userChatId, chatId));
  }

  MsgType _getType(String content, String chatUserId, String chatId) {
    if (content == 'A new user has joined the room' ||
        content == 'user left the chat') {
      return MsgType.def;
    } else if (chatId == chatUserId) {
      return MsgType.self;
    } else {
      return MsgType.recv;
    }
  }
}
