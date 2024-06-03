import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_dto.g.dart';

@JsonSerializable()
class TokenDto {
  final dynamic accessToken;
  final dynamic refreshToken;

  TokenDto({this.accessToken, this.refreshToken});

  factory TokenDto.fromJson(Map<String, dynamic> json) =>
      _$TokenDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDtoToJson(this);
}
