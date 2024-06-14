part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.roomCreated(String name) = _RoomCreated;
  const factory HomeEvent.refresh() = _Refresh;
  const factory HomeEvent.roomJoinden(
      UserEntity userEntity, RoomEntity roomEntity) = _RoomJoined;
}
