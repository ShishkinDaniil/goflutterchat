part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.success(List<RoomEntity> rooms) = _Success;
  const factory HomeState.loadInProgress() = _LoadInProgress;
  const factory HomeState.joinRoom(
    WebSocketChannel webSocketChannel,
    UserEntity userEntity,
    RoomEntity roomEntity,
  ) = _JoinRoom;
}
