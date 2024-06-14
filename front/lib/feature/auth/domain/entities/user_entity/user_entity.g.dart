// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      email: json['email'] as String,
      name: json['name'] as String,
      chatId: json['chatId'] as String,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'chatId': instance.chatId,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
