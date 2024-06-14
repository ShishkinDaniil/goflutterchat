import 'package:flutter/foundation.dart';
import 'package:front/application/domain/app_config.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AppConfig)
@dev
class DevAppConfig implements AppConfig {
  @override
  String get baseUrl =>
      kIsWeb ? "http://127.0.0.1:8080/" : "http://10.0.2.2:8080/";

  @override
  String get wsUrl => kIsWeb ? "ws://127.0.0.1:8080/" : "ws://10.0.2.2:8080/";

  @override
  String get host => Environment.dev;
}

@Singleton(as: AppConfig)
@test
class TestAppConfig implements AppConfig {
  @override
  String get baseUrl => "http://0.0.0.0:8080/";

  @override
  String get wsUrl => "ws://10.0.2.2:8080/";

  @override
  String get host => Environment.test;
}

//
//
//
// @Singleton(as: AppConfig)
// @prod
// class ProdAppConfig implements AppConfig {
//   @override
//   String get baseUrl => "";

//   @override
//   String get host => Environment.prod;
// }
