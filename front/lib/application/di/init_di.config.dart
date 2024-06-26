// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:front/application/data/dio_container.dart' as _i7;
import 'package:front/application/data/main_app_config.dart' as _i4;
import 'package:front/application/domain/app_config.dart' as _i3;
import 'package:front/feature/auth/data/mock_auth_repository.dart' as _i6;
import 'package:front/feature/auth/data/network_auth_repository.dart' as _i10;
import 'package:front/feature/auth/domain/auth_repository.dart' as _i5;
import 'package:front/feature/auth/domain/auth_state/auth_cubit.dart' as _i11;
import 'package:front/feature/main/data/network_room_repository.dart' as _i9;
import 'package:front/feature/main/domain/room_repository.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

const String _dev = 'dev';
const String _test = 'test';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppConfig>(
      () => _i4.DevAppConfig(),
      registerFor: {_dev},
    );
    gh.singleton<_i3.AppConfig>(
      () => _i4.TestAppConfig(),
      registerFor: {_test},
    );
    gh.factory<_i5.AuthRepository>(
      () => _i6.MockAuthRepository(),
      registerFor: {_test},
    );
    gh.singleton<_i7.DioContainer>(() => _i7.DioContainer(gh<_i3.AppConfig>()));
    gh.factory<_i8.RoomRepository>(
      () => _i9.NetworkRoomRepository(dioContainer: gh<_i7.DioContainer>()),
      registerFor: {_dev},
    );
    gh.factory<_i5.AuthRepository>(
      () => _i10.NetworkAuthRepository(dioContainer: gh<_i7.DioContainer>()),
      registerFor: {_dev},
    );
    gh.singleton<_i11.AuthCubit>(
        () => _i11.AuthCubit(gh<_i5.AuthRepository>()));
    return this;
  }
}
