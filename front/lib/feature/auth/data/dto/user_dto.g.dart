// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      chatId: json['chatId'],
      email: json['email'],
      name: json['name'],
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'chatId': instance.chatId,
      'email': instance.email,
      'name': instance.name,
    };
