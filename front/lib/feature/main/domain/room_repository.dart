import 'package:front/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:front/feature/main/domain/entities/room_entity/room_entity.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class RoomRepository {
  Future<List<RoomEntity>> getRooms();
  Future<dynamic> createRoom({
    required String name,
  });

  Future<WebSocketChannel> joinRoom({
    required RoomEntity room,
    required UserEntity userEntity,
  });
}
