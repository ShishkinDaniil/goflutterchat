import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_dto.g.dart';

@JsonSerializable()
class RoomDto {
  final dynamic id;
  final dynamic name;

  RoomDto({required this.id, required this.name});
  factory RoomDto.fromJson(Map<String, dynamic> json) =>
      _$RoomDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RoomDtoToJson(this);
}
