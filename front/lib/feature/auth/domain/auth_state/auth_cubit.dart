import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:front/application/domain/error_entity/error_entity.dart';
import 'package:front/feature/auth/data/dto/token_dto.dart';
import 'package:front/feature/auth/data/dto/user_dto.dart';
import 'package:front/feature/auth/domain/auth_repository.dart';
import 'package:front/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';
part 'auth_cubit.g.dart';

@Singleton(order: 1)
class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthState.notAuthorized());

  final AuthRepository authRepository;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(AuthState.waiting());
    try {
      final UserEntity userEntity =
          await authRepository.signIn(password: password, email: email);
      emit(AuthState.authorized(userEntity));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  Future<void> refreshToken() async {
    final user = state.whenOrNull(
      authorized: (userEntity) => userEntity,
    );
    if (user != null) {
      try {
        final TokenDto token = await authRepository.refreshToken(
          refreshToken: user.refreshToken,
        );
        emit(
          AuthState.authorized(
            user.copyWith(
              accessToken: token.accessToken,
              refreshToken: token.refreshToken,
            ),
          ),
        );
      } catch (error, stackTrace) {
        addError(error, stackTrace);
      }
    } else {
      emit(AuthState.notAuthorized());
    }
  }

  Future<void> getProfile() async {
    final user = state.whenOrNull(
      authorized: (userEntity) => userEntity,
    );
    if (user != null) {
      try {
        final UserDto userDto = await authRepository.getProfile();
        emit(
          AuthState.authorized(
            user.copyWith(
              email: userDto.email,
              name: userDto.name,
            ),
          ),
        );
      } catch (error, stackTrace) {
        addError(error, stackTrace);
      }
    } else {
      emit(AuthState.notAuthorized());
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthState.waiting());
    try {
      final UserEntity userEntity = await authRepository.signUp(
        password: password,
        email: email,
        name: name,
      );
      emit(AuthState.authorized(userEntity));
    } catch (error, stackTrace) {
      addError(error, stackTrace);
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    final state = AuthState.fromJson(json);
    return state.whenOrNull(
        authorized: (userEntity) => AuthState.authorized(userEntity));
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state
            .whenOrNull(
                authorized: (userEntity) => AuthState.authorized(userEntity))
            ?.toJson() ??
        AuthState.notAuthorized().toJson();
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(AuthState.error(error));
    super.addError(error, stackTrace);
  }
}

extension HomeBlocExtension on BuildContext {
  AuthCubit get authCubit {
    try {
      return BlocProvider.of(this);
    } catch (e, st) {
      rethrow;
    }
  }
}
