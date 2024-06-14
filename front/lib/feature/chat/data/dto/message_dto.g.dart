// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageDto _$MessageDtoFromJson(Map<String, dynamic> json) => MessageDto(
      json['content'],
      json['roomId'],
      json['username'],
      json['chatId'],
    );

Map<String, dynamic> _$MessageDtoToJson(MessageDto instance) =>
    <String, dynamic>{
      'content': instance.content,
      'roomId': instance.roomId,
      'username': instance.username,
      'chatId': instance.chatId,
    };
