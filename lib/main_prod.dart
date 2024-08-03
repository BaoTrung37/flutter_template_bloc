import 'package:example_flutter_app/config/app_config.dart';

import 'main.dart' as runner;

Future<void> main() async {
  AppConfig.flavor = Flavor.prod;
  await runner.main();
}
