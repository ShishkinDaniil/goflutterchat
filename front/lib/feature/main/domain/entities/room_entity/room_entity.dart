import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_entity.freezed.dart';
part 'room_entity.g.dart';

@freezed
class RoomEntity with _$RoomEntity {
  const factory RoomEntity({
    required String id,
    required String name,
  }) = _RoomEntity;

  factory RoomEntity.fromJson(Map<String, dynamic> json) =>
      _$RoomEntityFromJson(json);

  factory RoomEntity.toJson(Map<String, dynamic> json) =>
      _$RoomEntityFromJson(json);
}
