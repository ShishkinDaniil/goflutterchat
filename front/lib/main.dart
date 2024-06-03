import 'application/ui/main_app_builder.dart';
import 'application/ui/main_app_runner.dart';

void main() {
  const env = String.fromEnvironment("env", defaultValue: "dev");
  const runner = MainAppRunner(env);
  final builder = MainAppBuilder();

  runner.run(builder);
}
