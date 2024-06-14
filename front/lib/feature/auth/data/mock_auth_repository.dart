import 'package:front/feature/auth/domain/auth_repository.dart';
import 'package:front/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
@test
class MockAuthRepository implements AuthRepository {
  @override
  Future getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future passwordUpdate(
      {required String oldPassword, required String newPassword}) {
    // TODO: implement passwordUpdate
    throw UnimplementedError();
  }

  @override
  Future refreshToken({required String? refreshToken}) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future signIn({required String password, required String email}) {
    return Future.delayed(const Duration(seconds: 2), () {
      return UserEntity(email: email, name: 'test-name', chatId: 'id');
    });
  }

  @override
  Future signUp({
    required String password,
    required String email,
    required String name,
  }) {
    return Future.delayed(const Duration(seconds: 2), () {
      return UserEntity(email: email, name: name, chatId: 'id');
    });
  }

  @override
  Future userUpdate({String? name, String? email}) {
    // TODO: implement userUpdate
    throw UnimplementedError();
  }
}
