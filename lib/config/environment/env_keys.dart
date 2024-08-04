import 'package:example_flutter_app/config/app_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvKeys {
  EnvKeys._();

  static Future<void> loadEnv(Flavor flavor) async {
    switch (flavor) {
      case Flavor.dev:
        await dotenv.load(fileName: '.env.dev');
        break;
      case Flavor.prod:
        await dotenv.load(fileName: '.env');
        break;
      default:
        await dotenv.load(fileName: '.env.example');
        break;
    }
  }
  
  static String get apiKey => dotenv.get('API_KEY');
  static String get baseUrl => dotenv.get('BASE_URL');
}
