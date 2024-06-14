// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      content: json['content'] as String,
      username: json['username'] as String,
      type: $enumDecode(_$MsgTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'username': instance.username,
      'type': _$MsgTypeEnumMap[instance.type]!,
    };

const _$MsgTypeEnumMap = {
  MsgType.recv: 'recv',
  MsgType.self: 'self',
  MsgType.def: 'def',
};
