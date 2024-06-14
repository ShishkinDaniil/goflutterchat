import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/feature/auth/domain/entities/user_entity/user_entity.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  final dynamic accessToken;
  final dynamic refreshToken;
  final dynamic chatId;
  final dynamic email;
  final dynamic name;

  UserDto({
    this.accessToken,
    this.refreshToken,
    this.chatId,
    this.email,
    this.name,
  });
  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
  UserEntity toEntity() {
    return UserEntity(
      chatId: chatId,
      email: email,
      name: name,
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
