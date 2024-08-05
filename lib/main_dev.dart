import 'package:example_flutter_app/config/app_config.dart';
import 'package:example_flutter_app/main.dart' as runner;

Future<void> main() async {
  const dev = Flavor.dev;
  await runner.mainApp(dev);
}
