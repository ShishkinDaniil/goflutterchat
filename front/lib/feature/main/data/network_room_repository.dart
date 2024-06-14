import 'package:flutter/foundation.dart';
import 'package:front/application/data/dio_container.dart';
import 'package:front/application/di/init_di.dart';
import 'package:front/application/domain/app_config.dart';
import 'package:front/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:front/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:front/feature/main/domain/entities/room_entity/room_entity.dart';
import 'package:front/feature/main/domain/room_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

@Injectable(as: RoomRepository)
@dev
class NetworkRoomRepository implements RoomRepository {
  final DioContainer dioContainer;

  NetworkRoomRepository({required this.dioContainer});

  @override
  Future<void> createRoom({required String name}) async {
    try {
      await dioContainer.dio.post("ws/createRoom", data: {'name': name});
    } catch (_) {
      print(_);
      rethrow;
    }
  }

  @override
  Future<List<RoomEntity>> getRooms() async {
    try {
      final res = await dioContainer.dio.get("ws/getRooms");
      final data = res.data;
      final rooms = List.from(data).map((e) => RoomEntity.fromJson(e)).toList();

      return rooms;
    } catch (_) {
      print(_);
      rethrow;
    }
  }

  @override
  Future<WebSocketChannel> joinRoom({
    required RoomEntity room,
    required UserEntity userEntity,
  }) async {
    try {
      final id = room.id;
      final name = userEntity.name;
      final user = locator.get<AuthCubit>().state.whenOrNull(
            authorized: (userEntity) => userEntity,
          );

      final accessToken = user?.accessToken;
      final chatId = user?.chatId;
      final url = locator.get<AppConfig>().wsUrl;

      WebSocketChannel channel = kIsWeb
          ? await WebSocketChannel.connect(
              Uri.parse(url + "ws/joinRoom/$id?username=$name&userId=$chatId"))
          : await IOWebSocketChannel.connect(
              Uri.parse(url + "ws/joinRoom/$id?username=$name&userId=$chatId"),
              headers: {'Authorization': 'Bearer $accessToken'});

      return channel;
    } catch (_) {
      print(_);
      rethrow;
    }
  }
}
