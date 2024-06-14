import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String content,
    required String username,
    required MsgType type,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  factory Message.toJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}

enum MsgType {
  @JsonValue("recv")
  recv,
  @JsonValue("self")
  self,
  @JsonValue("def")
  def,
}
