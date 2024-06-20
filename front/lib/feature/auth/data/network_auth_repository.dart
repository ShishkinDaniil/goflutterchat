import 'package:front/application/data/dio_container.dart';
import 'package:front/feature/auth/data/dto/token_dto.dart';
import 'package:front/feature/auth/data/dto/user_dto.dart';
import 'package:front/feature/auth/domain/auth_repository.dart';
import 'package:front/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
@dev
class NetworkAuthRepository implements AuthRepository {
  final DioContainer dioContainer;

  NetworkAuthRepository({required this.dioContainer});
  @override
  Future<UserDto> getProfile() async {
    try {
      final res = await dioContainer.dio.get("getProfile");

      final user = UserDto.fromJson(res.data);
      return user;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future passwordUpdate({
    required String oldPassword,
    required String newPassword,
  }) {
    // TODO: implement passwordUpdate
    throw UnimplementedError();
  }

  @override
  Future<TokenDto> refreshToken({String? refreshToken}) async {
    try {
      final res = await dioContainer.dio.post("refresh-token", data: {
        "refreshToken": refreshToken,
      });

      final token = TokenDto.fromJson(res.data);
      return token;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> signIn(
      {required String password, required String email}) async {
    try {
      final res = await dioContainer.dio.post("login", data: {
        "email": email,
        "password": password,
      });

      final userDto = UserDto.fromJson(res.data);
      return userDto.toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> signUp({
    required String password,
    required String email,
    required String name,
  }) async {
    try {
      final res = await dioContainer.dio.post("signup", data: {
        "email": email,
        "password": password,
        "name": name,
      });

      final userDto = UserDto.fromJson(res.data);
      return userDto.toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future userUpdate({String? name, String? email}) {
    // TODO: implement userUpdate
    throw UnimplementedError();
  }
}
