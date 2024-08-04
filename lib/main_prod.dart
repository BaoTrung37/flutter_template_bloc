import 'package:example_flutter_app/config/app_config.dart';
import 'package:example_flutter_app/main.dart' as runner;

Future<void> main() async {
  const prod = Flavor.prod;
  await runner.mainApp(prod);
}
