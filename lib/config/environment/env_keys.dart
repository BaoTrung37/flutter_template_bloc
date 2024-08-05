import 'package:example_flutter_app/config/app_config.dart';
import 'package:example_flutter_app/gen/assets.gen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvKeys {
  static Future<void> loadEnv(Flavor flavor) async {
    switch (flavor) {
      case Flavor.dev:
        await dotenv.load(fileName: Assets.env.aEnvDev);
        break;
      case Flavor.prod:
        await dotenv.load(fileName: Assets.env.aEnv);
        break;
      default:
        await dotenv.load(fileName: Assets.env.aEnvExample);
        break;
    }
  }

  static String get apiKey => dotenv.get('API_KEY');
  static String get baseUrl => dotenv.get('BASE_URL');
  static String get token => dotenv.get('TOKEN');
}
