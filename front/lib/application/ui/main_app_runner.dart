import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:front/application/di/init_di.dart';
import 'package:front/application/domain/app_builder.dart';
import 'package:front/application/domain/app_runner.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

class MainAppRunner implements AppRunner {
  final String env;

  const MainAppRunner(this.env);

  @override
  Future<void> preloadData() async {
    WidgetsFlutterBinding.ensureInitialized();

    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory(),
    );
    initDi(env);
  }

  @override
  Future<void> run(AppBuider appBuider) async {
    await preloadData();

    runApp(appBuider.buildApp());
  }
}
