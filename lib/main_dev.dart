import 'package:fortune_teller/config/app_config.dart';

import 'main.dart' as runner;

Future<void> main() async {
  AppConfig.flavor = Flavor.dev;
  await runner.main();
}
