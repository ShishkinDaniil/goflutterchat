import 'package:flutter/material.dart';

import 'application/ui/main_app_builder.dart';
import 'application/ui/main_app_runner.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const env = String.fromEnvironment("env", defaultValue: "dev");
  const runner = MainAppRunner(env);
  const builder = MainAppBuilder();

  runner.run(builder);
}
