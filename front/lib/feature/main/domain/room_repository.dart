abstract class RoomRepository {
  Future<dynamic> getRooms({
    required String password,
    required String email,
    required String name,
  });
  Future<dynamic> createRoom({
    required String password,
    required String email,
  });

  Future<dynamic> joinRoom({
    String name,
    String email,
  });
}
